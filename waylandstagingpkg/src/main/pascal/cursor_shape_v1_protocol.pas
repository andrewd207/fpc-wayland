unit cursor_shape_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, tablet_v2_protocol;


type
  Pwp_cursor_shape_manager_v1 = Pointer;
  Pwp_cursor_shape_device_v1 = Pointer;
  Pwp_cursor_shape_manager_v1_listener = ^Twp_cursor_shape_manager_v1_listener;
  Twp_cursor_shape_manager_v1_listener = record
  end;

const
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_DEFAULT = 1; // default cursor
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CONTEXT_MENU = 2; // a context menu is available for the object under the cursor
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_HELP = 3; // help is available for the object under the cursor
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_POINTER = 4; // pointer that indicates a link or another interactive element
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_PROGRESS = 5; // progress indicator
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_WAIT = 6; // program is busy, user should wait
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CELL = 7; // a cell or set of cells may be selected
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CROSSHAIR = 8; // simple crosshair
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_TEXT = 9; // text may be selected
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_VERTICAL_TEXT = 10; // vertical text may be selected
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ALIAS = 11; // drag-and-drop: alias of/shortcut to something is to be created
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_COPY = 12; // drag-and-drop: something is to be copied
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_MOVE = 13; // drag-and-drop: something is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NO_DROP = 14; // drag-and-drop: the dragged item cannot be dropped at the current cursor location
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NOT_ALLOWED = 15; // drag-and-drop: the requested action will not be carried out
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_GRAB = 16; // drag-and-drop: something can be grabbed
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_GRABBING = 17; // drag-and-drop: something is being grabbed
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_E_RESIZE = 18; // resizing: the east border is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_N_RESIZE = 19; // resizing: the north border is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NE_RESIZE = 20; // resizing: the north-east corner is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NW_RESIZE = 21; // resizing: the north-west corner is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_S_RESIZE = 22; // resizing: the south border is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_SE_RESIZE = 23; // resizing: the south-east corner is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_SW_RESIZE = 24; // resizing: the south-west corner is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_W_RESIZE = 25; // resizing: the west border is to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_EW_RESIZE = 26; // resizing: the east and west borders are to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NS_RESIZE = 27; // resizing: the north and south borders are to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NESW_RESIZE = 28; // resizing: the north-east and south-west corners are to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NWSE_RESIZE = 29; // resizing: the north-west and south-east corners are to be moved
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_COL_RESIZE = 30; // resizing: that the item/column can be resized horizontally
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ROW_RESIZE = 31; // resizing: that the item/row can be resized vertically
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ALL_SCROLL = 32; // something can be scrolled in any direction
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ZOOM_IN = 33; // something can be zoomed in
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ZOOM_OUT = 34; // something can be zoomed out
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_DND_ASK = 35; // drag-and-drop: the user will select which action will be carried out (non-css value)
  WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ALL_RESIZE = 36; // resizing: something can be moved or resized in any direction (non-css value)
  WP_CURSOR_SHAPE_DEVICE_V1_ERROR_INVALID_SHAPE = 1; // the specified shape value is invalid

type
  Pwp_cursor_shape_device_v1_listener = ^Twp_cursor_shape_device_v1_listener;
  Twp_cursor_shape_device_v1_listener = record
  end;



  TWpCursorShapeManagerV1 = class;
  TWpCursorShapeDeviceV1 = class;


  IWpCursorShapeManagerV1Listener = interface
  ['IWpCursorShapeManagerV1Listener']
  end;

  IWpCursorShapeDeviceV1Listener = interface
  ['IWpCursorShapeDeviceV1Listener']
  end;




  TWpCursorShapeManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpCursorShapeManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_POINTER = 1;
    const _GET_TABLET_TOOL_V2 = 2;
  public
    destructor Destroy; override;
    function GetPointer(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpCursorShapeDeviceV1}): TWpCursorShapeDeviceV1;
    function GetTabletToolV2(ATabletTool: TWpTabletToolV2; AProxyClass: TWLProxyObjectClass = nil {TWpCursorShapeDeviceV1}): TWpCursorShapeDeviceV1;
    function AddListener(AIntf: IWpCursorShapeManagerV1Listener): LongInt;
  end;

  TWpCursorShapeDeviceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpCursorShapeDeviceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_SHAPE = 1;
  public
    destructor Destroy; override;
    procedure SetShape(ASerial: DWord; AShape: DWord);
    function AddListener(AIntf: IWpCursorShapeDeviceV1Listener): LongInt;
  end;






var
  wp_cursor_shape_manager_v1_interface: Twl_interface;
  WP_CURSOR_SHAPE_MANAGER_V1_INTERFACE_NAME: String = 'wp_cursor_shape_manager_v1';
  wp_cursor_shape_device_v1_interface: Twl_interface;
  WP_CURSOR_SHAPE_DEVICE_V1_INTERFACE_NAME: String = 'wp_cursor_shape_device_v1';



implementation

var
  vwp_cursor_shape_manager_v1_registered: Boolean = False;
  vIntf_wp_cursor_shape_manager_v1_Listener: Twp_cursor_shape_manager_v1_listener;
  vwp_cursor_shape_device_v1_registered: Boolean = False;
  vIntf_wp_cursor_shape_device_v1_Listener: Twp_cursor_shape_device_v1_listener;



constructor TWpCursorShapeManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpCursorShapeManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpCursorShapeManagerV1;
begin
  RegisterInterface;
  Result := TWpCursorShapeManagerV1.Create(ARegistry.Bind(AName, @wp_cursor_shape_manager_v1_interface, AVersion));
end;

destructor TWpCursorShapeManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpCursorShapeManagerV1.GetPointer(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpCursorShapeDeviceV1}): TWpCursorShapeDeviceV1;
var
  cursor_shape_device: Pwl_proxy;
begin
  TWpCursorShapeDeviceV1.RegisterInterface;
  cursor_shape_device := wl_proxy_marshal_constructor(FProxy,
      _GET_POINTER, @wp_cursor_shape_device_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpCursorShapeDeviceV1;
  Result := TWpCursorShapeDeviceV1(AProxyClass.Create(cursor_shape_device));
  if not AProxyClass.InheritsFrom(TWpCursorShapeDeviceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpCursorShapeDeviceV1]);
end;

function TWpCursorShapeManagerV1.GetTabletToolV2(ATabletTool: TWpTabletToolV2; AProxyClass: TWLProxyObjectClass = nil {TWpCursorShapeDeviceV1}): TWpCursorShapeDeviceV1;
var
  cursor_shape_device: Pwl_proxy;
begin
  TWpCursorShapeDeviceV1.RegisterInterface;
  cursor_shape_device := wl_proxy_marshal_constructor(FProxy,
      _GET_TABLET_TOOL_V2, @wp_cursor_shape_device_v1_interface, nil, ATabletTool.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpCursorShapeDeviceV1;
  Result := TWpCursorShapeDeviceV1(AProxyClass.Create(cursor_shape_device));
  if not AProxyClass.InheritsFrom(TWpCursorShapeDeviceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpCursorShapeDeviceV1]);
end;

function TWpCursorShapeManagerV1.AddListener(AIntf: IWpCursorShapeManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_cursor_shape_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpCursorShapeDeviceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpCursorShapeDeviceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpCursorShapeDeviceV1;
begin
  RegisterInterface;
  Result := TWpCursorShapeDeviceV1.Create(ARegistry.Bind(AName, @wp_cursor_shape_device_v1_interface, AVersion));
end;

destructor TWpCursorShapeDeviceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpCursorShapeDeviceV1.SetShape(ASerial: DWord; AShape: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_SHAPE, ASerial, AShape);
end;

function TWpCursorShapeDeviceV1.AddListener(AIntf: IWpCursorShapeDeviceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_cursor_shape_device_v1_Listener, @FUserDataRec);
end;






const
  pInterfaces: array[0..11] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_cursor_shape_device_v1_interface),
    (@wl_pointer_interface),
    (@wp_cursor_shape_device_v1_interface),
    (@wp_tablet_tool_v2_interface)
  );

  wp_cursor_shape_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_pointer'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_tablet_tool_v2'; signature: 'no'; types: @pInterfaces[10])
  );
  wp_cursor_shape_device_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_shape'; signature: 'uu'; types: @pInterfaces[0])
  );

class procedure TWpCursorShapeManagerV1.RegisterInterface;
begin
  if vwp_cursor_shape_manager_v1_registered then Exit;
  vwp_cursor_shape_manager_v1_registered := True;
  wp_cursor_shape_manager_v1_interface.name := PChar(WP_CURSOR_SHAPE_MANAGER_V1_INTERFACE_NAME);
  wp_cursor_shape_manager_v1_interface.version := 2;
  wp_cursor_shape_manager_v1_interface.method_count := 3;
  wp_cursor_shape_manager_v1_interface.methods := @wp_cursor_shape_manager_v1_requests;
  wp_cursor_shape_manager_v1_interface.event_count := 0;
  wp_cursor_shape_manager_v1_interface.events := nil;
end;

class procedure TWpCursorShapeDeviceV1.RegisterInterface;
begin
  if vwp_cursor_shape_device_v1_registered then Exit;
  vwp_cursor_shape_device_v1_registered := True;
  wp_cursor_shape_device_v1_interface.name := PChar(WP_CURSOR_SHAPE_DEVICE_V1_INTERFACE_NAME);
  wp_cursor_shape_device_v1_interface.version := 2;
  wp_cursor_shape_device_v1_interface.method_count := 2;
  wp_cursor_shape_device_v1_interface.methods := @wp_cursor_shape_device_v1_requests;
  wp_cursor_shape_device_v1_interface.event_count := 0;
  wp_cursor_shape_device_v1_interface.events := nil;
end;


end.
