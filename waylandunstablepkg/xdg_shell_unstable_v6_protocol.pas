unit xdg_shell_unstable_v6_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzxdg_shell_v6 = Pointer;
  Pzxdg_positioner_v6 = Pointer;
  Pzxdg_surface_v6 = Pointer;
  Pzxdg_toplevel_v6 = Pointer;
  Pzxdg_popup_v6 = Pointer;
const
  ZXDG_SHELL_V6_ERROR_ROLE = 0; // given wl_surface has another role
  ZXDG_SHELL_V6_ERROR_DEFUNCT_SURFACES = 1; // xdg_shell was destroyed before children
  ZXDG_SHELL_V6_ERROR_NOT_THE_TOPMOST_POPUP = 2; // the client tried to map or destroy a non-topmost popup
  ZXDG_SHELL_V6_ERROR_INVALID_POPUP_PARENT = 3; // the client specified an invalid popup parent surface
  ZXDG_SHELL_V6_ERROR_INVALID_SURFACE_STATE = 4; // the client provided an invalid surface state
  ZXDG_SHELL_V6_ERROR_INVALID_POSITIONER = 5; // the client provided an invalid positioner

type
  Pzxdg_shell_v6_listener = ^Tzxdg_shell_v6_listener;
  Tzxdg_shell_v6_listener = record
    ping : procedure(data: Pointer; AZxdgShellV6: Pzxdg_shell_v6; ASerial: DWord); cdecl;
  end;

const
  ZXDG_POSITIONER_V6_ERROR_INVALID_INPUT = 0; // invalid input provided
  ZXDG_POSITIONER_V6_ANCHOR_NONE = 0; // the center of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_TOP = 1; // the top edge of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_BOTTOM = 2; // the bottom edge of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_LEFT = 4; // the left edge of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_RIGHT = 8; // the right edge of the anchor rectangle
  ZXDG_POSITIONER_V6_GRAVITY_NONE = 0; // center over the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_TOP = 1; // position above the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_BOTTOM = 2; // position below the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_LEFT = 4; // position to the left of the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_RIGHT = 8; // position to the right of the anchor edge
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_NONE = 0; // don't move the child surface when constrained
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_SLIDE_X = 1; // move along the x axis until unconstrained
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_SLIDE_Y = 2; // move along the y axis until unconstrained
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_FLIP_X = 4; // invert the anchor and gravity on the x axis
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_FLIP_Y = 8; // invert the anchor and gravity on the y axis
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_RESIZE_X = 16; // horizontally resize the surface
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_RESIZE_Y = 32; // vertically resize the surface

type
  Pzxdg_positioner_v6_listener = ^Tzxdg_positioner_v6_listener;
  Tzxdg_positioner_v6_listener = record
  end;

const
  ZXDG_SURFACE_V6_ERROR_NOT_CONSTRUCTED = 1;
  ZXDG_SURFACE_V6_ERROR_ALREADY_CONSTRUCTED = 2;
  ZXDG_SURFACE_V6_ERROR_UNCONFIGURED_BUFFER = 3;

type
  Pzxdg_surface_v6_listener = ^Tzxdg_surface_v6_listener;
  Tzxdg_surface_v6_listener = record
    configure : procedure(data: Pointer; AZxdgSurfaceV6: Pzxdg_surface_v6; ASerial: DWord); cdecl;
  end;

const
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_NONE = 0;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_TOP = 1;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM = 2;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_LEFT = 4;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_TOP_LEFT = 5;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM_LEFT = 6;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_RIGHT = 8;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_TOP_RIGHT = 9;
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM_RIGHT = 10;
  ZXDG_TOPLEVEL_V6_STATE_MAXIMIZED = 1; // the surface is maximized
  ZXDG_TOPLEVEL_V6_STATE_FULLSCREEN = 2; // the surface is fullscreen
  ZXDG_TOPLEVEL_V6_STATE_RESIZING = 3; // the surface is being resized
  ZXDG_TOPLEVEL_V6_STATE_ACTIVATED = 4; // the surface is now activated

type
  Pzxdg_toplevel_v6_listener = ^Tzxdg_toplevel_v6_listener;
  Tzxdg_toplevel_v6_listener = record
    configure : procedure(data: Pointer; AZxdgToplevelV6: Pzxdg_toplevel_v6; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array); cdecl;
    close : procedure(data: Pointer; AZxdgToplevelV6: Pzxdg_toplevel_v6); cdecl;
  end;

const
  ZXDG_POPUP_V6_ERROR_INVALID_GRAB = 0; // tried to grab after being mapped

type
  Pzxdg_popup_v6_listener = ^Tzxdg_popup_v6_listener;
  Tzxdg_popup_v6_listener = record
    configure : procedure(data: Pointer; AZxdgPopupV6: Pzxdg_popup_v6; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
    popup_done : procedure(data: Pointer; AZxdgPopupV6: Pzxdg_popup_v6); cdecl;
  end;



  TZxdgShellV6 = class;
  TZxdgPositionerV6 = class;
  TZxdgSurfaceV6 = class;
  TZxdgToplevelV6 = class;
  TZxdgPopupV6 = class;


  IZxdgShellV6Listener = interface
  ['IZxdgShellV6Listener']
    procedure zxdg_shell_v6_ping(AZxdgShellV6: TZxdgShellV6; ASerial: DWord);
  end;

  IZxdgPositionerV6Listener = interface
  ['IZxdgPositionerV6Listener']
  end;

  IZxdgSurfaceV6Listener = interface
  ['IZxdgSurfaceV6Listener']
    procedure zxdg_surface_v6_configure(AZxdgSurfaceV6: TZxdgSurfaceV6; ASerial: DWord);
  end;

  IZxdgToplevelV6Listener = interface
  ['IZxdgToplevelV6Listener']
    procedure zxdg_toplevel_v6_configure(AZxdgToplevelV6: TZxdgToplevelV6; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array);
    procedure zxdg_toplevel_v6_close(AZxdgToplevelV6: TZxdgToplevelV6);
  end;

  IZxdgPopupV6Listener = interface
  ['IZxdgPopupV6Listener']
    procedure zxdg_popup_v6_configure(AZxdgPopupV6: TZxdgPopupV6; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure zxdg_popup_v6_popup_done(AZxdgPopupV6: TZxdgPopupV6);
  end;




  TZxdgShellV6 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_POSITIONER = 1;
    const _GET_XDG_SURFACE = 2;
    const _PONG = 3;
  public
    destructor Destroy; override;
    function CreatePositioner(AProxyClass: TWLProxyObjectClass = nil {TZxdgPositionerV6}): TZxdgPositionerV6;
    function GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZxdgSurfaceV6}): TZxdgSurfaceV6;
    procedure Pong(ASerial: DWord);
    function AddListener(AIntf: IZxdgShellV6Listener): LongInt;
  end;

  TZxdgPositionerV6 = class(TWLProxyObject)
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
    function AddListener(AIntf: IZxdgPositionerV6Listener): LongInt;
  end;

  TZxdgSurfaceV6 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_TOPLEVEL = 1;
    const _GET_POPUP = 2;
    const _SET_WINDOW_GEOMETRY = 3;
    const _ACK_CONFIGURE = 4;
  public
    destructor Destroy; override;
    function GetToplevel(AProxyClass: TWLProxyObjectClass = nil {TZxdgToplevelV6}): TZxdgToplevelV6;
    function GetPopup(AParent: TZxdgSurfaceV6; APositioner: TZxdgPositionerV6; AProxyClass: TWLProxyObjectClass = nil {TZxdgPopupV6}): TZxdgPopupV6;
    procedure SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure AckConfigure(ASerial: DWord);
    function AddListener(AIntf: IZxdgSurfaceV6Listener): LongInt;
  end;

  TZxdgToplevelV6 = class(TWLProxyObject)
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
    procedure SetParent(AParent: TZxdgToplevelV6);
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
    function AddListener(AIntf: IZxdgToplevelV6Listener): LongInt;
  end;

  TZxdgPopupV6 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GRAB = 1;
  public
    destructor Destroy; override;
    procedure Grab(ASeat: TWlSeat; ASerial: DWord);
    function AddListener(AIntf: IZxdgPopupV6Listener): LongInt;
  end;






var
  zxdg_shell_v6_interface: Twl_interface;
  zxdg_positioner_v6_interface: Twl_interface;
  zxdg_surface_v6_interface: Twl_interface;
  zxdg_toplevel_v6_interface: Twl_interface;
  zxdg_popup_v6_interface: Twl_interface;



implementation

var
  vIntf_zxdg_shell_v6_Listener: Tzxdg_shell_v6_listener;
  vIntf_zxdg_positioner_v6_Listener: Tzxdg_positioner_v6_listener;
  vIntf_zxdg_surface_v6_Listener: Tzxdg_surface_v6_listener;
  vIntf_zxdg_toplevel_v6_Listener: Tzxdg_toplevel_v6_listener;
  vIntf_zxdg_popup_v6_Listener: Tzxdg_popup_v6_listener;



destructor TZxdgShellV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgShellV6.CreatePositioner(AProxyClass: TWLProxyObjectClass = nil {TZxdgPositionerV6}): TZxdgPositionerV6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_POSITIONER, @zxdg_positioner_v6_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TZxdgPositionerV6;
  if not AProxyClass.InheritsFrom(TZxdgPositionerV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgPositionerV6]);
  Result := TZxdgPositionerV6(AProxyClass.Create(id));
end;

function TZxdgShellV6.GetXdgSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZxdgSurfaceV6}): TZxdgSurfaceV6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_SURFACE, @zxdg_surface_v6_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZxdgSurfaceV6;
  if not AProxyClass.InheritsFrom(TZxdgSurfaceV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgSurfaceV6]);
  Result := TZxdgSurfaceV6(AProxyClass.Create(id));
end;

procedure TZxdgShellV6.Pong(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _PONG, ASerial);
end;

function TZxdgShellV6.AddListener(AIntf: IZxdgShellV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_shell_v6_Listener, @FUserDataRec);
end;
destructor TZxdgPositionerV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZxdgPositionerV6.SetSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_SIZE, AWidth, AHeight);
end;

procedure TZxdgPositionerV6.SetAnchorRect(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_ANCHOR_RECT, AX, AY, AWidth, AHeight);
end;

procedure TZxdgPositionerV6.SetAnchor(AAnchor: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ANCHOR, AAnchor);
end;

procedure TZxdgPositionerV6.SetGravity(AGravity: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_GRAVITY, AGravity);
end;

procedure TZxdgPositionerV6.SetConstraintAdjustment(AConstraintAdjustment: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONSTRAINT_ADJUSTMENT, AConstraintAdjustment);
end;

procedure TZxdgPositionerV6.SetOffset(AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_OFFSET, AX, AY);
end;

function TZxdgPositionerV6.AddListener(AIntf: IZxdgPositionerV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_positioner_v6_Listener, @FUserDataRec);
end;
destructor TZxdgSurfaceV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgSurfaceV6.GetToplevel(AProxyClass: TWLProxyObjectClass = nil {TZxdgToplevelV6}): TZxdgToplevelV6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOPLEVEL, @zxdg_toplevel_v6_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TZxdgToplevelV6;
  if not AProxyClass.InheritsFrom(TZxdgToplevelV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgToplevelV6]);
  Result := TZxdgToplevelV6(AProxyClass.Create(id));
end;

function TZxdgSurfaceV6.GetPopup(AParent: TZxdgSurfaceV6; APositioner: TZxdgPositionerV6; AProxyClass: TWLProxyObjectClass = nil {TZxdgPopupV6}): TZxdgPopupV6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_POPUP, @zxdg_popup_v6_interface, nil, AParent.Proxy, APositioner.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZxdgPopupV6;
  if not AProxyClass.InheritsFrom(TZxdgPopupV6) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgPopupV6]);
  Result := TZxdgPopupV6(AProxyClass.Create(id));
end;

procedure TZxdgSurfaceV6.SetWindowGeometry(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_WINDOW_GEOMETRY, AX, AY, AWidth, AHeight);
end;

procedure TZxdgSurfaceV6.AckConfigure(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _ACK_CONFIGURE, ASerial);
end;

function TZxdgSurfaceV6.AddListener(AIntf: IZxdgSurfaceV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_surface_v6_Listener, @FUserDataRec);
end;
destructor TZxdgToplevelV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZxdgToplevelV6.SetParent(AParent: TZxdgToplevelV6);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT, AParent.Proxy);
end;

procedure TZxdgToplevelV6.SetTitle(ATitle: String);
begin
  wl_proxy_marshal(FProxy, _SET_TITLE, PChar(ATitle));
end;

procedure TZxdgToplevelV6.SetAppId(AAppId: String);
begin
  wl_proxy_marshal(FProxy, _SET_APP_ID, PChar(AAppId));
end;

procedure TZxdgToplevelV6.ShowWindowMenu(ASeat: TWlSeat; ASerial: DWord; AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SHOW_WINDOW_MENU, ASeat.Proxy, ASerial, AX, AY);
end;

procedure TZxdgToplevelV6.Move(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _MOVE, ASeat.Proxy, ASerial);
end;

procedure TZxdgToplevelV6.Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
begin
  wl_proxy_marshal(FProxy, _RESIZE, ASeat.Proxy, ASerial, AEdges);
end;

procedure TZxdgToplevelV6.SetMaxSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_MAX_SIZE, AWidth, AHeight);
end;

procedure TZxdgToplevelV6.SetMinSize(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_MIN_SIZE, AWidth, AHeight);
end;

procedure TZxdgToplevelV6.SetMaximized;
begin
  wl_proxy_marshal(FProxy, _SET_MAXIMIZED);
end;

procedure TZxdgToplevelV6.UnsetMaximized;
begin
  wl_proxy_marshal(FProxy, _UNSET_MAXIMIZED);
end;

procedure TZxdgToplevelV6.SetFullscreen(AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _SET_FULLSCREEN, AOutput.Proxy);
end;

procedure TZxdgToplevelV6.UnsetFullscreen;
begin
  wl_proxy_marshal(FProxy, _UNSET_FULLSCREEN);
end;

procedure TZxdgToplevelV6.SetMinimized;
begin
  wl_proxy_marshal(FProxy, _SET_MINIMIZED);
end;

function TZxdgToplevelV6.AddListener(AIntf: IZxdgToplevelV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_toplevel_v6_Listener, @FUserDataRec);
end;
destructor TZxdgPopupV6.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZxdgPopupV6.Grab(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _GRAB, ASeat.Proxy, ASerial);
end;

function TZxdgPopupV6.AddListener(AIntf: IZxdgPopupV6Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_popup_v6_Listener, @FUserDataRec);
end;




procedure zxdg_shell_v6_ping_Intf(AData: PWLUserData; Azxdg_shell_v6: Pzxdg_shell_v6; ASerial: DWord); cdecl;
var
  AIntf: IZxdgShellV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgShellV6Listener(AData^.ListenerUserData);
  AIntf.zxdg_shell_v6_ping(TZxdgShellV6(AData^.PascalObject), ASerial);
end;

procedure zxdg_surface_v6_configure_Intf(AData: PWLUserData; Azxdg_surface_v6: Pzxdg_surface_v6; ASerial: DWord); cdecl;
var
  AIntf: IZxdgSurfaceV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgSurfaceV6Listener(AData^.ListenerUserData);
  AIntf.zxdg_surface_v6_configure(TZxdgSurfaceV6(AData^.PascalObject), ASerial);
end;

procedure zxdg_toplevel_v6_configure_Intf(AData: PWLUserData; Azxdg_toplevel_v6: Pzxdg_toplevel_v6; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array); cdecl;
var
  AIntf: IZxdgToplevelV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgToplevelV6Listener(AData^.ListenerUserData);
  AIntf.zxdg_toplevel_v6_configure(TZxdgToplevelV6(AData^.PascalObject), AWidth, AHeight, AStates);
end;

procedure zxdg_toplevel_v6_close_Intf(AData: PWLUserData; Azxdg_toplevel_v6: Pzxdg_toplevel_v6); cdecl;
var
  AIntf: IZxdgToplevelV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgToplevelV6Listener(AData^.ListenerUserData);
  AIntf.zxdg_toplevel_v6_close(TZxdgToplevelV6(AData^.PascalObject));
end;

procedure zxdg_popup_v6_configure_Intf(AData: PWLUserData; Azxdg_popup_v6: Pzxdg_popup_v6; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IZxdgPopupV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgPopupV6Listener(AData^.ListenerUserData);
  AIntf.zxdg_popup_v6_configure(TZxdgPopupV6(AData^.PascalObject), AX, AY, AWidth, AHeight);
end;

procedure zxdg_popup_v6_popup_done_Intf(AData: PWLUserData; Azxdg_popup_v6: Pzxdg_popup_v6); cdecl;
var
  AIntf: IZxdgPopupV6Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgPopupV6Listener(AData^.ListenerUserData);
  AIntf.zxdg_popup_v6_popup_done(TZxdgPopupV6(AData^.PascalObject));
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
    (@zxdg_positioner_v6_interface),
    (@zxdg_surface_v6_interface),
    (@wl_surface_interface),
    (@zxdg_toplevel_v6_interface),
    (@zxdg_popup_v6_interface),
    (@zxdg_surface_v6_interface),
    (@zxdg_positioner_v6_interface),
    (@zxdg_toplevel_v6_interface),
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

  zxdg_shell_v6_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_positioner'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_shell_v6_events: array[0..0] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_positioner_v6_requests: array[0..6] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_anchor_rect'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_anchor'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_gravity'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_constraint_adjustment'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_offset'; signature: 'ii'; types: @pInterfaces[0])
  );
  zxdg_surface_v6_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel'; signature: 'n'; types: @pInterfaces[11]),
    (name: 'get_popup'; signature: 'noo'; types: @pInterfaces[12]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_surface_v6_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_toplevel_v6_requests: array[0..13] of Twl_message = (
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
  zxdg_toplevel_v6_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iia'; types: @pInterfaces[0]),
    (name: 'close'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_popup_v6_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab'; signature: 'ou'; types: @pInterfaces[26])
  );
  zxdg_popup_v6_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_shell_v6_Listener.ping) := @zxdg_shell_v6_ping_Intf;
  Pointer(vIntf_zxdg_surface_v6_Listener.configure) := @zxdg_surface_v6_configure_Intf;
  Pointer(vIntf_zxdg_toplevel_v6_Listener.configure) := @zxdg_toplevel_v6_configure_Intf;
  Pointer(vIntf_zxdg_toplevel_v6_Listener.close) := @zxdg_toplevel_v6_close_Intf;
  Pointer(vIntf_zxdg_popup_v6_Listener.configure) := @zxdg_popup_v6_configure_Intf;
  Pointer(vIntf_zxdg_popup_v6_Listener.popup_done) := @zxdg_popup_v6_popup_done_Intf;


  zxdg_shell_v6_interface.name := 'zxdg_shell_v6';
  zxdg_shell_v6_interface.version := 1;
  zxdg_shell_v6_interface.method_count := 4;
  zxdg_shell_v6_interface.methods := @zxdg_shell_v6_requests;
  zxdg_shell_v6_interface.event_count := 1;
  zxdg_shell_v6_interface.events := @zxdg_shell_v6_events;

  zxdg_positioner_v6_interface.name := 'zxdg_positioner_v6';
  zxdg_positioner_v6_interface.version := 1;
  zxdg_positioner_v6_interface.method_count := 7;
  zxdg_positioner_v6_interface.methods := @zxdg_positioner_v6_requests;
  zxdg_positioner_v6_interface.event_count := 0;
  zxdg_positioner_v6_interface.events := nil;

  zxdg_surface_v6_interface.name := 'zxdg_surface_v6';
  zxdg_surface_v6_interface.version := 1;
  zxdg_surface_v6_interface.method_count := 5;
  zxdg_surface_v6_interface.methods := @zxdg_surface_v6_requests;
  zxdg_surface_v6_interface.event_count := 1;
  zxdg_surface_v6_interface.events := @zxdg_surface_v6_events;

  zxdg_toplevel_v6_interface.name := 'zxdg_toplevel_v6';
  zxdg_toplevel_v6_interface.version := 1;
  zxdg_toplevel_v6_interface.method_count := 14;
  zxdg_toplevel_v6_interface.methods := @zxdg_toplevel_v6_requests;
  zxdg_toplevel_v6_interface.event_count := 2;
  zxdg_toplevel_v6_interface.events := @zxdg_toplevel_v6_events;

  zxdg_popup_v6_interface.name := 'zxdg_popup_v6';
  zxdg_popup_v6_interface.version := 1;
  zxdg_popup_v6_interface.method_count := 2;
  zxdg_popup_v6_interface.methods := @zxdg_popup_v6_requests;
  zxdg_popup_v6_interface.event_count := 2;
  zxdg_popup_v6_interface.events := @zxdg_popup_v6_events;

end.
