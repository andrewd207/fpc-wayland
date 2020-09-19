unit xdg_output_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzxdg_output_manager_v1 = Pointer;
  Pzxdg_output_v1 = Pointer;
  Pzxdg_output_manager_v1_listener = ^Tzxdg_output_manager_v1_listener;
  Tzxdg_output_manager_v1_listener = record
  end;

  Pzxdg_output_v1_listener = ^Tzxdg_output_v1_listener;
  Tzxdg_output_v1_listener = record
    logical_position : procedure(data: Pointer; AZxdgOutputV1: Pzxdg_output_v1; AX: LongInt; AY: LongInt); cdecl;
    logical_size : procedure(data: Pointer; AZxdgOutputV1: Pzxdg_output_v1; AWidth: LongInt; AHeight: LongInt); cdecl;
    done : procedure(data: Pointer; AZxdgOutputV1: Pzxdg_output_v1); cdecl;
    name : procedure(data: Pointer; AZxdgOutputV1: Pzxdg_output_v1; AName: Pchar); cdecl;
    description : procedure(data: Pointer; AZxdgOutputV1: Pzxdg_output_v1; ADescription: Pchar); cdecl;
  end;



  TZxdgOutputManagerV1 = class;
  TZxdgOutputV1 = class;


  IZxdgOutputManagerV1Listener = interface
  ['IZxdgOutputManagerV1Listener']
  end;

  IZxdgOutputV1Listener = interface
  ['IZxdgOutputV1Listener']
    procedure zxdg_output_v1_logical_position(AZxdgOutputV1: TZxdgOutputV1; AX: LongInt; AY: LongInt);
    procedure zxdg_output_v1_logical_size(AZxdgOutputV1: TZxdgOutputV1; AWidth: LongInt; AHeight: LongInt);
    procedure zxdg_output_v1_done(AZxdgOutputV1: TZxdgOutputV1);
    procedure zxdg_output_v1_name(AZxdgOutputV1: TZxdgOutputV1; AName: String);
    procedure zxdg_output_v1_description(AZxdgOutputV1: TZxdgOutputV1; ADescription: String);
  end;




  TZxdgOutputManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_XDG_OUTPUT = 1;
  public
    destructor Destroy; override;
    function GetXdgOutput(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TZxdgOutputV1}): TZxdgOutputV1;
    function AddListener(AIntf: IZxdgOutputManagerV1Listener): LongInt;
  end;

  TZxdgOutputV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZxdgOutputV1Listener): LongInt;
  end;






var
  zxdg_output_manager_v1_interface: Twl_interface;
  zxdg_output_v1_interface: Twl_interface;



implementation

var
  vIntf_zxdg_output_manager_v1_Listener: Tzxdg_output_manager_v1_listener;
  vIntf_zxdg_output_v1_Listener: Tzxdg_output_v1_listener;



destructor TZxdgOutputManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgOutputManagerV1.GetXdgOutput(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TZxdgOutputV1}): TZxdgOutputV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_OUTPUT, @zxdg_output_v1_interface, nil, AOutput.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZxdgOutputV1;
  Result := TZxdgOutputV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZxdgOutputV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgOutputV1]);
end;

function TZxdgOutputManagerV1.AddListener(AIntf: IZxdgOutputManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_output_manager_v1_Listener, @FUserDataRec);
end;
destructor TZxdgOutputV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgOutputV1.AddListener(AIntf: IZxdgOutputV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_output_v1_Listener, @FUserDataRec);
end;




procedure zxdg_output_v1_logical_position_Intf(AData: PWLUserData; Azxdg_output_v1: Pzxdg_output_v1; AX: LongInt; AY: LongInt); cdecl;
var
  AIntf: IZxdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_output_v1_logical_position(TZxdgOutputV1(AData^.PascalObject), AX, AY);
end;

procedure zxdg_output_v1_logical_size_Intf(AData: PWLUserData; Azxdg_output_v1: Pzxdg_output_v1; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IZxdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_output_v1_logical_size(TZxdgOutputV1(AData^.PascalObject), AWidth, AHeight);
end;

procedure zxdg_output_v1_done_Intf(AData: PWLUserData; Azxdg_output_v1: Pzxdg_output_v1); cdecl;
var
  AIntf: IZxdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_output_v1_done(TZxdgOutputV1(AData^.PascalObject));
end;

procedure zxdg_output_v1_name_Intf(AData: PWLUserData; Azxdg_output_v1: Pzxdg_output_v1; AName: Pchar); cdecl;
var
  AIntf: IZxdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_output_v1_name(TZxdgOutputV1(AData^.PascalObject), AName);
end;

procedure zxdg_output_v1_description_Intf(AData: PWLUserData; Azxdg_output_v1: Pzxdg_output_v1; ADescription: Pchar); cdecl;
var
  AIntf: IZxdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_output_v1_description(TZxdgOutputV1(AData^.PascalObject), ADescription);
end;



const
  pInterfaces: array[0..9] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zxdg_output_v1_interface),
    (@wl_output_interface)
  );

  zxdg_output_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_xdg_output'; signature: 'no'; types: @pInterfaces[8])
  );
  zxdg_output_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_output_v1_events: array[0..4] of Twl_message = (
    (name: 'logical_position'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'logical_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'name'; signature: '2s'; types: @pInterfaces[0]),
    (name: 'description'; signature: '2s'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_output_v1_Listener.logical_position) := @zxdg_output_v1_logical_position_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.logical_size) := @zxdg_output_v1_logical_size_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.done) := @zxdg_output_v1_done_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.name) := @zxdg_output_v1_name_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.description) := @zxdg_output_v1_description_Intf;


  zxdg_output_manager_v1_interface.name := 'zxdg_output_manager_v1';
  zxdg_output_manager_v1_interface.version := 2;
  zxdg_output_manager_v1_interface.method_count := 2;
  zxdg_output_manager_v1_interface.methods := @zxdg_output_manager_v1_requests;
  zxdg_output_manager_v1_interface.event_count := 0;
  zxdg_output_manager_v1_interface.events := nil;

  zxdg_output_v1_interface.name := 'zxdg_output_v1';
  zxdg_output_v1_interface.version := 2;
  zxdg_output_v1_interface.method_count := 1;
  zxdg_output_v1_interface.methods := @zxdg_output_v1_requests;
  zxdg_output_v1_interface.event_count := 5;
  zxdg_output_v1_interface.events := @zxdg_output_v1_events;

end.
