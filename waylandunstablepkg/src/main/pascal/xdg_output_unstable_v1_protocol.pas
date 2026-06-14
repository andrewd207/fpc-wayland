unit xdg_output_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_output_manager_v1 = Pointer;
  Pxdg_output_v1 = Pointer;
  Pxdg_output_manager_v1_listener = ^Txdg_output_manager_v1_listener;
  Txdg_output_manager_v1_listener = record
  end;

  Pxdg_output_v1_listener = ^Txdg_output_v1_listener;
  Txdg_output_v1_listener = record
    logical_position : procedure(data: Pointer; AXdgOutputV1: Pxdg_output_v1; AX: LongInt; AY: LongInt); cdecl;
    logical_size : procedure(data: Pointer; AXdgOutputV1: Pxdg_output_v1; AWidth: LongInt; AHeight: LongInt); cdecl;
    done : procedure(data: Pointer; AXdgOutputV1: Pxdg_output_v1); cdecl;
    name : procedure(data: Pointer; AXdgOutputV1: Pxdg_output_v1; AName: Pchar); cdecl;
    description : procedure(data: Pointer; AXdgOutputV1: Pxdg_output_v1; ADescription: Pchar); cdecl;
  end;



  TXdgOutputManagerV1 = class;
  TXdgOutputV1 = class;


  IXdgOutputManagerV1Listener = interface
  ['IXdgOutputManagerV1Listener']
  end;

  IXdgOutputV1Listener = interface
  ['IXdgOutputV1Listener']
    procedure xdg_output_v1_logical_position(AXdgOutputV1: TXdgOutputV1; AX: LongInt; AY: LongInt);
    procedure xdg_output_v1_logical_size(AXdgOutputV1: TXdgOutputV1; AWidth: LongInt; AHeight: LongInt);
    procedure xdg_output_v1_done(AXdgOutputV1: TXdgOutputV1);
    procedure xdg_output_v1_name(AXdgOutputV1: TXdgOutputV1; AName: String);
    procedure xdg_output_v1_description(AXdgOutputV1: TXdgOutputV1; ADescription: String);
  end;




  TXdgOutputManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgOutputManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_XDG_OUTPUT = 1;
  public
    destructor Destroy; override;
    function GetXdgOutput(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TXdgOutputV1}): TXdgOutputV1;
    function AddListener(AIntf: IXdgOutputManagerV1Listener): LongInt;
  end;

  TXdgOutputV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgOutputV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IXdgOutputV1Listener): LongInt;
  end;






var
  xdg_output_manager_v1_interface: Twl_interface;
  XDG_OUTPUT_MANAGER_V1_INTERFACE_NAME: String = 'zxdg_output_manager_v1';
  xdg_output_v1_interface: Twl_interface;
  XDG_OUTPUT_V1_INTERFACE_NAME: String = 'zxdg_output_v1';



implementation

var
  vxdg_output_manager_v1_registered: Boolean = False;
  vIntf_xdg_output_manager_v1_Listener: Txdg_output_manager_v1_listener;
  vxdg_output_v1_registered: Boolean = False;
  vIntf_xdg_output_v1_Listener: Txdg_output_v1_listener;



constructor TXdgOutputManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgOutputManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgOutputManagerV1;
begin
  RegisterInterface;
  Result := TXdgOutputManagerV1.Create(ARegistry.Bind(AName, @xdg_output_manager_v1_interface, AVersion));
end;

destructor TXdgOutputManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgOutputManagerV1.GetXdgOutput(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TXdgOutputV1}): TXdgOutputV1;
var
  id: Pwl_proxy;
begin
  TXdgOutputV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_OUTPUT, @xdg_output_v1_interface, nil, AOutput.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgOutputV1;
  Result := TXdgOutputV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgOutputV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgOutputV1]);
end;

function TXdgOutputManagerV1.AddListener(AIntf: IXdgOutputManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_output_manager_v1_Listener, @FUserDataRec);
end;
constructor TXdgOutputV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgOutputV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgOutputV1;
begin
  RegisterInterface;
  Result := TXdgOutputV1.Create(ARegistry.Bind(AName, @xdg_output_v1_interface, AVersion));
end;

destructor TXdgOutputV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgOutputV1.AddListener(AIntf: IXdgOutputV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_output_v1_Listener, @FUserDataRec);
end;




procedure xdg_output_v1_logical_position_Intf(AData: PWLUserData; Axdg_output_v1: Pxdg_output_v1; AX: LongInt; AY: LongInt); cdecl;
var
  AIntf: IXdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.xdg_output_v1_logical_position(TXdgOutputV1(AData^.PascalObject), AX, AY);
end;

procedure xdg_output_v1_logical_size_Intf(AData: PWLUserData; Axdg_output_v1: Pxdg_output_v1; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IXdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.xdg_output_v1_logical_size(TXdgOutputV1(AData^.PascalObject), AWidth, AHeight);
end;

procedure xdg_output_v1_done_Intf(AData: PWLUserData; Axdg_output_v1: Pxdg_output_v1); cdecl;
var
  AIntf: IXdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.xdg_output_v1_done(TXdgOutputV1(AData^.PascalObject));
end;

procedure xdg_output_v1_name_Intf(AData: PWLUserData; Axdg_output_v1: Pxdg_output_v1; AName: Pchar); cdecl;
var
  AIntf: IXdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.xdg_output_v1_name(TXdgOutputV1(AData^.PascalObject), AName);
end;

procedure xdg_output_v1_description_Intf(AData: PWLUserData; Axdg_output_v1: Pxdg_output_v1; ADescription: Pchar); cdecl;
var
  AIntf: IXdgOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgOutputV1Listener(AData^.ListenerUserData);
  AIntf.xdg_output_v1_description(TXdgOutputV1(AData^.PascalObject), ADescription);
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
    (@xdg_output_v1_interface),
    (@wl_output_interface)
  );

  xdg_output_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_xdg_output'; signature: 'no'; types: @pInterfaces[8])
  );
  xdg_output_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  xdg_output_v1_events: array[0..4] of Twl_message = (
    (name: 'logical_position'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'logical_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'name'; signature: '2s'; types: @pInterfaces[0]),
    (name: 'description'; signature: '2s'; types: @pInterfaces[0])
  );

class procedure TXdgOutputManagerV1.RegisterInterface;
begin
  if vxdg_output_manager_v1_registered then Exit;
  vxdg_output_manager_v1_registered := True;
  xdg_output_manager_v1_interface.name := PChar(XDG_OUTPUT_MANAGER_V1_INTERFACE_NAME);
  xdg_output_manager_v1_interface.version := 3;
  xdg_output_manager_v1_interface.method_count := 2;
  xdg_output_manager_v1_interface.methods := @xdg_output_manager_v1_requests;
  xdg_output_manager_v1_interface.event_count := 0;
  xdg_output_manager_v1_interface.events := nil;
end;

class procedure TXdgOutputV1.RegisterInterface;
begin
  if vxdg_output_v1_registered then Exit;
  vxdg_output_v1_registered := True;
  Pointer(vIntf_xdg_output_v1_Listener.logical_position) := @xdg_output_v1_logical_position_Intf;
  Pointer(vIntf_xdg_output_v1_Listener.logical_size) := @xdg_output_v1_logical_size_Intf;
  Pointer(vIntf_xdg_output_v1_Listener.done) := @xdg_output_v1_done_Intf;
  Pointer(vIntf_xdg_output_v1_Listener.name) := @xdg_output_v1_name_Intf;
  Pointer(vIntf_xdg_output_v1_Listener.description) := @xdg_output_v1_description_Intf;
  xdg_output_v1_interface.name := PChar(XDG_OUTPUT_V1_INTERFACE_NAME);
  xdg_output_v1_interface.version := 3;
  xdg_output_v1_interface.method_count := 1;
  xdg_output_v1_interface.methods := @xdg_output_v1_requests;
  xdg_output_v1_interface.event_count := 5;
  xdg_output_v1_interface.events := @xdg_output_v1_events;
end;


end.
