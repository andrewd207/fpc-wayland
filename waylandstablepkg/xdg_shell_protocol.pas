unit xdg_shell_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_wm_base = Pointer;
  Pxdg_positioner = Pointer;
  Pxdg_surface = Pointer;
  Pxdg_toplevel = Pointer;
  Pxdg_popup = Pointer;
const
  XDG_WM_BASE_ERROR_ROLE = 0; // given wl_surface has another role
  XDG_WM_BASE_ERROR_DEFUNCT_SURFACES = 1; // xdg_wm_base was destroyed before children
  XDG_WM_BASE_ERROR_NOT_THE_TOPMOST_POPUP = 2; // the client tried to map or destroy a non-topmost popup
  XDG_WM_BASE_ERROR_INVALID_POPUP_PARENT = 3; // the client specified an invalid popup parent surface
  XDG_WM_BASE_ERROR_INVALID_SURFACE_STATE = 4; // the client provided an invalid surface state
  XDG_WM_BASE_ERROR_INVALID_POSITIONER = 5; // the client provided an invalid positioner

type
  Pxdg_wm_base_listener = ^Txdg_wm_base_listener;
  Txdg_wm_base_listener = record
    ping : procedure(data: Pointer; AXdgWmBase: Pxdg_wm_base; ASerial: DWord); cdecl;
  end;

const
  XDG_POSITIONER_ERROR_INVALID_INPUT = 0; // invalid input provided
  XDG_POSITIONER_ANCHOR_NONE = 0;
  XDG_POSITIONER_ANCHOR_TOP = 1;
  XDG_POSITIONER_ANCHOR_BOTTOM = 2;
  XDG_POSITIONER_ANCHOR_LEFT = 3;
  XDG_POSITIONER_ANCHOR_RIGHT = 4;
  XDG_POSITIONER_ANCHOR_TOP_LEFT = 5;
  XDG_POSITIONER_ANCHOR_BOTTOM_LEFT = 6;
  XDG_POSITIONER_ANCHOR_TOP_RIGHT = 7;
  XDG_POSITIONER_ANCHOR_BOTTOM_RIGHT = 8;
  XDG_POSITIONER_GRAVITY_NONE = 0;
  XDG_POSITIONER_GRAVITY_TOP = 1;
  XDG_POSITIONER_GRAVITY_BOTTOM = 2;
  XDG_POSITIONER_GRAVITY_LEFT = 3;
  XDG_POSITIONER_GRAVITY_RIGHT = 4;
  XDG_POSITIONER_GRAVITY_TOP_LEFT = 5;
  XDG_POSITIONER_GRAVITY_BOTTOM_LEFT = 6;
  XDG_POSITIONER_GRAVITY_TOP_RIGHT = 7;
  XDG_POSITIONER_GRAVITY_BOTTOM_RIGHT = 8;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_NONE = 0; // don't move the child surface when constrained
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_X = 1; // move along the x axis until unconstrained
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_Y = 2; // move along the y axis until unconstrained
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_X = 4; // invert the anchor and gravity on the x axis
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_Y = 8; // invert the anchor and gravity on the y axis
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_X = 16; // horizontally resize the surface
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_Y = 32; // vertically resize the surface

type
  Pxdg_positioner_listener = ^Txdg_positioner_listener;
  Txdg_positioner_listener = record
  end;

const
  XDG_SURFACE_ERROR_NOT_CONSTRUCTED = 1;
  XDG_SURFACE_ERROR_ALREADY_CONSTRUCTED = 2;
  XDG_SURFACE_ERROR_UNCONFIGURED_BUFFER = 3;

type
  Pxdg_surface_listener = ^Txdg_surface_listener;
  Txdg_surface_listener = record
    configure : procedure(data: Pointer; AXdgSurface: Pxdg_surface; ASerial: DWord); cdecl;
  end;

const
  XDG_TOPLEVEL_ERROR_INVALID_RESIZE_EDGE = 0; // provided value is         not a valid variant of the resize_edge enum
  XDG_TOPLEVEL_RESIZE_EDGE_NONE = 0;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP = 1;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM = 2;
  XDG_TOPLEVEL_RESIZE_EDGE_LEFT = 4;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_LEFT = 5;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_LEFT = 6;
  XDG_TOPLEVEL_RESIZE_EDGE_RIGHT = 8;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_RIGHT = 9;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_RIGHT = 10;
  XDG_TOPLEVEL_STATE_MAXIMIZED = 1; // the surface is maximized
  XDG_TOPLEVEL_STATE_FULLSCREEN = 2; // the surface is fullscreen
  XDG_TOPLEVEL_STATE_RESIZING = 3; // the surface is being resized
  XDG_TOPLEVEL_STATE_ACTIVATED = 4; // the surface is now activated
  XDG_TOPLEVEL_STATE_TILED_LEFT = 5; // the surface?s left edge is tiled
  XDG_TOPLEVEL_STATE_TILED_RIGHT = 6; // the surface?s right edge is tiled
  XDG_TOPLEVEL_STATE_TILED_TOP = 7; // the surface?s top edge is tiled
  XDG_TOPLEVEL_STATE_TILED_BOTTOM = 8; // the surface?s bottom edge is tiled

type
  Pxdg_toplevel_listener = ^Txdg_toplevel_listener;
  Txdg_toplevel_listener = record
    configure : procedure(data: Pointer; AXdgToplevel: Pxdg_toplevel; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array); cdecl;
    close : procedure(data: Pointer; AXdgToplevel: Pxdg_toplevel); cdecl;
    configure_bounds : procedure(data: Pointer; AXdgToplevel: Pxdg_toplevel; AWidth: LongInt; AHeight: LongInt); cdecl;
  end;

const
  XDG_POPUP_ERROR_INVALID_GRAB = 0; // tried to grab after being mapped

type
  Pxdg_popup_listener = ^Txdg_popup_listener;
  Txdg_popup_listener = record
    configure : procedure(data: Pointer; AXdgPopup: Pxdg_popup; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
    popup_done : procedure(data: Pointer; AXdgPopup: Pxdg_popup); cdecl;
    repositioned : procedure(data: Pointer; AXdgPopup: Pxdg_popup; AToken: DWord); cdecl;
  end;



  TXdgWmBase = class;
  TXdgPositioner = class;
  TXdgSurface = class;
  TXdgToplevel = class;
  TXdgPopup = class;


  IXdgWmBaseListener = interface
  ['IXdgWmBaseListener']
    procedure xdg_wm_base_ping(AXdgWmBase: TXdgWmBase; ASerial: DWord);
  end;

  IXdgPositionerListener = interface
  ['IXdgPositionerListener']
  end;

  IXdgSurfaceListener = interface
  ['IXdgSurfaceListener']
    procedure xdg_surface_configure(AXdgSurface: TXdgSurface; ASerial: DWord);
  end;

  IXdgToplevelListener = interface
  ['IXdgToplevelListener']
    procedure xdg_toplevel_configure(AXdgToplevel: TXdgToplevel; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array);
    procedure xdg_toplevel_close(AXdgToplevel: TXdgToplevel);
    procedure xdg_toplevel_configure_bounds(AXdgToplevel: TXdgToplevel; AWidth: LongInt; AHeight: LongInt); {since: 4}
  end;

  IXdgPopupListener = interface
  ['IXdgPopupListener']
    procedure xdg_popup_configure(AXdgPopup: TXdgPopup; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure xdg_popup_popup_done(AXdgPopup: TXdgPopup);
    procedure xdg_popup_repositioned(AXdgPopup: TXdgPopup; AToken: DWord); {since: 3}
  end;




  TXdgWmBase = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_POSITIONER = 1;
    const _GET_XDG_SURFACE = 2;
    const _PONG = 3;
  public
    destructor Destroy; override;
    function CreatePositioner(AProxyClass: TWLProxyObjectClass = nil {TXdgPositioner}): TXdgPositioner;
    function GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgSurface}): TXdgSurface;
    procedure Pong(ASerial: DWord);
    function AddListener(AIntf: IXdgWmBaseListener): LongInt;
  end;

  TXdgPositioner = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_SIZE = 1;
    const _SET_ANCHOR_RECT = 2;
    const _SET_ANCHOR = 3;
    const _SET_GRAVITY = 4;
    const _SET_CONSTRAINT_ADJUSTMENT = 5;
    const _SET_OFFSET = 6;
    const _SET_REACTIVE = 7; { since version: 3}
    const _SET_PARENT_SIZE = 8; { since version: 3}
    const _SET_PARENT_CONFIGURE = 9; { since version: 3}
  public
    destructor Destroy; override;
    procedure SetSize(AWidth: LongInt; AHeight: LongInt);
    procedure SetAnchorRect(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure SetAnchor(AAnchor: DWord);
    procedure SetGravity(AGravity: DWord);
    procedure SetConstraintAdjustment(AConstraintAdjustment: DWord);
    procedure SetOffset(AX: LongInt; AY: LongInt);
    procedure SetReactive; {since version: 3}
    procedure SetParentSize(AParentWidth: LongInt; AParentHeight: LongInt); {since version: 3}
    procedure SetParentConfigure(ASerial: DWord); {since version: 3}
    function AddListener(AIntf: IXdgPositionerListener): LongInt;
  end;

  TXdgSurface = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_TOPLEVEL = 1;
    const _GET_POPUP = 2;
    const _SET_WINDOW_GEOMETRY = 3;
    const _ACK_CONFIGURE = 4;
  public
    destructor Destroy; override;
    function GetToplevel(AProxyClass: TWLProxyObjectClass = nil {TXdgToplevel}): TXdgToplevel;
    function GetPopup(AParent: TXdgSurface; APositioner: TXdgPositioner; AProxyClass: TWLProxyObjectClass = nil {TXdgPopup}): TXdgPopup;
    procedure SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure AckConfigure(ASerial: DWord);
    function AddListener(AIntf: IXdgSurfaceListener): LongInt;
  end;

  TXdgToplevel = class(TWLProxyObject)
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
    procedure SetParent(AParent: TXdgToplevel);
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
    function AddListener(AIntf: IXdgToplevelListener): LongInt;
  end;

  TXdgPopup = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GRAB = 1;
    const _REPOSITION = 2; { since version: 3}
  public
    destructor Destroy; override;
    procedure Grab(ASeat: TWlSeat; ASerial: DWord);
    procedure Reposition(APositioner: TXdgPositioner; AToken: DWord); {since version: 3}
    function AddListener(AIntf: IXdgPopupListener): LongInt;
  end;






var
  xdg_wm_base_interface: Twl_interface;
  xdg_positioner_interface: Twl_interface;
  xdg_surface_interface: Twl_interface;
  xdg_toplevel_interface: Twl_interface;
  xdg_popup_interface: Twl_interface;



implementation

var
  vIntf_xdg_wm_base_Listener: Txdg_wm_base_listener;
  vIntf_xdg_positioner_Listener: Txdg_positioner_listener;
  vIntf_xdg_surface_Listener: Txdg_surface_listener;
  vIntf_xdg_toplevel_Listener: Txdg_toplevel_listener;
  vIntf_xdg_popup_Listener: Txdg_popup_listener;



destructor TXdgWmBase.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgWmBase.CreatePositioner(AProxyClass: TWLProxyObjectClass = nil {TXdgPositioner}): TXdgPositioner;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_POSITIONER, @xdg_positioner_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TXdgPositioner;
  if not AProxyClass.InheritsFrom(TXdgPositioner) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgPositioner]);
  Result := TXdgPositioner(AProxyClass.Create(id));
end;

function TXdgWmBase.GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgSurface}): TXdgSurface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_SURFACE, @xdg_surface_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgSurface;
  if not AProxyClass.InheritsFrom(TXdgSurface) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgSurface]);
  Result := TXdgSurface(AProxyClass.Create(id));
end;

procedure TXdgWmBase.Pong(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _PONG, ASerial);
end;

function TXdgWmBase.AddListener(AIntf: IXdgWmBaseListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_wm_base_Listener, @FUserDataRec);
end;
destructor TXdgPositioner.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgPositioner.SetSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_SIZE, AWidth, AHeight);
end;

procedure TXdgPositioner.SetAnchorRect(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_ANCHOR_RECT, AX, AY, AWidth, AHeight);
end;

procedure TXdgPositioner.SetAnchor(AAnchor: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ANCHOR, AAnchor);
end;

procedure TXdgPositioner.SetGravity(AGravity: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_GRAVITY, AGravity);
end;

procedure TXdgPositioner.SetConstraintAdjustment(AConstraintAdjustment: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONSTRAINT_ADJUSTMENT, AConstraintAdjustment);
end;

procedure TXdgPositioner.SetOffset(AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_OFFSET, AX, AY);
end;

procedure TXdgPositioner.SetReactive;
begin
  wl_proxy_marshal(FProxy, _SET_REACTIVE);
end;

procedure TXdgPositioner.SetParentSize(AParentWidth: LongInt; AParentHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT_SIZE, AParentWidth, AParentHeight);
end;

procedure TXdgPositioner.SetParentConfigure(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT_CONFIGURE, ASerial);
end;

function TXdgPositioner.AddListener(AIntf: IXdgPositionerListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_positioner_Listener, @FUserDataRec);
end;
destructor TXdgSurface.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgSurface.GetToplevel(AProxyClass: TWLProxyObjectClass = nil {TXdgToplevel}): TXdgToplevel;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOPLEVEL, @xdg_toplevel_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TXdgToplevel;
  if not AProxyClass.InheritsFrom(TXdgToplevel) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgToplevel]);
  Result := TXdgToplevel(AProxyClass.Create(id));
end;

function TXdgSurface.GetPopup(AParent: TXdgSurface; APositioner: TXdgPositioner; AProxyClass: TWLProxyObjectClass = nil {TXdgPopup}): TXdgPopup;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_POPUP, @xdg_popup_interface, nil, AParent.Proxy, APositioner.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgPopup;
  if not AProxyClass.InheritsFrom(TXdgPopup) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgPopup]);
  Result := TXdgPopup(AProxyClass.Create(id));
end;

procedure TXdgSurface.SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_WINDOW_GEOMETRY, AX, AY, AWidth, AHeight);
end;

procedure TXdgSurface.AckConfigure(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _ACK_CONFIGURE, ASerial);
end;

function TXdgSurface.AddListener(AIntf: IXdgSurfaceListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_surface_Listener, @FUserDataRec);
end;
destructor TXdgToplevel.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgToplevel.SetParent(AParent: TXdgToplevel);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT, AParent.Proxy);
end;

procedure TXdgToplevel.SetTitle(ATitle: String);
begin
  wl_proxy_marshal(FProxy, _SET_TITLE, PChar(ATitle));
end;

procedure TXdgToplevel.SetAppId(AAppId: String);
begin
  wl_proxy_marshal(FProxy, _SET_APP_ID, PChar(AAppId));
end;

procedure TXdgToplevel.ShowWindowMenu(ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SHOW_WINDOW_MENU, ASeat.Proxy, ASerial, AX, AY);
end;

procedure TXdgToplevel.Move(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _MOVE, ASeat.Proxy, ASerial);
end;

procedure TXdgToplevel.Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
begin
  wl_proxy_marshal(FProxy, _RESIZE, ASeat.Proxy, ASerial, AEdges);
end;

procedure TXdgToplevel.SetMaxSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_MAX_SIZE, AWidth, AHeight);
end;

procedure TXdgToplevel.SetMinSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_MIN_SIZE, AWidth, AHeight);
end;

procedure TXdgToplevel.SetMaximized;
begin
  wl_proxy_marshal(FProxy, _SET_MAXIMIZED);
end;

procedure TXdgToplevel.UnsetMaximized;
begin
  wl_proxy_marshal(FProxy, _UNSET_MAXIMIZED);
end;

procedure TXdgToplevel.SetFullscreen(AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _SET_FULLSCREEN, AOutput.Proxy);
end;

procedure TXdgToplevel.UnsetFullscreen;
begin
  wl_proxy_marshal(FProxy, _UNSET_FULLSCREEN);
end;

procedure TXdgToplevel.SetMinimized;
begin
  wl_proxy_marshal(FProxy, _SET_MINIMIZED);
end;

function TXdgToplevel.AddListener(AIntf: IXdgToplevelListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_Listener, @FUserDataRec);
end;
destructor TXdgPopup.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgPopup.Grab(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _GRAB, ASeat.Proxy, ASerial);
end;

procedure TXdgPopup.Reposition(APositioner: TXdgPositioner; AToken: DWord);
begin
  wl_proxy_marshal(FProxy, _REPOSITION, APositioner.Proxy, AToken);
end;

function TXdgPopup.AddListener(AIntf: IXdgPopupListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_popup_Listener, @FUserDataRec);
end;




procedure xdg_wm_base_ping_Intf(AData: PWLUserData; Axdg_wm_base: Pxdg_wm_base; ASerial: DWord); cdecl;
var
  AIntf: IXdgWmBaseListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgWmBaseListener(AData^.ListenerUserData);
  AIntf.xdg_wm_base_ping(TXdgWmBase(AData^.PascalObject), ASerial);
end;

procedure xdg_surface_configure_Intf(AData: PWLUserData; Axdg_surface: Pxdg_surface; ASerial: DWord); cdecl;
var
  AIntf: IXdgSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgSurfaceListener(AData^.ListenerUserData);
  AIntf.xdg_surface_configure(TXdgSurface(AData^.PascalObject), ASerial);
end;

procedure xdg_toplevel_configure_Intf(AData: PWLUserData; Axdg_toplevel: Pxdg_toplevel; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array); cdecl;
var
  AIntf: IXdgToplevelListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelListener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_configure(TXdgToplevel(AData^.PascalObject), AWidth, AHeight, AStates);
end;

procedure xdg_toplevel_close_Intf(AData: PWLUserData; Axdg_toplevel: Pxdg_toplevel); cdecl;
var
  AIntf: IXdgToplevelListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelListener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_close(TXdgToplevel(AData^.PascalObject));
end;

procedure xdg_toplevel_configure_bounds_Intf(AData: PWLUserData; Axdg_toplevel: Pxdg_toplevel; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IXdgToplevelListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgToplevelListener(AData^.ListenerUserData);
  AIntf.xdg_toplevel_configure_bounds(TXdgToplevel(AData^.PascalObject), AWidth, AHeight);
end;

procedure xdg_popup_configure_Intf(AData: PWLUserData; Axdg_popup: Pxdg_popup; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IXdgPopupListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgPopupListener(AData^.ListenerUserData);
  AIntf.xdg_popup_configure(TXdgPopup(AData^.PascalObject), AX, AY, AWidth, AHeight);
end;

procedure xdg_popup_popup_done_Intf(AData: PWLUserData; Axdg_popup: Pxdg_popup); cdecl;
var
  AIntf: IXdgPopupListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgPopupListener(AData^.ListenerUserData);
  AIntf.xdg_popup_popup_done(TXdgPopup(AData^.PascalObject));
end;

procedure xdg_popup_repositioned_Intf(AData: PWLUserData; Axdg_popup: Pxdg_popup; AToken: DWord); cdecl;
var
  AIntf: IXdgPopupListener;
begin
  if AData = nil then Exit;
  AIntf := IXdgPopupListener(AData^.ListenerUserData);
  AIntf.xdg_popup_repositioned(TXdgPopup(AData^.PascalObject), AToken);
end;



const
  pInterfaces: array[0..29] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@xdg_positioner_interface),
    (@xdg_surface_interface),
    (@wl_surface_interface),
    (@xdg_toplevel_interface),
    (@xdg_popup_interface),
    (@xdg_surface_interface),
    (@xdg_positioner_interface),
    (@xdg_toplevel_interface),
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
    (nil),
    (@xdg_positioner_interface),
    (nil)
  );

  xdg_wm_base_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_positioner'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_wm_base_events: array[0..0] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_positioner_requests: array[0..9] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_anchor_rect'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_anchor'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_gravity'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_constraint_adjustment'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_offset'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_reactive'; signature: '3'; types: @pInterfaces[0]),
    (name: 'set_parent_size'; signature: '3ii'; types: @pInterfaces[0]),
    (name: 'set_parent_configure'; signature: '3u'; types: @pInterfaces[0])
  );
  xdg_surface_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel'; signature: 'n'; types: @pInterfaces[11]),
    (name: 'get_popup'; signature: 'n?oo'; types: @pInterfaces[12]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_surface_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_toplevel_requests: array[0..13] of Twl_message = (
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
  xdg_toplevel_events: array[0..2] of Twl_message = (
    (name: 'configure'; signature: 'iia'; types: @pInterfaces[0]),
    (name: 'close'; signature: ''; types: @pInterfaces[0]),
    (name: 'configure_bounds'; signature: '4ii'; types: @pInterfaces[0])
  );
  xdg_popup_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab'; signature: 'ou'; types: @pInterfaces[26]),
    (name: 'reposition'; signature: '3ou'; types: @pInterfaces[28])
  );
  xdg_popup_events: array[0..2] of Twl_message = (
    (name: 'configure'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0]),
    (name: 'repositioned'; signature: '3u'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_xdg_wm_base_Listener.ping) := @xdg_wm_base_ping_Intf;
  Pointer(vIntf_xdg_surface_Listener.configure) := @xdg_surface_configure_Intf;
  Pointer(vIntf_xdg_toplevel_Listener.configure) := @xdg_toplevel_configure_Intf;
  Pointer(vIntf_xdg_toplevel_Listener.close) := @xdg_toplevel_close_Intf;
  Pointer(vIntf_xdg_toplevel_Listener.configure_bounds) := @xdg_toplevel_configure_bounds_Intf;
  Pointer(vIntf_xdg_popup_Listener.configure) := @xdg_popup_configure_Intf;
  Pointer(vIntf_xdg_popup_Listener.popup_done) := @xdg_popup_popup_done_Intf;
  Pointer(vIntf_xdg_popup_Listener.repositioned) := @xdg_popup_repositioned_Intf;


  xdg_wm_base_interface.name := 'xdg_wm_base';
  xdg_wm_base_interface.version := 4;
  xdg_wm_base_interface.method_count := 4;
  xdg_wm_base_interface.methods := @xdg_wm_base_requests;
  xdg_wm_base_interface.event_count := 1;
  xdg_wm_base_interface.events := @xdg_wm_base_events;

  xdg_positioner_interface.name := 'xdg_positioner';
  xdg_positioner_interface.version := 4;
  xdg_positioner_interface.method_count := 10;
  xdg_positioner_interface.methods := @xdg_positioner_requests;
  xdg_positioner_interface.event_count := 0;
  xdg_positioner_interface.events := nil;

  xdg_surface_interface.name := 'xdg_surface';
  xdg_surface_interface.version := 4;
  xdg_surface_interface.method_count := 5;
  xdg_surface_interface.methods := @xdg_surface_requests;
  xdg_surface_interface.event_count := 1;
  xdg_surface_interface.events := @xdg_surface_events;

  xdg_toplevel_interface.name := 'xdg_toplevel';
  xdg_toplevel_interface.version := 4;
  xdg_toplevel_interface.method_count := 14;
  xdg_toplevel_interface.methods := @xdg_toplevel_requests;
  xdg_toplevel_interface.event_count := 3;
  xdg_toplevel_interface.events := @xdg_toplevel_events;

  xdg_popup_interface.name := 'xdg_popup';
  xdg_popup_interface.version := 4;
  xdg_popup_interface.method_count := 3;
  xdg_popup_interface.methods := @xdg_popup_requests;
  xdg_popup_interface.event_count := 3;
  xdg_popup_interface.events := @xdg_popup_events;

end.
