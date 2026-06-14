unit xdg_toplevel_icon_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, xdg_shell_protocol;


type
  Pxdg_toplevel_icon_manager_v1 = Pointer;
  Pxdg_toplevel_icon_v1 = Pointer;
  Pxdg_toplevel_icon_manager_v1_listener = ^Txdg_toplevel_icon_manager_v1_listener;
  Txdg_toplevel_icon_manager_v1_listener = record
    icon_size : procedure(data: Pointer; AXdgToplevelIconManagerV1: Pxdg_toplevel_icon_manager_v1; ASize: LongInt); cdecl;
    done : procedure(data: Pointer; AXdgToplevelIconManagerV1: Pxdg_toplevel_icon_manager_v1); cdecl;
  end;

const
  XDG_TOPLEVEL_ICON_V1_ERROR_INVALID_BUFFER = 1; // the provided buffer does not satisfy requirements
  XDG_TOPLEVEL_ICON_V1_ERROR_IMMUTABLE = 2; // the icon has already been assigned to a toplevel and must not be changed
  XDG_TOPLEVEL_ICON_V1_ERROR_NO_BUFFER = 3; // the provided buffer has been destroyed before the toplevel icon

type
  Pxdg_toplevel_icon_v1_listener = ^Txdg_toplevel_icon_v1_listener;
  Txdg_toplevel_icon_v1_listener = record
  end;



  TXdgToplevelIconManagerV1 = class;
  TXdgToplevelIconV1 = class;


  IXdgToplevelIconManagerV1Listener = interface
  ['IXdgToplevelIconManagerV1Listener']
    procedure xdg_toplevel_icon_manager_v1_icon_size(AXdgToplevelIconManagerV1: TXdgToplevelIconManagerV1; ASize: LongInt);
    procedure xdg_toplevel_icon_manager_v1_done(AXdgToplevelIconManagerV1: TXdgToplevelIconManagerV1);
  end;

  IXdgToplevelIconV1Listener = interface
  ['IXdgToplevelIconV1Listener']
  end;




  TXdgToplevelIconManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_ICON = 1;
    const _SET_ICON = 2;
  public
    destructor Destroy; override;
    function CreateIcon(AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelIconV1}): TXdgToplevelIconV1;
    procedure SetIcon(AToplevel: TXdgToplevel; AIcon: TXdgToplevelIconV1);
    function AddListener(AIntf: IXdgToplevelIconManagerV1Listener): LongInt;
  end;

  TXdgToplevelIconV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_NAME = 1;
    const _ADD_BUFFER = 2;
  public
    destructor Destroy; override;
    procedure SetName(AIconName: String);
    procedure AddBuffer(ABuffer: TWlBuffer; AScale: LongInt);
    function AddListener(AIntf: IXdgToplevelIconV1Listener): LongInt;
  end;






var
  xdg_toplevel_icon_manager_v1_interface: Twl_interface;
  XDG_TOPLEVEL_ICON_MANAGER_V1_INTERFACE_NAME: String = 'xdg_toplevel_icon_manager_v1';
  xdg_toplevel_icon_v1_interface: Twl_interface;
  XDG_TOPLEVEL_ICON_V1_INTERFACE_NAME: String = 'xdg_toplevel_icon_v1';



implementation

var
  vIntf_xdg_toplevel_icon_manager_v1_Listener: Txdg_toplevel_icon_manager_v1_listener;
  vIntf_xdg_toplevel_icon_v1_Listener: Txdg_toplevel_icon_v1_listener;



destructor TXdgToplevelIconManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgToplevelIconManagerV1.CreateIcon(AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelIconV1}): TXdgToplevelIconV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_ICON, @xdg_toplevel_icon_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TXdgToplevelIconV1;
  Result := TXdgToplevelIconV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgToplevelIconV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgToplevelIconV1]);
end;

procedure TXdgToplevelIconManagerV1.SetIcon(AToplevel: TXdgToplevel; AIcon: TXdgToplevelIconV1);
begin
  wl_proxy_marshal(FProxy, _SET_ICON, AToplevel.Proxy, AIcon.Proxy);
end;

function TXdgToplevelIconManagerV1.AddListener(AIntf: IXdgToplevelIconManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_icon_manager_v1_Listener, @FUserDataRec);
end;
destructor TXdgToplevelIconV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgToplevelIconV1.SetName(AIconName: String);
begin
  wl_proxy_marshal(FProxy, _SET_NAME, PChar(AIconName));
end;

procedure TXdgToplevelIconV1.AddBuffer(ABuffer: TWlBuffer; AScale: LongInt);
begin
  wl_proxy_marshal(FProxy, _ADD_BUFFER, ABuffer.Proxy, AScale);
end;

function TXdgToplevelIconV1.AddListener(AIntf: IXdgToplevelIconV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_icon_v1_Listener, @FUserDataRec);
end;




procedure xdg_toplevel_icon_manager_v1_icon_size_Intf(AData: PWLUserData; Axdg_toplevel_icon_manager_v1: Pxdg_toplevel_icon_manager_v1; ASize: LongInt); cdecl;
var
  AIntf: IXdgToplevelIconManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelIconManagerV1Listener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_icon_manager_v1_icon_size(TXdgToplevelIconManagerV1(AData^.PascalObject), ASize);
end;

procedure xdg_toplevel_icon_manager_v1_done_Intf(AData: PWLUserData; Axdg_toplevel_icon_manager_v1: Pxdg_toplevel_icon_manager_v1); cdecl;
var
  AIntf: IXdgToplevelIconManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelIconManagerV1Listener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_icon_manager_v1_done(TXdgToplevelIconManagerV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..12] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@xdg_toplevel_icon_v1_interface),
    (@xdg_toplevel_interface),
    (@xdg_toplevel_icon_v1_interface),
    (@wl_buffer_interface),
    (nil)
  );

  xdg_toplevel_icon_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_icon'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'set_icon'; signature: 'o?o'; types: @pInterfaces[9])
  );
  xdg_toplevel_icon_manager_v1_events: array[0..1] of Twl_message = (
    (name: 'icon_size'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0])
  );
  xdg_toplevel_icon_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_name'; signature: 's'; types: @pInterfaces[0]),
    (name: 'add_buffer'; signature: 'oi'; types: @pInterfaces[11])
  );

initialization
  Pointer(vIntf_xdg_toplevel_icon_manager_v1_Listener.icon_size) := @xdg_toplevel_icon_manager_v1_icon_size_Intf;
  Pointer(vIntf_xdg_toplevel_icon_manager_v1_Listener.done) := @xdg_toplevel_icon_manager_v1_done_Intf;


  xdg_toplevel_icon_manager_v1_interface.name := PChar(XDG_TOPLEVEL_ICON_MANAGER_V1_INTERFACE_NAME);
  xdg_toplevel_icon_manager_v1_interface.version := 1;
  xdg_toplevel_icon_manager_v1_interface.method_count := 3;
  xdg_toplevel_icon_manager_v1_interface.methods := @xdg_toplevel_icon_manager_v1_requests;
  xdg_toplevel_icon_manager_v1_interface.event_count := 2;
  xdg_toplevel_icon_manager_v1_interface.events := @xdg_toplevel_icon_manager_v1_events;

  xdg_toplevel_icon_v1_interface.name := PChar(XDG_TOPLEVEL_ICON_V1_INTERFACE_NAME);
  xdg_toplevel_icon_v1_interface.version := 1;
  xdg_toplevel_icon_v1_interface.method_count := 3;
  xdg_toplevel_icon_v1_interface.methods := @xdg_toplevel_icon_v1_requests;
  xdg_toplevel_icon_v1_interface.event_count := 0;
  xdg_toplevel_icon_v1_interface.events := nil;

end.
