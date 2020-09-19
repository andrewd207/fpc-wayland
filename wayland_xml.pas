{ <wayland_xml.pas>

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

unit wayland_xml;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, XMLRead, DOM, contnrs, TypInfo;

type

  TBaseNode = class;
  TForEachHandler = procedure(Element: TBaseNode; AData: Pointer) of object;

  { TBaseNode }

  TBaseNodeClass = class of TBaseNode;
  TBaseNode = class
  protected
    class var Map: TStringList;
    class constructor Create;
    class destructor  Destroy;
    class procedure   RegisterElement(AName: String; AClass: TBaseNodeClass);
    class function    FindClass(AName: String): TBaseNodeClass;
  private
    FNode: TDomNode;
    FElementNumber: Integer;
    FAttrs: TStringList;
    function GetDescription: String; // most have this
    function GetName: String;
    procedure SetDescription(AValue: String);
    procedure SetName(AValue: String);
  protected
    function  GetAttr(AAttrName: String): String;
    function DoForEach(AElementName: String; AHandler: TForEachHandler; AUserData: Pointer): Integer;
  public
    constructor Create(ANode: TDOMNode); virtual;
    destructor  Destroy; override;
    procedure Assign(From: TBaseNode); virtual;
    function ElementIndex: Integer; // with this name! not the index in the parent!.
  published
    property Name: String read GetName write SetName;
    property Description: String read GetDescription write SetDescription;

  end;

  { TProtocol }

  TProtocol = class(TBaseNode)
  private
    FXML: TXMLDocument;
    FInterfaceIndex: Integer;
  public
    constructor Create(AProtocol: TStream; AFreeStream: Boolean);
    destructor  Destroy; override;
    procedure ForEachInterface(AHandler: TForEachHandler; AUserData: Pointer);
  end;

  { TInterface }

  TInterface = class(TBaseNode)
  private
    FDestructorDefined: Boolean;
    FIndex: Integer;
    function GetHasEnums: Boolean;
    function GetHasEvents: Boolean;
    function GetHasRequests: Boolean;
    function GetVersion: String;
    procedure SetHasEvents(AValue: Boolean);
    procedure SetVersion(AValue: String);
  public
    function  ForEachRequest(Handler: TForEachHandler; AUserData: Pointer): Integer;
    function  ForEachEvent(Handler: TForEachHandler; AUserData: Pointer): integer;
    function  ForEachEnum(Handler: TForEachHandler; AUserData: Pointer): Integer;
    property  HasEvents: Boolean read GetHasEvents;
    property  HasRequests: Boolean read GetHasRequests;
    property  HasEnums: Boolean read GetHasEnums;
    property  DestructorDefined: Boolean read FDestructorDefined write FDestructorDefined;
    property  Index: Integer read FIndex write FIndex;
  published
    property  Version: String read GetVersion write SetVersion;
  end;

  { TBaseWithArg }

  TBaseWithArg = class(TBaseNode)
  public
    function  ForEachArg(AHandler: TForEachHandler; AUserData: Pointer): Integer;
  end;

  { TRequest }

  TRequest = class (TBaseWithArg)
  private
    function GetSince: String;
    function GetType: String;
    procedure SetSince(AValue: String);
    procedure SetType(AValue: String);
  public
    function GetNewIdInterface: String;
  published
    property Name;
    property &Type: String read GetType write SetType;
    property Since: String read GetSince write SetSince;
  end;

  { TEvent }

  TEvent = class(TBaseWithArg)
  private
    function GetSince: String;
    procedure SetSince(AValue: String);
  public
    function GetObjectIdInterface: String;
  published
    property Name;
    property Since: String read GetSince write SetSince;
  end;

  { TEnum }

  TEnum = class(TBaseNode)
  private
    function GetBitfield: Boolean;
    function GetSince: String;
    procedure SetBitfield(AValue: Boolean);
    procedure SetSince(AValue: String);
  public
    function ForEachEntry(AHandler: TForEachHandler; AUserData: Pointer): Integer;
  published
    property Name;
    property Since: String read GetSince write SetSince;
    property Bitfield: Boolean read GetBitfield write SetBitfield;
  end;

  { TEntry }

  TEntry = class(TBaseNode)
  private
    function GetSince: String;
    function GetSummary: String;
    function GetValue: String;
    procedure SetSince(AValue: String);
    procedure SetSummary(AValue: String);
    procedure SetValue(AValue: String);
  published
    property Name;
    property Value: String read GetValue write SetValue;
    property Summary: String read GetSummary write SetSummary;
    property Since: String read GetSince write SetSince;
  end;

  { TArg }

  TArg = class(TBaseNode)
  private
    FNeedsWrapper: Boolean;
    function GetAllowNull: String;
    function GetEnum: String;
    function GetInterface: String;
    function GetSummary: String;
    function GetType: String;
    procedure SetAllowNull(AValue: String);
    procedure SetEnum(AValue: String);
    procedure SetInterface(AValue: String);
    procedure SetSummary(AValue: String);
    procedure SetType(AValue: String);
  public
    property NeedsWrapper: Boolean read FNeedsWrapper write FNeedsWrapper; // used and set by binding creator
  published
    property Name;
    property &Type: String read GetType write SetType;
    property Summary: String read GetSummary write SetSummary;
    property &Interface: String read GetInterface write SetInterface;
    property AllowNull: String read GetAllowNull write SetAllowNull;
    property Enum: String read GetEnum write SetEnum;
  end;


implementation

{ TArg }

function TArg.GetAllowNull: String;
begin
  Result := GetAttr('allow-null');
end;

function TArg.GetEnum: String;
begin
 Result := GetAttr('enum');
end;

function TArg.GetInterface: String;
begin
 Result := GetAttr('interface');
end;

function TArg.GetSummary: String;
begin
 Result := GetAttr('summary');
end;

function TArg.GetType: String;
begin
 Result := GetAttr('type');
end;

procedure TArg.SetAllowNull(AValue: String);
begin
  FAttrs.Values['allow-null'] := AValue;
end;

procedure TArg.SetEnum(AValue: String);
begin
  FAttrs.Values['enum'] := AValue;
end;

procedure TArg.SetInterface(AValue: String);
begin
  FAttrs.Values['interface'] := AValue;
end;

procedure TArg.SetSummary(AValue: String);
begin
  FAttrs.Values['summary'] := AValue;
end;

procedure TArg.SetType(AValue: String);
begin
  FAttrs.Values['type'] := AValue;
end;

{ TEntry }

function TEntry.GetSince: String;
begin
  Result := GetAttr('since');
end;

function TEntry.GetSummary: String;
begin
 Result := GetAttr('summary');
end;

function TEntry.GetValue: String;
begin
 Result := GetAttr('value');
end;

procedure TEntry.SetSince(AValue: String);
begin
  FAttrs.Values['since'] := AValue;
end;

procedure TEntry.SetSummary(AValue: String);
begin
  FAttrs.Values['summary'] := AValue;
end;

procedure TEntry.SetValue(AValue: String);
begin
  FAttrs.Values['value'] := AValue;
end;

{ TEnum }

function TEnum.GetBitfield: Boolean;
begin
  Result := GetAttr('bitfield') = 'true';
end;

function TEnum.GetSince: String;
begin

end;

procedure TEnum.SetBitfield(AValue: Boolean);
begin
  FAttrs.Values['bitfield'] := BoolToStr(AValue);
end;

procedure TEnum.SetSince(AValue: String);
begin
  FAttrs.Values['since'] := AValue;
end;

function TEnum.ForEachEntry(AHandler: TForEachHandler; AUserData: Pointer): Integer;
begin
  Result := DoForEach('entry', AHandler, AUserData);
end;

{ TEvent }

function TEvent.GetSince: String;
begin
  Result := GetAttr('since');
end;

procedure TEvent.SetSince(AValue: String);
begin
  FAttrs.Values['since'] := AValue;
end;

function TEvent.GetObjectIdInterface: String;
var
  lNode: TDOMNode;
begin
  Result:= '';
  lNode:= FNode.FirstChild;
  while Assigned(lNode) do
  begin
    if (lNode.NodeName = 'arg')
    and (TDomElement(lNode).GetAttribute('type') = 'object')
    //and (TDomElement(lNode).GetAttribute('name') = 'id')
    then
      Exit(TDomElement(lNode).GetAttribute('interface'));
    lNode := lNode.NextSibling;
  end;
end;

{ TBaseWithArg }

function TBaseWithArg.ForEachArg(AHandler: TForEachHandler; AUserData: Pointer): Integer;
begin
  Result := DoForEach('arg', AHandler, AUserData);
end;

{ TRequest }

function TRequest.GetType: String;
begin
  Result := GetAttr('type');
end;

procedure TRequest.SetSince(AValue: String);
begin
  FAttrs.Values['since'] := AValue;
end;

procedure TRequest.SetType(AValue: String);
begin
  FAttrs.Values['type'] := AValue;
end;

function TRequest.GetNewIdInterface: String;
var
  lNode: TDOMNode;
  lInterfaceName: DOMString;
begin
  Result:= '';
  lNode:= FNode.FirstChild;
  while Assigned(lNode) do
  begin
    if (lNode.NodeName = 'arg') then
    begin
      lInterfaceName := TDomElement(lNode).GetAttribute('interface');
      if lInterfaceName <> '' then
        Exit(lInterfaceName);
    end;
    lNode := lNode.NextSibling;
  end;
end;

function TRequest.GetSince: String;
begin
  Result := GetAttr('since');
end;

{ TInterface }

function TInterface.GetVersion: String;
begin
  Result := GetAttr('version');
end;

procedure TInterface.SetHasEvents(AValue: Boolean);
begin

end;

procedure TInterface.SetVersion(AValue: String);
begin
  FAttrs.Values['version'] := AValue;
end;

function TInterface.GetHasEnums: Boolean;
begin
  Result := FNode.FindNode('enum') <> nil;
end;

function TInterface.GetHasEvents: Boolean;
begin
  Result := FNode.FindNode('event') <> nil;
end;

function TInterface.GetHasRequests: Boolean;
begin
  Result := FNode.FindNode('request') <> nil;
end;

function TInterface.ForEachRequest(Handler: TForEachHandler; AUserData: Pointer): Integer;
begin
  Result := DoForEach('request', Handler, AUserData);
end;

function TInterface.ForEachEvent(Handler: TForEachHandler; AUserData: Pointer): integer;
begin
  Result := DoForEach('event', Handler, AUserData);
end;

function TInterface.ForEachEnum(Handler: TForEachHandler; AUserData: Pointer): Integer;
begin
  Result := DoForEach('enum', Handler, AUserData);
end;

{ TBaseNode }

class constructor TBaseNode.Create;
begin
  Map := TStringList.Create;
end;

class destructor TBaseNode.Destroy;
begin
  Map.Free;
end;

class procedure TBaseNode.RegisterElement(AName: String; AClass: TBaseNodeClass);
begin
  Map.AddObject(AName, TObject(AClass));
end;

class function TBaseNode.FindClass(AName: String): TBaseNodeClass;
var
  i: Integer;
begin
  Result := nil;
  i := Map.IndexOf(AName);

  if i = -1 then
    Exit;

  Result := TBaseNodeClass(Map.Objects[i]);
end;

function TBaseNode.GetName: String;
begin
  Result := GetAttr('name');
end;

procedure TBaseNode.SetDescription(AValue: String);
begin
  FAttrs.Values['description'] := AValue;
end;

procedure TBaseNode.SetName(AValue: String);
begin
  FAttrs.Values['name'] := AValue;
end;

function TBaseNode.GetDescription: String;
var
  lDesc: TDOMNode;
begin
  Result := '';
  lDesc := FNode.FindNode('description');
  if Assigned(lDesc) then
    Result := lDesc.TextContent;
end;

function TBaseNode.GetAttr(AAttrName: String): String;
begin
  Result := FAttrs.Values[AAttrName];
  if (Result = '') and Assigned(FNode) then
  begin
    Result := TDOMElement(FNode).GetAttribute(AAttrName);
    FAttrs.Values[AAttrName] := Result;
  end;
end;

function TBaseNode.DoForEach(AElementName: String; AHandler: TForEachHandler;
  AUserData: Pointer): Integer;
var
  lChild: TDOMNode;
  lNode: TBaseNode;
  lSameIndex: Integer;
begin
  Result := 0;
  lSameIndex := 0;
  lChild := FNode.FirstChild;
  while lChild <> nil do
  begin
    if lChild.NodeName = AElementName then
    begin
      Inc(Result);
      try
        lNode := FindClass(AElementName).Create(lChild);
        if lNode.InheritsFrom(TInterface) then
          TInterface(lNode).Index:=Result-1;
        lNode.FElementNumber := lSameIndex;
        AHandler(lNode, AUserData);
      finally
        lNode.Free;
      end;
      Inc(lSameIndex);
    end;
    lChild := lChild.NextSibling;
  end;
end;

constructor TBaseNode.Create(ANode: TDOMNode);
begin
  FNode := ANode;
  FAttrs := TStringList.Create;
end;

destructor TBaseNode.Destroy;
begin
  FAttrs.Free;
  inherited Destroy;
end;

procedure TBaseNode.Assign(From: TBaseNode);
var
  lTypeInfo: PTypeInfo;
  lList: PPropList;
  lPropCount, i: Integer;
  lVal: Variant;
begin
  lTypeInfo := PTypeInfo(TypeInfo(Self));
  lPropCount := GetPropList(Self, lList);

  for i := 0 to lPropCount-1 do
  begin
    lVal := GetPropValue(From, lList^[i]);
    SetPropValue(Self, lList^[i],  lVal);
  end;
end;

function TBaseNode.ElementIndex: Integer;
begin
  Result := FElementNumber;
end;

{ TProtocol }

constructor TProtocol.Create(AProtocol: TStream; AFreeStream: Boolean);
begin
  ReadXMLFile(FXML, AProtocol);
  if AFreeStream then
    FreeAndNil(AProtocol);
  FNode := FXML.DocumentElement;
end;

destructor TProtocol.Destroy;
begin
  inherited Destroy;
  FXML.Free;
end;

procedure TProtocol.ForEachInterface(AHandler: TForEachHandler; AUserData: Pointer);
begin
  DoForEach('interface', AHandler, AUserData);
end;

initialization
  TBaseNode.RegisterElement('protocol', TProtocol);
  TBaseNode.RegisterElement('interface', TInterface);
  TBaseNode.RegisterElement('request', TRequest);
  TBaseNode.RegisterElement('event', TEvent);
  TBaseNode.RegisterElement('enum', TEnum);
  TBaseNode.RegisterElement('entry', TEntry);
  TBaseNode.RegisterElement('arg', TArg);

end.

