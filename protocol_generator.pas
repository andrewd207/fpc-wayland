{ <protocol_generator.pas>

  Copyright (C) <2018> <Andrew Haines> <andrewd207@aol.com>

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
  Boston, MA 02110-1335, USA.
}

unit protocol_generator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, wayland_xml, fgl;

type

  { TGenerator }

  TSection = (sPrivateConst, sClassForward, sClasses, sTypes, sFuncs, sVars, sImplementation, sInterfacePointers, sPrivateVar, sListenerDecl, sListenerImpl, sListenerBind, sClassImpl ,sRequestandEvents, sInit, sFinalize);



  TNodeList = specialize TFPGObjectList <TBaseNode>;

  TGenerator = class
  private
    FProtocol: TProtocol;
    Sections: array[TSection] of TStrings;
    FImplementInterfaceVars: Boolean;
    function Pascalify(AName: String): String;

    function ArgToArg(AArg: TArg; APascalify: Boolean; var ANeedsWrapper: Boolean;
      AFixedAsTWL_Fixed: Boolean = True): String;
    function ArgTypeToPascalType(AType: String; AInterface: String;
      APascalify: Boolean; var ANeedsWrapper: Boolean; AFixedAsTWL_Fixed: Boolean = True): String;

    procedure ArgsToSig(Element: TBaseNode; AData: Pointer{PString});
    procedure ArgTypesToInterfacePointer(Element: TBaseNode; AData: Pointer);
    procedure CollectArgs(Element: TBaseNode; AData: Pointer{TArgList});
    procedure CollectEntries(Element: TBaseNode; AData: Pointer);
    procedure CollectEnums(Element: TBaseNode; AData: Pointer);
    procedure CollectEventsForListener(Element: TBaseNode; AData: Pointer{TNodeList});
    procedure DeclareInterfaceTypes(Element: TBaseNode; AData: Pointer);
    procedure DeclareInterfaceVars(Element: TBaseNode; AData: Pointer);
    procedure HandleInterface(Element: TInterface);

    procedure GenerateListener(Element: TInterface);

    procedure WriteRequestConsts(Element: TBaseNode; AData: Pointer{TInterface});
    procedure WriteRequestImplmentation(Element: TBaseNode; Adata: Pointer{TInterface});
    procedure WriteRequestImplmentationObjects(Element: TBaseNode; Adata: Pointer{TInterface});
    procedure WriteListenerObjectMethod(Element: TInterface);
    procedure WriteWaylandRequestorEventInterface(Element: TBaseNode; AData: Pointer);

  public
    constructor Create(AFileName: String);
    procedure Generate(AUnitName: String; Strings: TStrings; ImplementInterfaceVars: Boolean = True);
  end;

implementation

procedure TrimLastChar(AStrings: TStrings);
var
  lLine: String;
begin
  // trim the extra comma ","
  lLine:=AStrings[AStrings.Count-1];
  lLine:=Copy(lLine, 1, Length(lLine)-1);
  AStrings[AStrings.Count-1] := lLine;
end;

{ TGenerator }

procedure TGenerator.HandleInterface(Element: TInterface);
var
  lLine: String;
  lInterfaceVar: String;
  lRequestCount, lEventCount, lIndex: Integer;
  lEventConstName: String = 'nil';
  lRequestConstName: String = 'nil';
  lParentClass: String;
begin
  // global vars :(

  DeclareInterfaceVars(Element, nil);
  lInterfaceVar := Element.Name+'_interface';

  case Element.Name of
    'wl_display'  : lParentClass:='TWlDisplayBase';
    'wl_shm'      : lParentClass:='TWlShmBase';
    'wl_shm_pool' : lParentClass:='TWlShmPoolBase';
  else
    lParentClass:='TWLProxyObject';

  end;

  //Sections[sClassForward].Add('  T'+Pascalify(Element.Name)+'Class = class of T'+Pascalify(Element.Name)+';');
  Sections[sClassForward].Add('  T'+Pascalify(Element.Name)+' = class;');
  Sections[sClasses].Add('');
  Sections[sClasses].Add('  T'+Pascalify(Element.Name)+' = class('+lParentClass+')');

  if Element.HasRequests then
  begin
    Sections[sClasses].Add('  private');
    Element.ForEachRequest(@WriteRequestConsts, Element);
    Sections[sClasses].Add('  public');
    // disable flat api and use objects instead
    //Element.ForEachRequest(@WriteRequestImplmentation, Element);
    Element.ForEachRequest(@WriteRequestImplmentationObjects, Element);
  end;

  WriteListenerObjectMethod(Element);

  Sections[sClasses].Add('  end;');

  // handles events
  GenerateListener(Element);

  if FImplementInterfaceVars then
  begin
    // requests
    lIndex := Sections[sRequestandEvents].Count;
    lRequestCount := Element.ForEachRequest(@WriteWaylandRequestorEventInterface, Element);
    if lRequestCount > 0 then
    begin
      // get rid of comma
      TrimLastChar(Sections[sRequestandEvents]);

      lRequestConstName := Element.Name+'_requests';
      Sections[sRequestandEvents].Insert(lIndex,
        Format('  %s: array[0..%d] of Twl_message = (', [lRequestConstName, lRequestCount-1]));
      Sections[sRequestandEvents].Add('  );');
      lRequestConstName := '@'+lRequestConstName;
    end;

    //events
    lIndex := Sections[sRequestandEvents].Count;
    lEventCount   := Element.ForEachEvent  (@WriteWaylandRequestorEventInterface, Element);
    if lEventCount > 0 then
    begin
      // get rid of comma
      TrimLastChar(Sections[sRequestandEvents]);
      lEventConstName:=Element.Name+'_events';
      Sections[sRequestandEvents].Insert(lIndex,
        Format('  %s: array[0..%d] of Twl_message = (', [lEventConstName, lEventCount-1]));
      Sections[sRequestandEvents].Add('  );');
      lEventConstName := '@'+lEventConstName;
    end;

    Sections[sInit].Add(Format('  %s.name := ''%s'';',     [lInterfaceVar, Element.Name]));
    Sections[sInit].Add(Format('  %s.version := %s;',      [lInterfaceVar, Element.Version]));
    Sections[sInit].Add(Format('  %s.method_count := %d;', [lInterfaceVar, lRequestCount]));
    Sections[sInit].Add(Format('  %s.methods := %s;',      [lInterfaceVar, lRequestConstName]));
    Sections[sInit].Add(Format('  %s.event_count := %d;',  [lInterfaceVar, lEventCount]));
    Sections[sInit].Add(Format('  %s.events := %s;',       [lInterfaceVar, lEventConstName]));
    Sections[sInit].Add('');
  end;



  if Element.HasEvents then
  begin
    WriteLn('Interface with events: ', Element.Name);
  end
  else
  begin
    WriteLn('Interface NO events: ', Element.Name);
  end;


end;

procedure TGenerator.CollectEventsForListener(Element: TBaseNode; AData: Pointer
  );
var
  lList: TNodeList absolute AData;
  lEvent: TEvent;
begin
  lEvent := TEvent.Create(nil);
  lEvent.Assign(Element);
  lList.Add(lEvent);
  Tevent(Element).ForEachArg(@CollectArgs, AData);
end;

procedure TGenerator.DeclareInterfaceTypes(Element: TBaseNode; AData: Pointer);
begin
  Sections[sTypes].Add('  P'+Element.Name+' = Pointer;');
  //Sections[sTypes].Add('  P'+Element.Name+' = ^T'+Element.Name+';');
  //Sections[sTypes].Add('  T'+Element.Name+' = record end;');
end;

procedure TGenerator.DeclareInterfaceVars(Element: TBaseNode; AData: Pointer);
var
  lInterfaceVar, lLine: String;
begin
  // global vars :(
  lInterfaceVar := Element.Name+'_interface';
  lLine := '  '+lInterfaceVar+': Twl_interface;';
  if not FImplementInterfaceVars then
    lLine+=' cvar; external;';
  Sections[sVars].Add(lLine);
end;

procedure TGenerator.CollectEnums(Element: TBaseNode; AData: Pointer);
var
  lList: TNodeList absolute AData;
  lEnum: TEnum;
begin
  lEnum := TEnum.Create(nil);
  lEnum.Assign(Element);
  lList.Add(lEnum);
  TEnum(Element).ForEachEntry(@CollectEntries, lList);
end;

procedure TGenerator.CollectEntries(Element: TBaseNode; AData: Pointer);
var
  lList: TNodeList absolute AData;
  lEntry: TEntry;
begin
  lEntry := TEntry.Create(nil);
  lEntry.Assign(Element);
  lList.Add(lEntry);
end;

procedure TGenerator.GenerateListener(Element: TInterface);
var
  lTypeName, lArgs, lIntf, lValue, lName: String;
  lList: TNodeList;
  lNode: TBaseNode;
  lEnum: TEnum;
  lEntry : TEntry;
  lEvent: TEvent;
  lEventName: String;
  lInterfaceName: String;
  //lGUID: TGUID;
  lInterfaceLine: String;
  lWrapperLine: String;
  lWrapperDecl: String;
  lWrapperBind, lWrapperVar, lWrapperVarAssign, lArg, lInterface,
    lInterfaceArg, lComment: String;
  lSince: String;
  lNeedsWrapper: Boolean;
      procedure WriteEvent;
      begin
        Sections[sTypes].Add(lArgs+'); cdecl;');
        Sections[sListenerDecl].Add(lInterfaceLine+');'+ lSince);
        Sections[sListenerImpl].Add(lWrapperDecl+'); cdecl;');
        Sections[sListenerImpl].Add('var');
        Sections[sListenerImpl].Add(lWrapperVar);
        Sections[sListenerImpl].Add('begin');
        Sections[sListenerImpl].Add('  if AData = nil then Exit;');
        Sections[sListenerImpl].Add(lWrapperVarAssign);
        //Sections[sListenerImpl].Add('  WriteLn('''+Element.Name+'.'+lEvent.Name+''');');
        Sections[sListenerImpl].Add(lWrapperLine+');');
        Sections[sListenerImpl].Add('end;');
        Sections[sListenerImpl].Add('');

        Sections[sListenerBind].Add(lWrapperBind);
        lArgs:='';
        lSince := '';
     end;

begin
  // create type
  if Element.HasEnums then
  begin
    Sections[sTypes].Add('const');
    lList := TNodeList.Create(True);
    Element.ForEachEnum(@CollectEnums, lList);

    for lNode in lList do
    begin
      if lNode is TEnum then
        lEnum := TEnum(lNode)
      else
      begin
        lEntry := TEntry(lNode);
        lValue := lEntry.Value;
        if Pos('0x', lValue) = 1 then
        begin
          Delete(lValue, 1, 2);
          lValue:='$'+  lValue;
        end;
        lComment := lEntry.Summary;
        if lComment <> '' then
          lComment := ' // '+ StringReplace(lComment, '’', '''', [rfReplaceAll]);

        Sections[sTypes].Add('  '+UpperCase(Element.Name+'_'+lEnum.Name+'_'+lEntry.Name)+' = '+lValue +';'+ lComment);
      end;
    end;


    lList.Free;

    Sections[sTypes].Add('');
    Sections[sTypes].Add('type');
  end;

  lTypeName := Element.Name+'_listener';

  //CreateGUID(lGUID);
  lInterfaceName:='I'+Pascalify(Element.Name)+'Listener';
  Sections[sListenerDecl].Add('  '+lInterfaceName+' = interface');
  //Sections[sListenerDecl].Add('  ['''+GUIDToString(lGUID)+''']');
  Sections[sListenerDecl].Add('  ['''+lInterfaceName+''']');

  Sections[sPrivateVar].Add('  vIntf_'+Element.Name+'_Listener: T'+ Element.Name+'_listener;');

  Sections[sTypes].Add('  P'+lTypeName+' = ^T'+lTypeName+';');
  Sections[sTypes].Add('  T'+lTypeName+' = record');

  lList := TNodeList.Create(True);

  Element.ForEachEvent(@CollectEventsForListener, lList);

  lArgs := '';
  lSince := '';
  for lNode in lList do
  begin
    if lNode is TEvent then
    begin
      if lArgs <> '' then
      begin
        WriteEvent;
      end;
      lEvent := TEvent(lNode);

      lEventName := lEvent.Name;
      if (lEventName = 'begin')
      or (lEventName = 'end')
      or (lEventName = 'type') then
        lEventName+= '_';

      lArgs :='    '+ lEventName+' : procedure(data: Pointer; A'+Pascalify(Element.Name)+': P'+Element.Name;

      // for IxxxListener
      lInterfaceLine := '    procedure '+Element.Name+'_'+lEvent.Name+'(A'+Pascalify(Element.Name)+': T'+Pascalify(Element.Name);
      if lEvent.Since <> '' then
        lSince := Format(' {since: %s}', [lEvent.Since]);
      lWrapperVar := '  AIntf: ' + lInterfaceName+';';
      lWrapperVarAssign := '  AIntf := '+lInterfaceName+'(AData^.ListenerUserData);';
      lWrapperDecl   := 'procedure '+Element.Name+'_'+lEvent.Name+'_Intf(AData: PWLUserData; A'+Element.Name+': P'+Element.Name;
      lWrapperLine:= '  AIntf.'+Element.Name+'_'+lEvent.Name+'(T'+Pascalify(Element.Name)+'(AData^.PascalObject)';

      // setting the listener variable
      lWrapperBind := '  Pointer(vIntf_'+Element.Name+'_Listener.'+lEventName+') := @'+Element.Name+'_'+lEvent.Name+'_Intf;';

    end
    else
    begin
      lArg := ArgToArg(TArg(lNode), False, lNeedsWrapper, False);
      lInterfaceArg := ArgToArg(TArg(lNode), True, lNeedsWrapper, True);
      lTypeName:=ArgTypeToPascalType(TArg(lNode).&Type, TArg(lNode).&Interface, True, lNeedsWrapper);


      if TArg(lNode).&Type = 'fixed' then
        lName := 'Twl_fixed(A'+Pascalify(lNode.Name)+')'
      else
        lName := 'A'+Pascalify(lNode.Name);

      if lTypeName = 'String' then
        lTypeName:='Pchar';


      lArgs+='; '+ lArg;
      lInterfaceLine+='; '+lInterfaceArg;
      lWrapperDecl+='; '+lArg;
      if lNeedsWrapper then
      begin
        if TArg(lNode).&Type = 'new_id' then
          lWrapperLine+=',  '+lTypeName+'.Create('+lName+')'
        else
          lWrapperLine+=',  '+lTypeName+'(TWLProxyObject.WLToObj('+lName+'))'
      end
      else
        lWrapperLine+=', '+lName;
    end;

  end;
  if lArgs <> '' then
  begin
    WriteEvent;
  end;

  Sections[sListenerDecl].Add('  end;');
  Sections[sListenerDecl].Add('');

  lList.Free;
  Sections[sTypes].Add('  end;');
  Sections[sTypes].Add('');
  {
  // add listener
  lIntf := 'function  '+Element.Name+'_add_listener('+Element.Name+': P'+Element.Name+'; listener: P'+Element.Name+'_listener; data: Pointer): cint;';
  Sections[sFuncs].Add(lIntf);

  Sections[sImplementation].Add(lIntf);
  Sections[sImplementation].Add('begin');
  Sections[sImplementation].Add('  Result := wl_proxy_add_listener(Pwl_proxy('+Element.Name+'), listener, data);');
  Sections[sImplementation].Add('end;');
  Sections[sImplementation].Add('');

  // add interface listener
  lIntf := 'procedure  '+Element.Name+'_add_listener('+Element.Name+': P'+Element.Name+'; AIntf: '+lInterfaceName+');';
  Sections[sFuncs].Add(lIntf);

  Sections[sImplementation].Add(lIntf);
  Sections[sImplementation].Add('begin');
  Sections[sImplementation].Add('  '+Element.Name+'_add_listener('+Element.Name+', @vIntf_'+Element.Name+'_Listener, AIntf);');
  Sections[sImplementation].Add('end;');
  Sections[sImplementation].Add('');

  // set user data
  lIntf := 'procedure '+Element.Name+'_set_user_data('+Element.Name+': P'+Element.Name+'; user_data: Pointer);';
  Sections[sFuncs].Add(lIntf);
  Sections[sImplementation].Add(lIntf);
  Sections[sImplementation].Add('begin');
  Sections[sImplementation].Add('  wl_proxy_set_user_data(Pwl_proxy('+Element.Name+'), user_data);');
  Sections[sImplementation].Add('end;');
  Sections[sImplementation].Add('');

  // get user data
  lIntf := 'function  '+Element.Name+'_get_user_data('+Element.Name+': P'+Element.Name+'): Pointer;';
  Sections[sFuncs].Add(lIntf);
  Sections[sImplementation].Add(lIntf);
  Sections[sImplementation].Add('begin');
  Sections[sImplementation].Add('  Result := wl_proxy_get_user_data(Pwl_proxy('+Element.Name+'));');
  Sections[sImplementation].Add('end;');
  Sections[sImplementation].Add('');

  // get version
  lIntf := 'function  '+Element.Name+'_get_version('+Element.Name+': P'+Element.Name+'): cuint32;';
  Sections[sFuncs].Add(lIntf);
  Sections[sImplementation].Add(lIntf);
  Sections[sImplementation].Add('begin');
  Sections[sImplementation].Add('  Result := wl_proxy_get_version(Pwl_proxy('+Element.Name+'));');
  Sections[sImplementation].Add('end;');
  Sections[sImplementation].Add('');


  // destroy
  if not Element.DestructorDefined then
  begin
    lIntf := 'procedure '+Element.Name+'_destroy('+Element.Name+': P'+Element.Name+');';
    Sections[sFuncs].Add(lIntf);
    Sections[sImplementation].Add(lIntf);
    Sections[sImplementation].Add('begin');
    Sections[sImplementation].Add('  wl_proxy_destroy(Pwl_proxy('+Element.Name+'));');
    Sections[sImplementation].Add('end;');
    Sections[sImplementation].Add('');
  end;
  }
end;

procedure TGenerator.CollectArgs(Element: TBaseNode; AData: Pointer);
var
  lArgList: TNodeList absolute AData;
  lArg: TArg;
begin
  lArg := TArg.Create(nil);
  lArg.Assign(Element);
  lArgList.Add(lArg);
end;

function TGenerator.Pascalify(AName: String): String;
var
  lPos: SizeInt;
begin
  Result := AName;
  if Result = '' then
    Exit;
  // capitalize the first char if not yet
  Result[1] := UpperCase(Result[1])[1];
  Repeat
    lPos := Pos('_', Result);
    if lPos > 0 then
    begin
      // delete char and capitalize the following one
      Delete(Result, lPos, 1);
      Result[lPos] := UpperCase(Result[lPos])[1];
    end;
  until lPos < 1;
end;

function TGenerator.ArgToArg(AArg: TArg; APascalify: Boolean;
  var ANeedsWrapper: Boolean; AFixedAsTWL_Fixed: Boolean): String;
var
  lName, lType: String;
begin
  lName := 'A'+Pascalify(AArg.Name);
  lType := ArgTypeToPascalType(AArg.&Type, AArg.&Interface, APascalify, ANeedsWrapper, AFixedAsTWL_Fixed);

  Result := Format('%s: %s', [lName, lType]);
end;

function TGenerator.ArgTypeToPascalType(AType: String; AInterface: String;
  APascalify: Boolean; var ANeedsWrapper: Boolean; AFixedAsTWL_Fixed: Boolean
  ): String;
begin
  ANeedsWrapper:=False;
  case AType of
      'new_id':
        begin
          if AInterface = '' then // bind
            Result :='Pwl_proxy'
          else
          begin
            if APascalify then
              Result:='T'+ Pascalify(AInterface)
            else
              Result := 'P'+AInterface;
          end;
          ANeedsWrapper:=True;
        end;
      'object':
        begin
          if APascalify then
            Result:='T'+ Pascalify(AInterface)
          else
            Result := 'P'+AInterface;

          if Length(Result) = 1 then
            Result := 'Pointer';
          ANeedsWrapper:=True;
        end;
      'int':  Result := 'LongInt';
      'uint': Result := 'DWord';
      'fixed': if AFixedAsTWL_Fixed then Result := 'Twl_fixed' else Result := 'Longint{24.8}';
      'string':
        begin
          if APascalify then
            Result := 'String'
          else
            Result := 'Pchar';
        end;
      'array':
        begin
          {if APascalify then
            Result := 'TWlArray'
          else
            Result := 'Pwl_array';
          ANeedsWrapper:=True;}
          Result := 'Pwl_array';
        end;
      'fd': Result := 'LongInt{fd}';
      else
        raise Exception.CreateFmt('Unknown argument type : %s', [AType]);
  end; {case}
end;

procedure TGenerator.ArgsToSig(Element: TBaseNode; AData: Pointer);
var
  lArg: TArg absolute Element;
  Str: PString absolute AData;
begin
  if lArg.AllowNull='true' then
    Str^+='?';

  if lArg.&Type = 'fd' then
    Str^+='h' // handle?
  else if lArg.&Type <> '' then
    Str^+=lArg.&Type[1]
  else
    Str^+='?';

end;

procedure TGenerator.ArgTypesToInterfacePointer(Element: TBaseNode; AData: Pointer);
var
  lArg: TArg absolute Element;
  lInterfaceType: String;
begin
  lInterfaceType := larg.&Interface;
  if lInterfaceType <> '' then
    Sections[sInterfacePointers].Add(Format('    (@%s_interface),', [lInterfaceType]))
  else
    Sections[sInterfacePointers].Add('    (nil),');
end;

procedure TGenerator.WriteRequestConsts(Element: TBaseNode; AData: Pointer);
var
  lInterface: TInterface absolute AData;
  lSince: String = '';
begin
  if (Element is TRequest) and (TRequest(Element).Since <> '') then
    lSince := Format(' { since version: %s}', [TRequest(Element).Since]);

  Sections[sClasses].Add(Format('    const _%s = %d;%s', [UpperCase(Element.Name), Element.ElementIndex, lSince]));
  //Sections[sPrivateConst].Add('_'+UpperCase(lInterface.Name+'_'+Element.Name + ' = ' + IntToStr(Element.ElementIndex)+';'));
end;

procedure TGenerator.WriteRequestImplmentation(Element: TBaseNode;
  Adata: Pointer);
var
  lInterface: TInterface absolute Adata;
  lFuncType : String;
  lFuncName: String;
  lFuncReturn: String;
  lReq: TRequest absolute Element;
  lArgList: TNodeList;
  lArg: TArg;
  lArgs: String;
  lIntf, lTypeName, lTypeCast, lSince, lArgStr: String;
  lReturnVar: TArg;
  lParams: TNodeList;
begin
  lFuncType:='procedure';
  lFuncName := LowerCase(lInterface.Name+'_'+Element.Name);

  lArgs := lInterface.Name + ': P'+lInterface.Name;

  lArgList := TNodeList.Create(True);

  lReq.ForEachArg(@CollectArgs, lArgList);

  lReturnVar := nil;
  lParams := TNodeList.Create(False);
  for TBaseNode(lArg) in lArgList do
  begin
    if lArg.&Type = 'new_id' then // the return type
    begin
      lFuncType:='function ';
      if lArg.&Interface = '' then
        lFuncReturn:=': Pointer'
      else
        lFuncReturn:=': P'+larg.&Interface;
      lReturnVar := lArg;
    end
    else if lArg.&Type = 'object' then
    begin
      lArgs += '; ' + lArg.Name+': P'+lArg.&Interface;
      lParams.Add(lArg);
    end
    else begin
      lTypeName := 'c'+lArg.&Type;

      if lTypeName = 'cstring' then
        lTypeName:='pchar';
      if lTypeName = 'cfd' then
        lTypeName:='cint';
      if lTypeName = 'carray' then
        lTypeName:='Pwl_array';
      if lTypeName = 'cfixed' then
        lTypeName:='Twl_fixed';

      lArgs += '; ' + lArg.Name+': '+lTypeName;
      lParams.Add(lArg);
    end;
  end;

  // interface

  lSince := '';
  if Element is TRequest then
  begin
    if TRequest(Element).Since <> '' then
      lSince := Format(' { since version: %s}', [TRequest(Element).Since]);
  end;

  if Assigned(lReturnVar) and (lReq.Name = 'bind') then
  begin
    // wl_registry_bind doesn't quite follow the same rules and has some extra vars that are not declared
    lArgs+='; interface_: Pwl_interface; version: cuint32';
  end;
  lIntf:=Format('%s %s(%s)%s;%s', [lFuncType, lFuncName, lArgs, lFuncReturn, lSince]);

  Sections[TSection.sFuncs].Add(lIntf);

  // for later
  lArgs := '';
  for TBaseNode(lArg) in lParams do
  begin
    if lArg.&Type = 'fixed' then
      lArgStr := lArg.Name+'.AsFixed24_8'
    else
      lArgStr:=lArg.Name;

    lArgs+=', '+lArgStr;
  end;
  lArgs+=');';


  // implementation
  WriteLn(Element.Name);
  Sections[sImplementation].Add(lIntf);
  if Assigned(lReturnVar) and (lReturnVar.&Interface = '') and  (lReq.Name = 'bind')then
  begin
    // wl_registry_bind doesn't quite follow the same rules
    lTypeCast := lReturnVar.&Interface;
    if lTypeCast = '' then
      lTypeCast:=lInterface.Name;
    Sections[sImplementation].Add('var');
    Sections[sImplementation].Add('  '+lReturnVar.Name+': Pwl_proxy;');
    Sections[sImplementation].Add('begin');
    Sections[sImplementation].Add('  '+lReturnVar.Name+' := wl_proxy_marshal_constructor_versioned(Pwl_proxy('+lInterface.Name+'),' );
    Sections[sImplementation].Add('      _'+UpperCase(lInterface.Name+'_'+Element.Name)+', interface_, version, name, interface_^.name, version, nil);');
    Sections[sImplementation].Add('  Result := Pointer('+lReturnVar.Name+');');

  end
  else if Assigned(lReturnVar) then
  begin
    lTypeCast := lReturnVar.&Interface;
    if lTypeCast = '' then
      lTypeCast:=lInterface.Name;
    Sections[sImplementation].Add('var');
    Sections[sImplementation].Add('  '+lReturnVar.Name+': Pwl_proxy;');
    Sections[sImplementation].Add('begin');
    Sections[sImplementation].Add('  '+lReturnVar.Name+' := wl_proxy_marshal_constructor(Pwl_proxy('+lInterface.Name+'),' );
    Sections[sImplementation].Add('      _'+UpperCase(lInterface.Name+'_'+Element.Name)+', @'+ lReturnVar.&Interface+'_interface, nil'+lArgs);
    Sections[sImplementation].Add('  Result := P'+lTypeCast+'('+lReturnVar.Name+');');
  end
  else if lReq.&Type <> 'destructor' then
  begin
    Sections[sImplementation].Add('begin');
    Sections[sImplementation].Add('  wl_proxy_marshal(Pwl_proxy('+lInterface.Name+'),' );
    Sections[sImplementation].Add('      _'+UpperCase(lInterface.Name+'_'+Element.Name)+lArgs);

  end;


  if lReq.&Type = 'destructor' then
  begin
    lInterface.DestructorDefined := True;
    Sections[sImplementation].Add('begin');
    Sections[sImplementation].Add('  wl_proxy_marshal(Pwl_proxy('+lInterface.Name+'), _'+UpperCase(lInterface.Name+'_'+Element.Name)+');');
    Sections[sImplementation].Add('  wl_proxy_destroy(Pwl_proxy('+lInterface.Name+'));');
  end;

  Sections[sImplementation].Add('end;');
  Sections[sImplementation].Add('');

  lArgList.Free;
  lParams.Free;
end;

procedure TGenerator.WriteRequestImplmentationObjects(Element: TBaseNode; Adata: Pointer);
var
  lInterface: TInterface absolute Adata;
  lRequest: TRequest absolute Element;
  lFuncType, lFuncName, lIntf, lArgs, lImpl, lTypeCast, lFuncReturn,
    lOverride, lTmp, lWrapperArgs, lSince: String;
  lArg, lReturnVar: TArg;
  lParams: TNodeList;
  lArgList: TNodeList;
  lNeedsWrapper: Boolean;
  lWrapperCode: TStrings;
begin
  lWrapperCode := TStringList.Create;
  lFuncType:='procedure';
  lFuncName :=  Pascalify(LowerCase(Element.Name));

  // collect declared args
  lArgList := TNodeList.Create(True);
  lRequest.ForEachArg(@CollectArgs, lArgList);

  lReturnVar:=nil;
  lParams := TNodeList.Create(False);

  lArgs := '';
  lWrapperArgs := '';
  for TBaseNode(lArg) in lArgList do
  begin
    case lArg.&Type of
      'new_id':
        begin
          lFuncType:='function';
          lFuncReturn:= ': '+ArgTypeToPascalType(lArg.&Type, larg.&Interface, True, lNeedsWrapper);
          lReturnVar := lArg;
        end;
    else
      lArgs += '; '+ArgToArg(lArg, False, lNeedsWrapper);
      lWrapperArgs += '; '+ArgToArg(lArg, True, lNeedsWrapper);
      lParams.Add(lArg);
      if lNeedsWrapper then
        larg.NeedsWrapper:=True;
    end;
  end;

  if Assigned(lReturnVar) and (lRequest.Name = 'bind') then
  begin
    // wl_registry_bind doesn't quite follow the same rules and has some extra vars that are not declared
    lArgs+='; AInterface: Pwl_interface; AVersion: LongInt';
    lWrapperArgs+='; AInterface: Pwl_interface; AVersion: LongInt';
  end
  else
  if Assigned(lReturnVar) then
  begin
    lArgs+='; AProxyClass: TWLProxyObjectClass = nil {T'+Pascalify(lReturnVar.&Interface+'}');
    lWrapperArgs+='; AProxyClass: TWLProxyObjectClass = nil {T'+Pascalify(lReturnVar.&Interface+'}');
  end;

  if lRequest.&Type = 'destructor' then
  begin
    lFuncType:='destructor';
    lFuncName:='Destroy';
    lOverride:='; override';
  end;

  if Length(lArgs) > 0 then
    Delete(lArgs, 1, 2); // delete from the start '; '

  if Length(lWrapperArgs) > 0 then
    Delete(lWrapperArgs, 1, 2); // delete from the start '; '

  lArgs := '('+lArgs+')';
  if lArgs = '()' then
    lArgs := '';

  lWrapperArgs := '('+lWrapperArgs+')';
  if lWrapperArgs = '()' then
    lWrapperArgs := '';

  lSince := '';
  if lRequest.Since <> '' then
    lSince := Format(' {since version: %s}', [lRequest.Since]);

  lIntf:=Format('    %s %s%s%s%s;%s', [lFuncType, lFuncName, lOverride, lWrapperArgs, lFuncReturn, lSince]);
  lImpl:=Format('%s T%s.%s%s%s;', [lFuncType, Pascalify(lInterface.Name), lFuncName, lWrapperArgs, lFuncReturn]);

  // add interface line of request
  Sections[sClasses].Add(lIntf);

  // for later
  lArgs := '';
  for TBaseNode(lArg) in lParams do
  begin
    if lArg.&Type = 'object' then
      lTmp:='.Proxy'
    else if lArg.&Type = 'fixed' then
      lTmp:='.AsFixed24_8'

    else
      lTmp := '';
    if lArg.&Type = 'string' then
      lArgs+=', PChar(A'+Pascalify(lArg.Name)+lTmp+')'
    else
      lArgs+=', A'+Pascalify(lArg.Name)+lTmp;
  end;
  lArgs+=');';

  // add implementation function line
  Sections[sClassImpl].Add(lImpl);
  if Assigned(lReturnVar) and (lReturnVar.&Interface = '') and  (lRequest.Name = 'bind')then
  begin
    // wl_registry_bind doesn't quite follow the same rules
    Sections[sClassImpl].Add('begin');
    Sections[sClassImpl].Add('  Result := wl_proxy_marshal_constructor_versioned(FProxy,' );
    Sections[sClassImpl].Add('      _'+UpperCase(Element.Name)+', AInterface, AVersion, AName, AInterface^.name, AVersion, nil);');
  end
  else if Assigned(lReturnVar) then
  begin
    lTypeCast := lReturnVar.&Interface;
    if lTypeCast = '' then
      lTypeCast:=lInterface.Name;
    lTypeCast:=Pascalify(lTypeCast);
    Sections[sClassImpl].Add('var');
    Sections[sClassImpl].Add('  '+lReturnVar.Name+': Pwl_proxy;');
    Sections[sClassImpl].Add('begin');
    Sections[sClassImpl].Add('  '+lReturnVar.Name+' := wl_proxy_marshal_constructor(FProxy,' );
    Sections[sClassImpl].Add('      '+UpperCase('_'+Element.Name)+', @'+ lReturnVar.&Interface+'_interface, nil'+lArgs);
    Sections[sClassImpl].Add('  if AProxyClass = nil then');
    Sections[sClassImpl].Add('    AProxyClass := T'+lTypeCast+';');
    Sections[sClassImpl].Add('  if not AProxyClass.InheritsFrom(T'+lTypeCast+') then');
    Sections[sClassImpl].Add('    Raise Exception.CreateFmt(''%s does not inherit from %s'', [AProxyClass.ClassName, T'+lTypeCast+']);');
    Sections[sClassImpl].Add('  Result := T'+lTypeCast+'(AProxyClass.Create('+lReturnVar.Name+'));');
  end
  else if lRequest.&Type <> 'destructor' then
  begin
    Sections[sClassImpl].Add('begin');
    Sections[sClassImpl].Add('  wl_proxy_marshal(FProxy, '+UpperCase('_'+Element.Name)+lArgs);
  end;
  if lRequest.&Type = 'destructor' then
  begin
    lInterface.DestructorDefined := True;
    Sections[sClassImpl].Add('begin');
    Sections[sClassImpl].Add('  wl_proxy_marshal(FProxy, '+UpperCase('_'+Element.Name)+');');
    //Sections[sClassImpl].Add('  wl_proxy_destroy(FProxy);'); // inherited will call this
    Sections[sClassImpl].Add('  inherited Destroy;');
  end;
  Sections[sClassImpl].Add('end;');
  Sections[sClassImpl].Add('');
end;

procedure TGenerator.WriteListenerObjectMethod(Element: TInterface);
var
  lIntf, lClassname: String;
begin
  lIntf:='I'+Pascalify(Element.Name)+'Listener';
  lClassname := 'T'+Pascalify(Element.Name);
  Sections[sClasses].Add('    function AddListener(AIntf: '+lIntf+'): LongInt;');

  Sections[sClassImpl].Add('function '+lClassname+'.AddListener(AIntf: '+lIntf+'): LongInt;');
  Sections[sClassImpl].Add('begin');
  Sections[sClassImpl].Add('  FUserDataRec.ListenerUserData := Pointer(AIntf);');
  Sections[sClassImpl].Add('  Result := wl_proxy_add_listener(FProxy, @vIntf_'+Element.Name+'_Listener, @FUserDataRec);');
  Sections[sClassImpl].Add('end;');
end;

procedure TGenerator.WriteWaylandRequestorEventInterface(Element: TBaseNode; AData: Pointer);
var
   lInterface: TInterface absolute AData;
   lElement: TBaseWithArg absolute Element;
   lSig: String = '';
   lInterfacePointer,
   lInterfaceVar, lName, lSince: String;
   lIndex: Integer;
begin
  lName := lElement.Name;
  lElement.ForEachArg(@ArgsToSig, @lSig);
  if lElement is TRequest then
  begin
    lSince := TRequest(lElement).Since;

    lInterfaceVar := TRequest(lElement).GetNewIdInterface;
    if lInterfaceVar <> '' then
    begin
      lInterfaceVar+='_interface';
    end;
  end
  else
  begin
    lSince := TEvent(lElement).Since;
    lInterfaceVar := TEvent(lElement).GetObjectIdInterface;
    if lInterfaceVar <> '' then
    begin
      lInterfaceVar+='_interface';
    end;
  end;

  // wl_registry_bind doesn't quite follow the same rules and has some extra vars that are not declared
  if (lInterface.Name = 'wl_registry') and (Element.Name = 'bind') then
    lSig:='us'+lSig;

  lSig:=lSince+lSig;

  if lInterfaceVar <> '' then
  begin
    lIndex:= Sections[sInterfacePointers].Count;
    lElement.ForEachArg(@ArgTypesToInterfacePointer, lInterface);

  end
  else
    lIndex := 0;
  {
  lIndex:= Sections[sInterfacePointers].IndexOf('    (@'+lInterfaceVar+'),')+1;
  if lIndex < 1 then
  begin
    lIndex:=0;
    if lInterfaceVar <> '' then
      lIndex := Sections[sInterfacePointers].Add(Format('    (@%s),', [lInterfaceVar]))+1;
  end;}

  lInterfacePointer := Format('pInterfaces[%d]', [lIndex]);

  Sections[sRequestandEvents].Add(Format('    (name: ''%s''; signature: ''%s''; types: @%s),', [lName, lSig, lInterfacePointer]));

end;

constructor TGenerator.Create(AFileName: String);
var
  lStream: TFileStream;
  s: TSection;
begin
  lStream := TFileStream.Create(AFileName, fmOpenRead);
  try
    FProtocol := TProtocol.Create(lStream, False);
  finally
    lStream.Free;
  end;

  for s in TSection do
    Sections[s] := TStringList.Create;

end;

procedure TGenerator.Generate(AUnitName: String; Strings: TStrings;
  ImplementInterfaceVars: Boolean);
var
  lUses: String;
  i: Integer;
begin
  FImplementInterfaceVars:=ImplementInterfaceVars;

  for i := 0 to 7 do
    Sections[sInterfacePointers].Add('    (nil),');

  // this sets up pointer types for each interface name.
  FProtocol.ForEachInterface(@DeclareInterfaceTypes, nil);

  FProtocol.ForEachInterface(TForEachHandler(@HandleInterface), nil);
  //WriteLn(Sections[sConst].Text);
  WriteLn(Sections[sFuncs].Text);
  WriteLn(Sections[sTypes].Text);
  WriteLn(Sections[sImplementation].Text);

  if Assigned(Strings) then
  begin
    Strings.Add('unit '+AUnitName+';');
    Strings.Add('');
    Strings.Add('{$mode objfpc} {$H+}');
    Strings.Add('{$interfaces corba}');
    Strings.Add('');
    Strings.Add('interface');
    Strings.Add('');
    Strings.Add('uses');
    if AUnitName = 'wayland_protocol' then
      lUses := '  Classes, Sysutils, ctypes, wayland_util, wayland_client_core'
    else
      lUses := '  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol';
    Strings.Add(lUses +';');
    Strings.Add('');
    Strings.Add('');
    Strings.Add('type');
    Strings.AddStrings(Sections[sTypes].Text);
    Strings.Add('');
    Strings.AddStrings(Sections[sClassForward].Text);
    Strings.Add('');
    Strings.AddStrings(Sections[sListenerDecl].Text);
    Strings.Add('');
    Strings.AddStrings(Sections[sClasses].Text);
    Strings.Add('');
    Strings.Add('');
    Strings.AddStrings(Sections[sFuncs].Text);
    Strings.Add('');
    Strings.Add('');

    Strings.Add('var');
    Strings.AddStrings(Sections[sVars].Text);
    Strings.Add('');
    Strings.Add('');
    Strings.Add('implementation');
    Strings.Add('');
    if Sections[sPrivateConst].Count > 0 then
    begin
      Strings.Add('const');
      Strings.AddStrings(Sections[sPrivateConst].Text);
      Strings.Add('');
    end;
    if Sections[sPrivateVar].Count > 0 then
    begin
      Strings.Add('var');
      Strings.AddStrings(Sections[sPrivateVar].Text);
      Strings.Add('');
      Strings.Add('');
    end;

    Strings.AddStrings(Sections[sClassImpl].Text);
    Strings.Add('');
    Strings.Add('');


    Strings.AddStrings(Sections[sImplementation].Text);
    Strings.AddStrings(Sections[sListenerImpl].Text);
    Strings.Add('');

    if FImplementInterfaceVars then
    begin
      // get rid of comma
      TrimLastChar(Sections[sInterfacePointers]);

      Strings.Add('const');
      Strings.Add(Format('  pInterfaces: array[0..%d] of Pwl_interface = (', [Sections[sInterfacePointers].Count-1]));

      Strings.AddStrings(Sections[sInterfacePointers]);
      Strings.Add('  );');
      Strings.Add('');


      Strings.AddStrings(Sections[sRequestandEvents]);
      Strings.Add('');
    end;

    Strings.Add('initialization');
    Strings.AddStrings(Sections[sListenerBind].Text);
    Strings.Add('');
    Strings.AddStrings(Sections[sInit]);

    Strings.Add('end.');

  end;
end;

end.

