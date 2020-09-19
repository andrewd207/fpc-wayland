unit xdg_shell_unstable_v5_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_shell = Pointer;
  Pxdg_surface = Pointer;
  Pxdg_popup = Pointer;
const
  XDG_SHELL_VERSION_CURRENT = 5; // Always the latest version
  XDG_SHELL_ERROR_ROLE = 0; // given wl_surface has another role
  XDG_SHELL_ERROR_DEFUNCT_SURFACES = 1; // xdg_shell was destroyed before children
  XDG_SHELL_ERROR_NOT_THE_TOPMOST_POPUP = 2; // the client tried to map or destroy a non-topmost popup
  XDG_SHELL_ERROR_INVALID_POPUP_PARENT = 3; // the client specified an invalid popup parent surface

type
  Pxdg_shell_listener = ^Txdg_shell_listener;
  Txdg_shell_listener = record
    ping : procedure(data: Pointer; AXdgShell: Pxdg_shell; ASerial: DWord); cdecl;
  end;

const
  XDG_SURFACE_RESIZE_EDGE_NONE = 0; // 
  XDG_SURFACE_RESIZE_EDGE_TOP = 1; // 
  XDG_SURFACE_RESIZE_EDGE_BOTTOM = 2; // 
  XDG_SURFACE_RESIZE_EDGE_LEFT = 4; // 
  XDG_SURFACE_RESIZE_EDGE_TOP_LEFT = 5; // 
  XDG_SURFACE_RESIZE_EDGE_BOTTOM_LEFT = 6; // 
  XDG_SURFACE_RESIZE_EDGE_RIGHT = 8; // 
  XDG_SURFACE_RESIZE_EDGE_TOP_RIGHT = 9; // 
  XDG_SURFACE_RESIZE_EDGE_BOTTOM_RIGHT = 10; // 
  XDG_SURFACE_STATE_MAXIMIZED = 1; // the surface is maximized
  XDG_SURFACE_STATE_FULLSCREEN = 2; // the surface is fullscreen
  XDG_SURFACE_STATE_RESIZING = 3; // the surface is being resized
  XDG_SURFACE_STATE_ACTIVATED = 4; // the surface is now activated

type
  Pxdg_surface_listener = ^Txdg_surface_listener;
  Txdg_surface_listener = record
    configure : procedure(data: Pointer; AXdgSurface: Pxdg_surface; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array; ASerial: DWord); cdecl;
    close : procedure(data: Pointer; AXdgSurface: Pxdg_surface); cdecl;
  end;

  Pxdg_popup_listener = ^Txdg_popup_listener;
  Txdg_popup_listener = record
    popup_done : procedure(data: Pointer; AXdgPopup: Pxdg_popup); cdecl;
  end;



  TXdgShell = class;
  TXdgSurface = class;
  TXdgPopup = class;


  IXdgShellListener = interface
  ['IXdgShellListener']
    procedure xdg_shell_ping(AXdgShell: TXdgShell; ASerial: DWord);
  end;

  IXdgSurfaceListener = interface
  ['IXdgSurfaceListener']
    procedure xdg_surface_configure(AXdgSurface: TXdgSurface; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array; ASerial: DWord);
    procedure xdg_surface_close(AXdgSurface: TXdgSurface);
  end;

  IXdgPopupListener = interface
  ['IXdgPopupListener']
    procedure xdg_popup_popup_done(AXdgPopup: TXdgPopup);
  end;




  TXdgShell = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _USE_UNSTABLE_VERSION = 1;
    const _GET_XDG_SURFACE = 2;
    const _GET_XDG_POPUP = 3;
    const _PONG = 4;
  public
    destructor Destroy; override;
    procedure UseUnstableVersion(AVersion: LongInt);
    function GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgSurface}): TXdgSurface;
    function GetXdgPopup(ASurface: TWlSurface; AParent: TWlSurface; ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt; AProxyClass: TWLProxyObjectClass = nil {TXdgPopup}): TXdgPopup;
    procedure Pong(ASerial: DWord);
    function AddListener(AIntf: IXdgShellListener): LongInt;
  end;

  TXdgSurface = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_PARENT = 1;
    const _SET_TITLE = 2;
    const _SET_APP_ID = 3;
    const _SHOW_WINDOW_MENU = 4;
    const _MOVE = 5;
    const _RESIZE = 6;
    const _ACK_CONFIGURE = 7;
    const _SET_WINDOW_GEOMETRY = 8;
    const _SET_MAXIMIZED = 9;
    const _UNSET_MAXIMIZED = 10;
    const _SET_FULLSCREEN = 11;
    const _UNSET_FULLSCREEN = 12;
    const _SET_MINIMIZED = 13;
  public
    destructor Destroy; override;
    procedure SetParent(AParent: TXdgSurface);
    procedure SetTitle(ATitle: String);
    procedure SetAppId(AAppId: String);
    procedure ShowWindowMenu(ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt);
    procedure Move(ASeat: TWlSeat; ASerial: DWord);
    procedure Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
    procedure AckConfigure(ASerial: DWord);
    procedure SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure SetMaximized;
    procedure UnsetMaximized;
    procedure SetFullscreen(AOutput: TWlOutput);
    procedure UnsetFullscreen;
    procedure SetMinimized;
    function AddListener(AIntf: IXdgSurfaceListener): LongInt;
  end;

  TXdgPopup = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IXdgPopupListener): LongInt;
  end;






var
  xdg_shell_interface: Twl_interface;
  xdg_surface_interface: Twl_interface;
  xdg_popup_interface: Twl_interface;



implementation

var
  vIntf_xdg_shell_Listener: Txdg_shell_listener;
  vIntf_xdg_surface_Listener: Txdg_surface_listener;
  vIntf_xdg_popup_Listener: Txdg_popup_listener;



destructor TXdgShell.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgShell.UseUnstableVersion(AVersion: LongInt);
begin
  wl_proxy_marshal(FProxy, _USE_UNSTABLE_VERSION, AVersion);
end;

function TXdgShell.GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgSurface}): TXdgSurface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_SURFACE, @xdg_surface_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgSurface;
  Result := TXdgSurface(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgSurface) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgSurface]);
end;

function TXdgShell.GetXdgPopup(ASurface: TWlSurface; AParent: TWlSurface; ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt; AProxyClass: TWLProxyObjectClass = nil {TXdgPopup}): TXdgPopup;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_POPUP, @xdg_popup_interface, nil, ASurface.Proxy, AParent.Proxy, ASeat.Proxy, ASerial, AX, AY);
  if AProxyClass = nil then
    AProxyClass := TXdgPopup;
  Result := TXdgPopup(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgPopup) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgPopup]);
end;

procedure TXdgShell.Pong(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _PONG, ASerial);
end;

function TXdgShell.AddListener(AIntf: IXdgShellListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_shell_Listener, @FUserDataRec);
end;
destructor TXdgSurface.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgSurface.SetParent(AParent: TXdgSurface);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT, AParent.Proxy);
end;

procedure TXdgSurface.SetTitle(ATitle: String);
begin
  wl_proxy_marshal(FProxy, _SET_TITLE, PChar(ATitle));
end;

procedure TXdgSurface.SetAppId(AAppId: String);
begin
  wl_proxy_marshal(FProxy, _SET_APP_ID, PChar(AAppId));
end;

procedure TXdgSurface.ShowWindowMenu(ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SHOW_WINDOW_MENU, ASeat.Proxy, ASerial, AX, AY);
end;

procedure TXdgSurface.Move(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _MOVE, ASeat.Proxy, ASerial);
end;

procedure TXdgSurface.Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
begin
  wl_proxy_marshal(FProxy, _RESIZE, ASeat.Proxy, ASerial, AEdges);
end;

procedure TXdgSurface.AckConfigure(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _ACK_CONFIGURE, ASerial);
end;

procedure TXdgSurface.SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_WINDOW_GEOMETRY, AX, AY, AWidth, AHeight);
end;

procedure TXdgSurface.SetMaximized;
begin
  wl_proxy_marshal(FProxy, _SET_MAXIMIZED);
end;

procedure TXdgSurface.UnsetMaximized;
begin
  wl_proxy_marshal(FProxy, _UNSET_MAXIMIZED);
end;

procedure TXdgSurface.SetFullscreen(AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _SET_FULLSCREEN, AOutput.Proxy);
end;

procedure TXdgSurface.UnsetFullscreen;
begin
  wl_proxy_marshal(FProxy, _UNSET_FULLSCREEN);
end;

procedure TXdgSurface.SetMinimized;
begin
  wl_proxy_marshal(FProxy, _SET_MINIMIZED);
end;

function TXdgSurface.AddListener(AIntf: IXdgSurfaceListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_surface_Listener, @FUserDataRec);
end;
destructor TXdgPopup.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgPopup.AddListener(AIntf: IXdgPopupListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_popup_Listener, @FUserDataRec);
end;




procedure xdg_shell_ping_Intf(AData: PWLUserData; Axdg_shell: Pxdg_shell; ASerial: DWord); cdecl;
var
  AIntf: IXdgShellListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgShellListener(AData^.ListenerUserData);
  AIntf.xdg_shell_ping(TXdgShell(AData^.PascalObject), ASerial);
end;

procedure xdg_surface_configure_Intf(AData: PWLUserData; Axdg_surface: Pxdg_surface; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array; ASerial: DWord); cdecl;
var
  AIntf: IXdgSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgSurfaceListener(AData^.ListenerUserData);
  AIntf.xdg_surface_configure(TXdgSurface(AData^.PascalObject), AWidth, AHeight, AStates, ASerial);
end;

procedure xdg_surface_close_Intf(AData: PWLUserData; Axdg_surface: Pxdg_surface); cdecl;
var
  AIntf: IXdgSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgSurfaceListener(AData^.ListenerUserData);
  AIntf.xdg_surface_close(TXdgSurface(AData^.PascalObject));
end;

procedure xdg_popup_popup_done_Intf(AData: PWLUserData; Axdg_popup: Pxdg_popup); cdecl;
var
  AIntf: IXdgPopupListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgPopupListener(AData^.ListenerUserData);
  AIntf.xdg_popup_popup_done(TXdgPopup(AData^.PascalObject));
end;



const
  pInterfaces: array[0..27] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@xdg_surface_interface),
    (@wl_surface_interface),
    (@xdg_popup_interface),
    (@wl_surface_interface),
    (@wl_surface_interface),
    (@wl_seat_interface),
    (nil),
    (nil),
    (nil),
    (@xdg_surface_interface),
    (@wl_seat_interface),
    (nil),
    (nil),
    (nil),
    (@wl_seat_interface),
    (nil),
    (@wl_seat_interface),
    (nil),
    (nil),
    (@wl_output_interface)
  );

  xdg_shell_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'use_unstable_version'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_xdg_popup'; signature: 'nooouii'; types: @pInterfaces[10]),
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_shell_events: array[0..0] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_surface_requests: array[0..13] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent'; signature: '?o'; types: @pInterfaces[17]),
    (name: 'set_title'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_app_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'show_window_menu'; signature: 'ouii'; types: @pInterfaces[18]),
    (name: 'move'; signature: 'ou'; types: @pInterfaces[22]),
    (name: 'resize'; signature: 'ouu'; types: @pInterfaces[24]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'unset_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_fullscreen'; signature: '?o'; types: @pInterfaces[27]),
    (name: 'unset_fullscreen'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_minimized'; signature: ''; types: @pInterfaces[0])
  );
  xdg_surface_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iiau'; types: @pInterfaces[0]),
    (name: 'close'; signature: ''; types: @pInterfaces[0])
  );
  xdg_popup_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  xdg_popup_events: array[0..0] of Twl_message = (
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_xdg_shell_Listener.ping) := @xdg_shell_ping_Intf;
  Pointer(vIntf_xdg_surface_Listener.configure) := @xdg_surface_configure_Intf;
  Pointer(vIntf_xdg_surface_Listener.close) := @xdg_surface_close_Intf;
  Pointer(vIntf_xdg_popup_Listener.popup_done) := @xdg_popup_popup_done_Intf;


  xdg_shell_interface.name := 'xdg_shell';
  xdg_shell_interface.version := 1;
  xdg_shell_interface.method_count := 5;
  xdg_shell_interface.methods := @xdg_shell_requests;
  xdg_shell_interface.event_count := 1;
  xdg_shell_interface.events := @xdg_shell_events;

  xdg_surface_interface.name := 'xdg_surface';
  xdg_surface_interface.version := 1;
  xdg_surface_interface.method_count := 14;
  xdg_surface_interface.methods := @xdg_surface_requests;
  xdg_surface_interface.event_count := 2;
  xdg_surface_interface.events := @xdg_surface_events;

  xdg_popup_interface.name := 'xdg_popup';
  xdg_popup_interface.version := 1;
  xdg_popup_interface.method_count := 1;
  xdg_popup_interface.methods := @xdg_popup_requests;
  xdg_popup_interface.event_count := 1;
  xdg_popup_interface.events := @xdg_popup_events;

end.
