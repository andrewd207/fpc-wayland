unit xdg_decoration_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, xdg_shell_protocol;


type
  Pxdg_decoration_manager_v1 = Pointer;
  Pxdg_toplevel_decoration_v1 = Pointer;
  Pxdg_decoration_manager_v1_listener = ^Txdg_decoration_manager_v1_listener;
  Txdg_decoration_manager_v1_listener = record
  end;

const
  XDG_TOPLEVEL_DECORATION_V1_ERROR_UNCONFIGURED_BUFFER = 0; // xdg_toplevel has a buffer attached before configure
  XDG_TOPLEVEL_DECORATION_V1_ERROR_ALREADY_CONSTRUCTED = 1; // xdg_toplevel already has a decoration object
  XDG_TOPLEVEL_DECORATION_V1_ERROR_ORPHANED = 2; // xdg_toplevel destroyed before the decoration object
  XDG_TOPLEVEL_DECORATION_V1_ERROR_INVALID_MODE = 3; // invalid mode
  XDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE = 1; // no server-side window decoration
  XDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE = 2; // server-side window decoration

type
  Pxdg_toplevel_decoration_v1_listener = ^Txdg_toplevel_decoration_v1_listener;
  Txdg_toplevel_decoration_v1_listener = record
    configure : procedure(data: Pointer; AXdgToplevelDecorationV1: Pxdg_toplevel_decoration_v1; AMode: DWord); cdecl;
  end;



  TXdgDecorationManagerV1 = class;
  TXdgToplevelDecorationV1 = class;


  IXdgDecorationManagerV1Listener = interface
  ['IXdgDecorationManagerV1Listener']
  end;

  IXdgToplevelDecorationV1Listener = interface
  ['IXdgToplevelDecorationV1Listener']
    procedure xdg_toplevel_decoration_v1_configure(AXdgToplevelDecorationV1: TXdgToplevelDecorationV1; AMode: DWord);
  end;




  TXdgDecorationManagerV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_TOPLEVEL_DECORATION = 1;
  public
    destructor Destroy; override;
    function GetToplevelDecoration(AToplevel: TXdgToplevel; AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelDecorationV1}): TXdgToplevelDecorationV1;
    function AddListener(AIntf: IXdgDecorationManagerV1Listener): LongInt;
  end;

  TXdgToplevelDecorationV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_MODE = 1;
    const _UNSET_MODE = 2;
  public
    destructor Destroy; override;
    procedure SetMode(AMode: DWord);
    procedure UnsetMode;
    function AddListener(AIntf: IXdgToplevelDecorationV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  xdg_decoration_manager_v1_interface: Twl_interface;
  XDG_DECORATION_MANAGER_V1_INTERFACE_NAME: String = 'zxdg_decoration_manager_v1';
  xdg_toplevel_decoration_v1_interface: Twl_interface;
  XDG_TOPLEVEL_DECORATION_V1_INTERFACE_NAME: String = 'zxdg_toplevel_decoration_v1';



implementation

var
  vIntf_xdg_decoration_manager_v1_Listener: Txdg_decoration_manager_v1_listener;
  vIntf_xdg_toplevel_decoration_v1_Listener: Txdg_toplevel_decoration_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TXdgDecorationManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TXdgDecorationManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgDecorationManagerV1.GetToplevelDecoration(AToplevel: TXdgToplevel; AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelDecorationV1}): TXdgToplevelDecorationV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOPLEVEL_DECORATION, @xdg_toplevel_decoration_v1_interface, nil, AToplevel.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgToplevelDecorationV1;
  Result := TXdgToplevelDecorationV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgToplevelDecorationV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgToplevelDecorationV1]);
end;

function TXdgDecorationManagerV1.AddListener(AIntf: IXdgDecorationManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_decoration_manager_v1_Listener, @FUserDataRec);
end;
constructor TXdgToplevelDecorationV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TXdgToplevelDecorationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgToplevelDecorationV1.SetMode(AMode: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_MODE, AMode);
end;

procedure TXdgToplevelDecorationV1.UnsetMode;
begin
  wl_proxy_marshal(FProxy, _UNSET_MODE);
end;

function TXdgToplevelDecorationV1.AddListener(AIntf: IXdgToplevelDecorationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_decoration_v1_Listener, @FUserDataRec);
end;




procedure xdg_toplevel_decoration_v1_configure_Intf(AData: PWLUserData; Axdg_toplevel_decoration_v1: Pxdg_toplevel_decoration_v1; AMode: DWord); cdecl;
var
  AIntf: IXdgToplevelDecorationV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelDecorationV1Listener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_decoration_v1_configure(TXdgToplevelDecorationV1(AData^.PascalObject), AMode);
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
    (@xdg_toplevel_decoration_v1_interface),
    (@xdg_toplevel_interface)
  );

  xdg_decoration_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel_decoration'; signature: 'no'; types: @pInterfaces[8])
  );
  xdg_toplevel_decoration_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_mode'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'unset_mode'; signature: ''; types: @pInterfaces[0])
  );
  xdg_toplevel_decoration_v1_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_xdg_toplevel_decoration_v1_Listener.configure) := @xdg_toplevel_decoration_v1_configure_Intf;


  xdg_decoration_manager_v1_interface.name := PChar(XDG_DECORATION_MANAGER_V1_INTERFACE_NAME);
  xdg_decoration_manager_v1_interface.version := 1;
  xdg_decoration_manager_v1_interface.method_count := 2;
  xdg_decoration_manager_v1_interface.methods := @xdg_decoration_manager_v1_requests;
  xdg_decoration_manager_v1_interface.event_count := 0;
  xdg_decoration_manager_v1_interface.events := nil;

  xdg_toplevel_decoration_v1_interface.name := PChar(XDG_TOPLEVEL_DECORATION_V1_INTERFACE_NAME);
  xdg_toplevel_decoration_v1_interface.version := 1;
  xdg_toplevel_decoration_v1_interface.method_count := 3;
  xdg_toplevel_decoration_v1_interface.methods := @xdg_toplevel_decoration_v1_requests;
  xdg_toplevel_decoration_v1_interface.event_count := 1;
  xdg_toplevel_decoration_v1_interface.events := @xdg_toplevel_decoration_v1_events;

end;

end.
