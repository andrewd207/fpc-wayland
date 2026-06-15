unit xdg_shell_unstable_v6_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_shell_v6 = Pointer;
  Pxdg_positioner_v6 = Pointer;
  Pxdg_surface_v6 = Pointer;
  Pxdg_toplevel_v6 = Pointer;
  Pxdg_popup_v6 = Pointer;
const
  XDG_SHELL_V6_ERROR_ROLE = 0; // given wl_surface has another role
  XDG_SHELL_V6_ERROR_DEFUNCT_SURFACES = 1; // xdg_shell was destroyed before children
  XDG_SHELL_V6_ERROR_NOT_THE_TOPMOST_POPUP = 2; // the client tried to map or destroy a non-topmost popup
  XDG_SHELL_V6_ERROR_INVALID_POPUP_PARENT = 3; // the client specified an invalid popup parent surface
  XDG_SHELL_V6_ERROR_INVALID_SURFACE_STATE = 4; // the client provided an invalid surface state
  XDG_SHELL_V6_ERROR_INVALID_POSITIONER = 5; // the client provided an invalid positioner

type
  Pxdg_shell_v6_listener = ^Txdg_shell_v6_listener;
  Txdg_shell_v6_listener = record
    ping : procedure(data: Pointer; AXdgShellV6: Pxdg_shell_v6; ASerial: DWord); cdecl;
  end;

const
  XDG_POSITIONER_V6_ERROR_INVALID_INPUT = 0; // invalid input provided
  XDG_POSITIONER_V6_ANCHOR_NONE = 0; // the center of the anchor rectangle
  XDG_POSITIONER_V6_ANCHOR_TOP = 1; // the top edge of the anchor rectangle
  XDG_POSITIONER_V6_ANCHOR_BOTTOM = 2; // the bottom edge of the anchor rectangle
  XDG_POSITIONER_V6_ANCHOR_LEFT = 4; // the left edge of the anchor rectangle
  XDG_POSITIONER_V6_ANCHOR_RIGHT = 8; // the right edge of the anchor rectangle
  XDG_POSITIONER_V6_GRAVITY_NONE = 0; // center over the anchor edge
  XDG_POSITIONER_V6_GRAVITY_TOP = 1; // position above the anchor edge
  XDG_POSITIONER_V6_GRAVITY_BOTTOM = 2; // position below the anchor edge
  XDG_POSITIONER_V6_GRAVITY_LEFT = 4; // position to the left of the anchor edge
  XDG_POSITIONER_V6_GRAVITY_RIGHT = 8; // position to the right of the anchor edge
  XDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_NONE = 0; // don't move the child surface when constrained
  XDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_SLIDE_X = 1; // move along the x axis until unconstrained
  XDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_SLIDE_Y = 2; // move along the y axis until unconstrained
  XDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_FLIP_X = 4; // invert the anchor and gravity on the x axis
  XDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_FLIP_Y = 8; // invert the anchor and gravity on the y axis
  XDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_RESIZE_X = 16; // horizontally resize the surface
  XDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_RESIZE_Y = 32; // vertically resize the surface

type
  Pxdg_positioner_v6_listener = ^Txdg_positioner_v6_listener;
  Txdg_positioner_v6_listener = record
  end;

const
  XDG_SURFACE_V6_ERROR_NOT_CONSTRUCTED = 1;
  XDG_SURFACE_V6_ERROR_ALREADY_CONSTRUCTED = 2;
  XDG_SURFACE_V6_ERROR_UNCONFIGURED_BUFFER = 3;

type
  Pxdg_surface_v6_listener = ^Txdg_surface_v6_listener;
  Txdg_surface_v6_listener = record
    configure : procedure(data: Pointer; AXdgSurfaceV6: Pxdg_surface_v6; ASerial: DWord); cdecl;
  end;

const
  XDG_TOPLEVEL_V6_RESIZE_EDGE_NONE = 0;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_TOP = 1;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM = 2;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_LEFT = 4;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_TOP_LEFT = 5;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM_LEFT = 6;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_RIGHT = 8;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_TOP_RIGHT = 9;
  XDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM_RIGHT = 10;
  XDG_TOPLEVEL_V6_STATE_MAXIMIZED = 1; // the surface is maximized
  XDG_TOPLEVEL_V6_STATE_FULLSCREEN = 2; // the surface is fullscreen
  XDG_TOPLEVEL_V6_STATE_RESIZING = 3; // the surface is being resized
  XDG_TOPLEVEL_V6_STATE_ACTIVATED = 4; // the surface is now activated

type
  Pxdg_toplevel_v6_listener = ^Txdg_toplevel_v6_listener;
  Txdg_toplevel_v6_listener = record
    configure : procedure(data: Pointer; AXdgToplevelV6: Pxdg_toplevel_v6; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array); cdecl;
    close : procedure(data: Pointer; AXdgToplevelV6: Pxdg_toplevel_v6); cdecl;
  end;

const
  XDG_POPUP_V6_ERROR_INVALID_GRAB = 0; // tried to grab after being mapped

type
  Pxdg_popup_v6_listener = ^Txdg_popup_v6_listener;
  Txdg_popup_v6_listener = record
    configure : procedure(data: Pointer; AXdgPopupV6: Pxdg_popup_v6; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
    popup_done : procedure(data: Pointer; AXdgPopupV6: Pxdg_popup_v6); cdecl;
  end;



  TXdgShellV6 = class;
  TXdgPositionerV6 = class;
  TXdgSurfaceV6 = class;
  TXdgToplevelV6 = class;
  TXdgPopupV6 = class;


  IXdgShellV6Listener = interface
  ['IXdgShellV6Listener']
    procedure xdg_shell_v6_ping(AXdgShellV6: TXdgShellV6; ASerial: DWord);
  end;

  IXdgPositionerV6Listener = interface
  ['IXdgPositionerV6Listener']
  end;

  IXdgSurfaceV6Listener = interface
  ['IXdgSurfaceV6Listener']
    procedure xdg_surface_v6_configure(AXdgSurfaceV6: TXdgSurfaceV6; ASerial: DWord);
  end;

  IXdgToplevelV6Listener = interface
  ['IXdgToplevelV6Listener']
    procedure xdg_toplevel_v6_configure(AXdgToplevelV6: TXdgToplevelV6; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array);
    procedure xdg_toplevel_v6_close(AXdgToplevelV6: TXdgToplevelV6);
  end;

  IXdgPopupV6Listener = interface
  ['IXdgPopupV6Listener']
    procedure xdg_popup_v6_configure(AXdgPopupV6: TXdgPopupV6; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure xdg_popup_v6_popup_done(AXdgPopupV6: TXdgPopupV6);
  end;




  TXdgShellV6 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgShellV6;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _CREATE_POSITIONER = 1;
    const _GET_XDG_SURFACE = 2;
    const _PONG = 3;
  public
    destructor Destroy; override;
    function CreatePositioner(AProxyClass: TWLProxyObjectClass = nil {TXdgPositionerV6}): TXdgPositionerV6;
    function GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgSurfaceV6}): TXdgSurfaceV6;
    procedure Pong(ASerial: DWord);
    function AddListener(AIntf: IXdgShellV6Listener): LongInt;
  end;

  TXdgPositionerV6 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgPositionerV6;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_SIZE = 1;
    const _SET_ANCHOR_RECT = 2;
    const _SET_ANCHOR = 3;
    const _SET_GRAVITY = 4;
    const _SET_CONSTRAINT_ADJUSTMENT = 5;
    const _SET_OFFSET = 6;
  public
    destructor Destroy; override;
    procedure SetSize(AWidth: LongInt; AHeight: LongInt);
    procedure SetAnchorRect(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure SetAnchor(AAnchor: DWord);
    procedure SetGravity(AGravity: DWord);
    procedure SetConstraintAdjustment(AConstraintAdjustment: DWord);
    procedure SetOffset(AX: LongInt; AY: LongInt);
    function AddListener(AIntf: IXdgPositionerV6Listener): LongInt;
  end;

  TXdgSurfaceV6 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgSurfaceV6;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_TOPLEVEL = 1;
    const _GET_POPUP = 2;
    const _SET_WINDOW_GEOMETRY = 3;
    const _ACK_CONFIGURE = 4;
  public
    destructor Destroy; override;
    function GetToplevel(AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelV6}): TXdgToplevelV6;
    function GetPopup(AParent: TXdgSurfaceV6; APositioner: TXdgPositionerV6; AProxyClass: TWLProxyObjectClass = nil {TXdgPopupV6}): TXdgPopupV6;
    procedure SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure AckConfigure(ASerial: DWord);
    function AddListener(AIntf: IXdgSurfaceV6Listener): LongInt;
  end;

  TXdgToplevelV6 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgToplevelV6;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_PARENT = 1;
    const _SET_TITLE = 2;
    const _SET_APP_ID = 3;
    const _SHOW_WINDOW_MENU = 4;
    const _MOVE = 5;
    const _RESIZE = 6;
    const _SET_MAX_SIZE = 7;
    const _SET_MIN_SIZE = 8;
    const _SET_MAXIMIZED = 9;
    const _UNSET_MAXIMIZED = 10;
    const _SET_FULLSCREEN = 11;
    const _UNSET_FULLSCREEN = 12;
    const _SET_MINIMIZED = 13;
  public
    destructor Destroy; override;
    procedure SetParent(AParent: TXdgToplevelV6);
    procedure SetTitle(ATitle: String);
    procedure SetAppId(AAppId: String);
    procedure ShowWindowMenu(ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt);
    procedure Move(ASeat: TWlSeat; ASerial: DWord);
    procedure Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
    procedure SetMaxSize(AWidth: LongInt; AHeight: LongInt);
    procedure SetMinSize(AWidth: LongInt; AHeight: LongInt);
    procedure SetMaximized;
    procedure UnsetMaximized;
    procedure SetFullscreen(AOutput: TWlOutput);
    procedure UnsetFullscreen;
    procedure SetMinimized;
    function AddListener(AIntf: IXdgToplevelV6Listener): LongInt;
  end;

  TXdgPopupV6 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgPopupV6;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GRAB = 1;
  public
    destructor Destroy; override;
    procedure Grab(ASeat: TWlSeat; ASerial: DWord);
    function AddListener(AIntf: IXdgPopupV6Listener): LongInt;
  end;






var
  xdg_shell_v6_interface: Twl_interface;
  XDG_SHELL_V6_INTERFACE_NAME: String = 'zxdg_shell_v6';
  xdg_positioner_v6_interface: Twl_interface;
  XDG_POSITIONER_V6_INTERFACE_NAME: String = 'zxdg_positioner_v6';
  xdg_surface_v6_interface: Twl_interface;
  XDG_SURFACE_V6_INTERFACE_NAME: String = 'zxdg_surface_v6';
  xdg_toplevel_v6_interface: Twl_interface;
  XDG_TOPLEVEL_V6_INTERFACE_NAME: String = 'zxdg_toplevel_v6';
  xdg_popup_v6_interface: Twl_interface;
  XDG_POPUP_V6_INTERFACE_NAME: String = 'zxdg_popup_v6';



implementation

var
  vxdg_shell_v6_registered: Boolean = False;
  vIntf_xdg_shell_v6_Listener: Txdg_shell_v6_listener;
  vxdg_positioner_v6_registered: Boolean = False;
  vIntf_xdg_positioner_v6_Listener: Txdg_positioner_v6_listener;
  vxdg_surface_v6_registered: Boolean = False;
  vIntf_xdg_surface_v6_Listener: Txdg_surface_v6_listener;
  vxdg_toplevel_v6_registered: Boolean = False;
  vIntf_xdg_toplevel_v6_Listener: Txdg_toplevel_v6_listener;
  vxdg_popup_v6_registered: Boolean = False;
  vIntf_xdg_popup_v6_Listener: Txdg_popup_v6_listener;



constructor TXdgShellV6.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgShellV6.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgShellV6;
begin
  RegisterInterface;
  Result := TXdgShellV6.Create(ARegistry.Bind(AName, @xdg_shell_v6_interface, AVersion));
end;

destructor TXdgShellV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgShellV6.CreatePositioner(AProxyClass: TWLProxyObjectClass = nil {TXdgPositionerV6}): TXdgPositionerV6;
var
  id: Pwl_proxy;
begin
  TXdgPositionerV6.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_POSITIONER, @xdg_positioner_v6_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TXdgPositionerV6;
  Result := TXdgPositionerV6(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgPositionerV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgPositionerV6]);
end;

function TXdgShellV6.GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgSurfaceV6}): TXdgSurfaceV6;
var
  id: Pwl_proxy;
begin
  TXdgSurfaceV6.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_SURFACE, @xdg_surface_v6_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgSurfaceV6;
  Result := TXdgSurfaceV6(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgSurfaceV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgSurfaceV6]);
end;

procedure TXdgShellV6.Pong(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _PONG, ASerial);
end;

function TXdgShellV6.AddListener(AIntf: IXdgShellV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_shell_v6_Listener, @FUserDataRec);
end;
constructor TXdgPositionerV6.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgPositionerV6.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgPositionerV6;
begin
  RegisterInterface;
  Result := TXdgPositionerV6.Create(ARegistry.Bind(AName, @xdg_positioner_v6_interface, AVersion));
end;

destructor TXdgPositionerV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgPositionerV6.SetSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_SIZE, AWidth, AHeight);
end;

procedure TXdgPositionerV6.SetAnchorRect(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_ANCHOR_RECT, AX, AY, AWidth, AHeight);
end;

procedure TXdgPositionerV6.SetAnchor(AAnchor: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ANCHOR, AAnchor);
end;

procedure TXdgPositionerV6.SetGravity(AGravity: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_GRAVITY, AGravity);
end;

procedure TXdgPositionerV6.SetConstraintAdjustment(AConstraintAdjustment: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONSTRAINT_ADJUSTMENT, AConstraintAdjustment);
end;

procedure TXdgPositionerV6.SetOffset(AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_OFFSET, AX, AY);
end;

function TXdgPositionerV6.AddListener(AIntf: IXdgPositionerV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_positioner_v6_Listener, @FUserDataRec);
end;
constructor TXdgSurfaceV6.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgSurfaceV6.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgSurfaceV6;
begin
  RegisterInterface;
  Result := TXdgSurfaceV6.Create(ARegistry.Bind(AName, @xdg_surface_v6_interface, AVersion));
end;

destructor TXdgSurfaceV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgSurfaceV6.GetToplevel(AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelV6}): TXdgToplevelV6;
var
  id: Pwl_proxy;
begin
  TXdgToplevelV6.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOPLEVEL, @xdg_toplevel_v6_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TXdgToplevelV6;
  Result := TXdgToplevelV6(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgToplevelV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgToplevelV6]);
end;

function TXdgSurfaceV6.GetPopup(AParent: TXdgSurfaceV6; APositioner: TXdgPositionerV6; AProxyClass: TWLProxyObjectClass = nil {TXdgPopupV6}): TXdgPopupV6;
var
  id: Pwl_proxy;
begin
  TXdgPopupV6.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_POPUP, @xdg_popup_v6_interface, nil, AParent.Proxy, APositioner.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgPopupV6;
  Result := TXdgPopupV6(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgPopupV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgPopupV6]);
end;

procedure TXdgSurfaceV6.SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_WINDOW_GEOMETRY, AX, AY, AWidth, AHeight);
end;

procedure TXdgSurfaceV6.AckConfigure(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _ACK_CONFIGURE, ASerial);
end;

function TXdgSurfaceV6.AddListener(AIntf: IXdgSurfaceV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_surface_v6_Listener, @FUserDataRec);
end;
constructor TXdgToplevelV6.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgToplevelV6.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgToplevelV6;
begin
  RegisterInterface;
  Result := TXdgToplevelV6.Create(ARegistry.Bind(AName, @xdg_toplevel_v6_interface, AVersion));
end;

destructor TXdgToplevelV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgToplevelV6.SetParent(AParent: TXdgToplevelV6);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT, AParent.Proxy);
end;

procedure TXdgToplevelV6.SetTitle(ATitle: String);
begin
  wl_proxy_marshal(FProxy, _SET_TITLE, PChar(ATitle));
end;

procedure TXdgToplevelV6.SetAppId(AAppId: String);
begin
  wl_proxy_marshal(FProxy, _SET_APP_ID, PChar(AAppId));
end;

procedure TXdgToplevelV6.ShowWindowMenu(ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SHOW_WINDOW_MENU, ASeat.Proxy, ASerial, AX, AY);
end;

procedure TXdgToplevelV6.Move(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _MOVE, ASeat.Proxy, ASerial);
end;

procedure TXdgToplevelV6.Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
begin
  wl_proxy_marshal(FProxy, _RESIZE, ASeat.Proxy, ASerial, AEdges);
end;

procedure TXdgToplevelV6.SetMaxSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_MAX_SIZE, AWidth, AHeight);
end;

procedure TXdgToplevelV6.SetMinSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_MIN_SIZE, AWidth, AHeight);
end;

procedure TXdgToplevelV6.SetMaximized;
begin
  wl_proxy_marshal(FProxy, _SET_MAXIMIZED);
end;

procedure TXdgToplevelV6.UnsetMaximized;
begin
  wl_proxy_marshal(FProxy, _UNSET_MAXIMIZED);
end;

procedure TXdgToplevelV6.SetFullscreen(AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _SET_FULLSCREEN, AOutput.Proxy);
end;

procedure TXdgToplevelV6.UnsetFullscreen;
begin
  wl_proxy_marshal(FProxy, _UNSET_FULLSCREEN);
end;

procedure TXdgToplevelV6.SetMinimized;
begin
  wl_proxy_marshal(FProxy, _SET_MINIMIZED);
end;

function TXdgToplevelV6.AddListener(AIntf: IXdgToplevelV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_v6_Listener, @FUserDataRec);
end;
constructor TXdgPopupV6.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgPopupV6.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgPopupV6;
begin
  RegisterInterface;
  Result := TXdgPopupV6.Create(ARegistry.Bind(AName, @xdg_popup_v6_interface, AVersion));
end;

destructor TXdgPopupV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgPopupV6.Grab(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _GRAB, ASeat.Proxy, ASerial);
end;

function TXdgPopupV6.AddListener(AIntf: IXdgPopupV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_popup_v6_Listener, @FUserDataRec);
end;




procedure xdg_shell_v6_ping_Intf(AData: PWLUserData; Axdg_shell_v6: Pxdg_shell_v6; ASerial: DWord); cdecl;
var
  AIntf: IXdgShellV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgShellV6Listener(AData^.ListenerUserData);
  AIntf.xdg_shell_v6_ping(TXdgShellV6(AData^.PascalObject), ASerial);
end;

procedure xdg_surface_v6_configure_Intf(AData: PWLUserData; Axdg_surface_v6: Pxdg_surface_v6; ASerial: DWord); cdecl;
var
  AIntf: IXdgSurfaceV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgSurfaceV6Listener(AData^.ListenerUserData);
  AIntf.xdg_surface_v6_configure(TXdgSurfaceV6(AData^.PascalObject), ASerial);
end;

procedure xdg_toplevel_v6_configure_Intf(AData: PWLUserData; Axdg_toplevel_v6: Pxdg_toplevel_v6; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array); cdecl;
var
  AIntf: IXdgToplevelV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelV6Listener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_v6_configure(TXdgToplevelV6(AData^.PascalObject), AWidth, AHeight, AStates);
end;

procedure xdg_toplevel_v6_close_Intf(AData: PWLUserData; Axdg_toplevel_v6: Pxdg_toplevel_v6); cdecl;
var
  AIntf: IXdgToplevelV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelV6Listener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_v6_close(TXdgToplevelV6(AData^.PascalObject));
end;

procedure xdg_popup_v6_configure_Intf(AData: PWLUserData; Axdg_popup_v6: Pxdg_popup_v6; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IXdgPopupV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgPopupV6Listener(AData^.ListenerUserData);
  AIntf.xdg_popup_v6_configure(TXdgPopupV6(AData^.PascalObject), AX, AY, AWidth, AHeight);
end;

procedure xdg_popup_v6_popup_done_Intf(AData: PWLUserData; Axdg_popup_v6: Pxdg_popup_v6); cdecl;
var
  AIntf: IXdgPopupV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgPopupV6Listener(AData^.ListenerUserData);
  AIntf.xdg_popup_v6_popup_done(TXdgPopupV6(AData^.PascalObject));
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
    (@xdg_positioner_v6_interface),
    (@xdg_surface_v6_interface),
    (@wl_surface_interface),
    (@xdg_toplevel_v6_interface),
    (@xdg_popup_v6_interface),
    (@xdg_surface_v6_interface),
    (@xdg_positioner_v6_interface),
    (@xdg_toplevel_v6_interface),
    (@wl_seat_interface),
    (nil),
    (nil),
    (nil),
    (@wl_seat_interface),
    (nil),
    (@wl_seat_interface),
    (nil),
    (nil),
    (@wl_output_interface),
    (@wl_seat_interface),
    (nil)
  );

  xdg_shell_v6_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_positioner'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_shell_v6_events: array[0..0] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_positioner_v6_requests: array[0..6] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_anchor_rect'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_anchor'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_gravity'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_constraint_adjustment'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_offset'; signature: 'ii'; types: @pInterfaces[0])
  );
  xdg_surface_v6_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel'; signature: 'n'; types: @pInterfaces[11]),
    (name: 'get_popup'; signature: 'noo'; types: @pInterfaces[12]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_surface_v6_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_toplevel_v6_requests: array[0..13] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent'; signature: '?o'; types: @pInterfaces[15]),
    (name: 'set_title'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_app_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'show_window_menu'; signature: 'ouii'; types: @pInterfaces[16]),
    (name: 'move'; signature: 'ou'; types: @pInterfaces[20]),
    (name: 'resize'; signature: 'ouu'; types: @pInterfaces[22]),
    (name: 'set_max_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_min_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'unset_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_fullscreen'; signature: '?o'; types: @pInterfaces[25]),
    (name: 'unset_fullscreen'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_minimized'; signature: ''; types: @pInterfaces[0])
  );
  xdg_toplevel_v6_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iia'; types: @pInterfaces[0]),
    (name: 'close'; signature: ''; types: @pInterfaces[0])
  );
  xdg_popup_v6_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab'; signature: 'ou'; types: @pInterfaces[26])
  );
  xdg_popup_v6_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0])
  );

class procedure TXdgShellV6.RegisterInterface;
begin
  if vxdg_shell_v6_registered then Exit;
  vxdg_shell_v6_registered := True;
  Pointer(vIntf_xdg_shell_v6_Listener.ping) := @xdg_shell_v6_ping_Intf;
  xdg_shell_v6_interface.name := PChar(XDG_SHELL_V6_INTERFACE_NAME);
  xdg_shell_v6_interface.version := 1;
  xdg_shell_v6_interface.method_count := 4;
  xdg_shell_v6_interface.methods := @xdg_shell_v6_requests;
  xdg_shell_v6_interface.event_count := 1;
  xdg_shell_v6_interface.events := @xdg_shell_v6_events;
end;

class procedure TXdgPositionerV6.RegisterInterface;
begin
  if vxdg_positioner_v6_registered then Exit;
  vxdg_positioner_v6_registered := True;
  xdg_positioner_v6_interface.name := PChar(XDG_POSITIONER_V6_INTERFACE_NAME);
  xdg_positioner_v6_interface.version := 1;
  xdg_positioner_v6_interface.method_count := 7;
  xdg_positioner_v6_interface.methods := @xdg_positioner_v6_requests;
  xdg_positioner_v6_interface.event_count := 0;
  xdg_positioner_v6_interface.events := nil;
end;

class procedure TXdgSurfaceV6.RegisterInterface;
begin
  if vxdg_surface_v6_registered then Exit;
  vxdg_surface_v6_registered := True;
  Pointer(vIntf_xdg_surface_v6_Listener.configure) := @xdg_surface_v6_configure_Intf;
  xdg_surface_v6_interface.name := PChar(XDG_SURFACE_V6_INTERFACE_NAME);
  xdg_surface_v6_interface.version := 1;
  xdg_surface_v6_interface.method_count := 5;
  xdg_surface_v6_interface.methods := @xdg_surface_v6_requests;
  xdg_surface_v6_interface.event_count := 1;
  xdg_surface_v6_interface.events := @xdg_surface_v6_events;
end;

class procedure TXdgToplevelV6.RegisterInterface;
begin
  if vxdg_toplevel_v6_registered then Exit;
  vxdg_toplevel_v6_registered := True;
  Pointer(vIntf_xdg_toplevel_v6_Listener.configure) := @xdg_toplevel_v6_configure_Intf;
  Pointer(vIntf_xdg_toplevel_v6_Listener.close) := @xdg_toplevel_v6_close_Intf;
  xdg_toplevel_v6_interface.name := PChar(XDG_TOPLEVEL_V6_INTERFACE_NAME);
  xdg_toplevel_v6_interface.version := 1;
  xdg_toplevel_v6_interface.method_count := 14;
  xdg_toplevel_v6_interface.methods := @xdg_toplevel_v6_requests;
  xdg_toplevel_v6_interface.event_count := 2;
  xdg_toplevel_v6_interface.events := @xdg_toplevel_v6_events;
end;

class procedure TXdgPopupV6.RegisterInterface;
begin
  if vxdg_popup_v6_registered then Exit;
  vxdg_popup_v6_registered := True;
  Pointer(vIntf_xdg_popup_v6_Listener.configure) := @xdg_popup_v6_configure_Intf;
  Pointer(vIntf_xdg_popup_v6_Listener.popup_done) := @xdg_popup_v6_popup_done_Intf;
  xdg_popup_v6_interface.name := PChar(XDG_POPUP_V6_INTERFACE_NAME);
  xdg_popup_v6_interface.version := 1;
  xdg_popup_v6_interface.method_count := 2;
  xdg_popup_v6_interface.methods := @xdg_popup_v6_requests;
  xdg_popup_v6_interface.event_count := 2;
  xdg_popup_v6_interface.events := @xdg_popup_v6_events;
end;


end.
