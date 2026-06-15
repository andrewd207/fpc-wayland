unit input_method_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_input_method_context_v1 = Pointer;
  Pwp_input_method_v1 = Pointer;
  Pwp_input_panel_v1 = Pointer;
  Pwp_input_panel_surface_v1 = Pointer;
  Pwp_input_method_context_v1_listener = ^Twp_input_method_context_v1_listener;
  Twp_input_method_context_v1_listener = record
    surrounding_text : procedure(data: Pointer; AWpInputMethodContextV1: Pwp_input_method_context_v1; AText: Pchar; ACursor: DWord; AAnchor: DWord); cdecl;
    reset : procedure(data: Pointer; AWpInputMethodContextV1: Pwp_input_method_context_v1); cdecl;
    content_type : procedure(data: Pointer; AWpInputMethodContextV1: Pwp_input_method_context_v1; AHint: DWord; APurpose: DWord); cdecl;
    invoke_action : procedure(data: Pointer; AWpInputMethodContextV1: Pwp_input_method_context_v1; AButton: DWord; AIndex: DWord); cdecl;
    commit_state : procedure(data: Pointer; AWpInputMethodContextV1: Pwp_input_method_context_v1; ASerial: DWord); cdecl;
    preferred_language : procedure(data: Pointer; AWpInputMethodContextV1: Pwp_input_method_context_v1; ALanguage: Pchar); cdecl;
  end;

  Pwp_input_method_v1_listener = ^Twp_input_method_v1_listener;
  Twp_input_method_v1_listener = record
    activate : procedure(data: Pointer; AWpInputMethodV1: Pwp_input_method_v1; AId: Pwp_input_method_context_v1); cdecl;
    deactivate : procedure(data: Pointer; AWpInputMethodV1: Pwp_input_method_v1; AContext: Pwp_input_method_context_v1); cdecl;
  end;

  Pwp_input_panel_v1_listener = ^Twp_input_panel_v1_listener;
  Twp_input_panel_v1_listener = record
  end;

const
  WP_INPUT_PANEL_SURFACE_V1_POSITION_CENTER_BOTTOM = 0;

type
  Pwp_input_panel_surface_v1_listener = ^Twp_input_panel_surface_v1_listener;
  Twp_input_panel_surface_v1_listener = record
  end;



  TWpInputMethodContextV1 = class;
  TWpInputMethodV1 = class;
  TWpInputPanelV1 = class;
  TWpInputPanelSurfaceV1 = class;


  IWpInputMethodContextV1Listener = interface
  ['IWpInputMethodContextV1Listener']
    procedure wp_input_method_context_v1_surrounding_text(AWpInputMethodContextV1: TWpInputMethodContextV1; AText: String; ACursor: DWord; AAnchor: DWord);
    procedure wp_input_method_context_v1_reset(AWpInputMethodContextV1: TWpInputMethodContextV1);
    procedure wp_input_method_context_v1_content_type(AWpInputMethodContextV1: TWpInputMethodContextV1; AHint: DWord; APurpose: DWord);
    procedure wp_input_method_context_v1_invoke_action(AWpInputMethodContextV1: TWpInputMethodContextV1; AButton: DWord; AIndex: DWord);
    procedure wp_input_method_context_v1_commit_state(AWpInputMethodContextV1: TWpInputMethodContextV1; ASerial: DWord);
    procedure wp_input_method_context_v1_preferred_language(AWpInputMethodContextV1: TWpInputMethodContextV1; ALanguage: String);
  end;

  IWpInputMethodV1Listener = interface
  ['IWpInputMethodV1Listener']
    procedure wp_input_method_v1_activate(AWpInputMethodV1: TWpInputMethodV1; AId: TWpInputMethodContextV1);
    procedure wp_input_method_v1_deactivate(AWpInputMethodV1: TWpInputMethodV1; AContext: TWpInputMethodContextV1);
  end;

  IWpInputPanelV1Listener = interface
  ['IWpInputPanelV1Listener']
  end;

  IWpInputPanelSurfaceV1Listener = interface
  ['IWpInputPanelSurfaceV1Listener']
  end;




  TWpInputMethodContextV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputMethodContextV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _COMMIT_STRING = 1;
    const _PREEDIT_STRING = 2;
    const _PREEDIT_STYLING = 3;
    const _PREEDIT_CURSOR = 4;
    const _DELETE_SURROUNDING_TEXT = 5;
    const _CURSOR_POSITION = 6;
    const _MODIFIERS_MAP = 7;
    const _KEYSYM = 8;
    const _GRAB_KEYBOARD = 9;
    const _KEY = 10;
    const _MODIFIERS = 11;
    const _LANGUAGE = 12;
    const _TEXT_DIRECTION = 13;
  public
    destructor Destroy; override;
    procedure CommitString(ASerial: DWord; AText: String);
    procedure PreeditString(ASerial: DWord; AText: String; ACommit: String);
    procedure PreeditStyling(AIndex: DWord; ALength: DWord; AStyle: DWord);
    procedure PreeditCursor(AIndex: LongInt);
    procedure DeleteSurroundingText(AIndex: LongInt; ALength: DWord);
    procedure CursorPosition(AIndex: LongInt; AAnchor: LongInt);
    procedure ModifiersMap(AMap: Pwl_array);
    procedure Keysym(ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord);
    function GrabKeyboard(AProxyClass: TWLProxyObjectClass = nil {TWlKeyboard}): TWlKeyboard;
    procedure Key(ASerial: DWord; ATime: DWord; AKey: DWord; AState: DWord);
    procedure Modifiers(ASerial: DWord; AModsDepressed: DWord; AModsLatched: DWord; AModsLocked: DWord; AGroup: DWord);
    procedure Language(ASerial: DWord; ALanguage: String);
    procedure TextDirection(ASerial: DWord; ADirection: DWord);
    function AddListener(AIntf: IWpInputMethodContextV1Listener): LongInt;
  end;

  TWpInputMethodV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputMethodV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
    function AddListener(AIntf: IWpInputMethodV1Listener): LongInt;
  end;

  TWpInputPanelV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputPanelV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _GET_INPUT_PANEL_SURFACE = 0;
  public
    function GetInputPanelSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpInputPanelSurfaceV1}): TWpInputPanelSurfaceV1;
    function AddListener(AIntf: IWpInputPanelV1Listener): LongInt;
  end;

  TWpInputPanelSurfaceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputPanelSurfaceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_TOPLEVEL = 0;
    const _SET_OVERLAY_PANEL = 1;
  public
    procedure SetToplevel(AOutput: TWlOutput; APosition: DWord);
    procedure SetOverlayPanel;
    function AddListener(AIntf: IWpInputPanelSurfaceV1Listener): LongInt;
  end;






var
  wp_input_method_context_v1_interface: Twl_interface;
  WP_INPUT_METHOD_CONTEXT_V1_INTERFACE_NAME: String = 'zwp_input_method_context_v1';
  wp_input_method_v1_interface: Twl_interface;
  WP_INPUT_METHOD_V1_INTERFACE_NAME: String = 'zwp_input_method_v1';
  wp_input_panel_v1_interface: Twl_interface;
  WP_INPUT_PANEL_V1_INTERFACE_NAME: String = 'zwp_input_panel_v1';
  wp_input_panel_surface_v1_interface: Twl_interface;
  WP_INPUT_PANEL_SURFACE_V1_INTERFACE_NAME: String = 'zwp_input_panel_surface_v1';



implementation

var
  vwp_input_method_context_v1_registered: Boolean = False;
  vIntf_wp_input_method_context_v1_Listener: Twp_input_method_context_v1_listener;
  vwp_input_method_v1_registered: Boolean = False;
  vIntf_wp_input_method_v1_Listener: Twp_input_method_v1_listener;
  vwp_input_panel_v1_registered: Boolean = False;
  vIntf_wp_input_panel_v1_Listener: Twp_input_panel_v1_listener;
  vwp_input_panel_surface_v1_registered: Boolean = False;
  vIntf_wp_input_panel_surface_v1_Listener: Twp_input_panel_surface_v1_listener;



constructor TWpInputMethodContextV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpInputMethodContextV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputMethodContextV1;
begin
  RegisterInterface;
  Result := TWpInputMethodContextV1.Create(ARegistry.Bind(AName, @wp_input_method_context_v1_interface, AVersion));
end;

destructor TWpInputMethodContextV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpInputMethodContextV1.CommitString(ASerial: DWord; AText: String);
begin
  wl_proxy_marshal(FProxy, _COMMIT_STRING, ASerial, PChar(AText));
end;

procedure TWpInputMethodContextV1.PreeditString(ASerial: DWord; AText: String; ACommit: String);
begin
  wl_proxy_marshal(FProxy, _PREEDIT_STRING, ASerial, PChar(AText), PChar(ACommit));
end;

procedure TWpInputMethodContextV1.PreeditStyling(AIndex: DWord; ALength: DWord; AStyle: DWord);
begin
  wl_proxy_marshal(FProxy, _PREEDIT_STYLING, AIndex, ALength, AStyle);
end;

procedure TWpInputMethodContextV1.PreeditCursor(AIndex: LongInt);
begin
  wl_proxy_marshal(FProxy, _PREEDIT_CURSOR, AIndex);
end;

procedure TWpInputMethodContextV1.DeleteSurroundingText(AIndex: LongInt; ALength: DWord);
begin
  wl_proxy_marshal(FProxy, _DELETE_SURROUNDING_TEXT, AIndex, ALength);
end;

procedure TWpInputMethodContextV1.CursorPosition(AIndex: LongInt; AAnchor: LongInt);
begin
  wl_proxy_marshal(FProxy, _CURSOR_POSITION, AIndex, AAnchor);
end;

procedure TWpInputMethodContextV1.ModifiersMap(AMap: Pwl_array);
begin
  wl_proxy_marshal(FProxy, _MODIFIERS_MAP, AMap);
end;

procedure TWpInputMethodContextV1.Keysym(ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord);
begin
  wl_proxy_marshal(FProxy, _KEYSYM, ASerial, ATime, ASym, AState, AModifiers);
end;

function TWpInputMethodContextV1.GrabKeyboard(AProxyClass: TWLProxyObjectClass = nil {TWlKeyboard}): TWlKeyboard;
var
  keyboard: Pwl_proxy;
begin
  TWlKeyboard.RegisterInterface;
  keyboard := wl_proxy_marshal_constructor(FProxy,
      _GRAB_KEYBOARD, @wl_keyboard_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlKeyboard;
  Result := TWlKeyboard(AProxyClass.Create(keyboard));
  if not AProxyClass.InheritsFrom(TWlKeyboard) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlKeyboard]);
end;

procedure TWpInputMethodContextV1.Key(ASerial: DWord; ATime: DWord; AKey: DWord; AState: DWord);
begin
  wl_proxy_marshal(FProxy, _KEY, ASerial, ATime, AKey, AState);
end;

procedure TWpInputMethodContextV1.Modifiers(ASerial: DWord; AModsDepressed: DWord; AModsLatched: DWord; AModsLocked: DWord; AGroup: DWord);
begin
  wl_proxy_marshal(FProxy, _MODIFIERS, ASerial, AModsDepressed, AModsLatched, AModsLocked, AGroup);
end;

procedure TWpInputMethodContextV1.Language(ASerial: DWord; ALanguage: String);
begin
  wl_proxy_marshal(FProxy, _LANGUAGE, ASerial, PChar(ALanguage));
end;

procedure TWpInputMethodContextV1.TextDirection(ASerial: DWord; ADirection: DWord);
begin
  wl_proxy_marshal(FProxy, _TEXT_DIRECTION, ASerial, ADirection);
end;

function TWpInputMethodContextV1.AddListener(AIntf: IWpInputMethodContextV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_input_method_context_v1_Listener, @FUserDataRec);
end;
constructor TWpInputMethodV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpInputMethodV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputMethodV1;
begin
  RegisterInterface;
  Result := TWpInputMethodV1.Create(ARegistry.Bind(AName, @wp_input_method_v1_interface, AVersion));
end;

function TWpInputMethodV1.AddListener(AIntf: IWpInputMethodV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_input_method_v1_Listener, @FUserDataRec);
end;
constructor TWpInputPanelV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpInputPanelV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputPanelV1;
begin
  RegisterInterface;
  Result := TWpInputPanelV1.Create(ARegistry.Bind(AName, @wp_input_panel_v1_interface, AVersion));
end;

function TWpInputPanelV1.GetInputPanelSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpInputPanelSurfaceV1}): TWpInputPanelSurfaceV1;
var
  id: Pwl_proxy;
begin
  TWpInputPanelSurfaceV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_INPUT_PANEL_SURFACE, @wp_input_panel_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpInputPanelSurfaceV1;
  Result := TWpInputPanelSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpInputPanelSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpInputPanelSurfaceV1]);
end;

function TWpInputPanelV1.AddListener(AIntf: IWpInputPanelV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_input_panel_v1_Listener, @FUserDataRec);
end;
constructor TWpInputPanelSurfaceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpInputPanelSurfaceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputPanelSurfaceV1;
begin
  RegisterInterface;
  Result := TWpInputPanelSurfaceV1.Create(ARegistry.Bind(AName, @wp_input_panel_surface_v1_interface, AVersion));
end;

procedure TWpInputPanelSurfaceV1.SetToplevel(AOutput: TWlOutput; APosition: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TOPLEVEL, AOutput.Proxy, APosition);
end;

procedure TWpInputPanelSurfaceV1.SetOverlayPanel;
begin
  wl_proxy_marshal(FProxy, _SET_OVERLAY_PANEL);
end;

function TWpInputPanelSurfaceV1.AddListener(AIntf: IWpInputPanelSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_input_panel_surface_v1_Listener, @FUserDataRec);
end;




procedure wp_input_method_context_v1_surrounding_text_Intf(AData: PWLUserData; Awp_input_method_context_v1: Pwp_input_method_context_v1; AText: Pchar; ACursor: DWord; AAnchor: DWord); cdecl;
var
  AIntf: IWpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_context_v1_surrounding_text(TWpInputMethodContextV1(AData^.PascalObject), AText, ACursor, AAnchor);
end;

procedure wp_input_method_context_v1_reset_Intf(AData: PWLUserData; Awp_input_method_context_v1: Pwp_input_method_context_v1); cdecl;
var
  AIntf: IWpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_context_v1_reset(TWpInputMethodContextV1(AData^.PascalObject));
end;

procedure wp_input_method_context_v1_content_type_Intf(AData: PWLUserData; Awp_input_method_context_v1: Pwp_input_method_context_v1; AHint: DWord; APurpose: DWord); cdecl;
var
  AIntf: IWpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_context_v1_content_type(TWpInputMethodContextV1(AData^.PascalObject), AHint, APurpose);
end;

procedure wp_input_method_context_v1_invoke_action_Intf(AData: PWLUserData; Awp_input_method_context_v1: Pwp_input_method_context_v1; AButton: DWord; AIndex: DWord); cdecl;
var
  AIntf: IWpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_context_v1_invoke_action(TWpInputMethodContextV1(AData^.PascalObject), AButton, AIndex);
end;

procedure wp_input_method_context_v1_commit_state_Intf(AData: PWLUserData; Awp_input_method_context_v1: Pwp_input_method_context_v1; ASerial: DWord); cdecl;
var
  AIntf: IWpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_context_v1_commit_state(TWpInputMethodContextV1(AData^.PascalObject), ASerial);
end;

procedure wp_input_method_context_v1_preferred_language_Intf(AData: PWLUserData; Awp_input_method_context_v1: Pwp_input_method_context_v1; ALanguage: Pchar); cdecl;
var
  AIntf: IWpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_context_v1_preferred_language(TWpInputMethodContextV1(AData^.PascalObject), ALanguage);
end;

procedure wp_input_method_v1_activate_Intf(AData: PWLUserData; Awp_input_method_v1: Pwp_input_method_v1; AId: Pwp_input_method_context_v1); cdecl;
var
  AIntf: IWpInputMethodV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_v1_activate(TWpInputMethodV1(AData^.PascalObject),  TWpInputMethodContextV1.Create(AId));
end;

procedure wp_input_method_v1_deactivate_Intf(AData: PWLUserData; Awp_input_method_v1: Pwp_input_method_v1; AContext: Pwp_input_method_context_v1); cdecl;
var
  AIntf: IWpInputMethodV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputMethodV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_method_v1_deactivate(TWpInputMethodV1(AData^.PascalObject),  TWpInputMethodContextV1(TWLProxyObject.WLToObj(AContext)));
end;



const
  pInterfaces: array[0..14] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_keyboard_interface),
    (@wp_input_method_context_v1_interface),
    (@wp_input_method_context_v1_interface),
    (@wp_input_panel_surface_v1_interface),
    (@wl_surface_interface),
    (@wl_output_interface),
    (nil)
  );

  wp_input_method_context_v1_requests: array[0..13] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'commit_string'; signature: 'us'; types: @pInterfaces[0]),
    (name: 'preedit_string'; signature: 'uss'; types: @pInterfaces[0]),
    (name: 'preedit_styling'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'preedit_cursor'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'delete_surrounding_text'; signature: 'iu'; types: @pInterfaces[0]),
    (name: 'cursor_position'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'modifiers_map'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'keysym'; signature: 'uuuuu'; types: @pInterfaces[0]),
    (name: 'grab_keyboard'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'key'; signature: 'uuuu'; types: @pInterfaces[0]),
    (name: 'modifiers'; signature: 'uuuuu'; types: @pInterfaces[0]),
    (name: 'language'; signature: 'us'; types: @pInterfaces[0]),
    (name: 'text_direction'; signature: 'uu'; types: @pInterfaces[0])
  );
  wp_input_method_context_v1_events: array[0..5] of Twl_message = (
    (name: 'surrounding_text'; signature: 'suu'; types: @pInterfaces[0]),
    (name: 'reset'; signature: ''; types: @pInterfaces[0]),
    (name: 'content_type'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'invoke_action'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'commit_state'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'preferred_language'; signature: 's'; types: @pInterfaces[0])
  );
  wp_input_method_v1_events: array[0..1] of Twl_message = (
    (name: 'activate'; signature: 'n'; types: @pInterfaces[9]),
    (name: 'deactivate'; signature: 'o'; types: @pInterfaces[10])
  );
  wp_input_panel_v1_requests: array[0..0] of Twl_message = (
    (name: 'get_input_panel_surface'; signature: 'no'; types: @pInterfaces[11])
  );
  wp_input_panel_surface_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_toplevel'; signature: 'ou'; types: @pInterfaces[13]),
    (name: 'set_overlay_panel'; signature: ''; types: @pInterfaces[0])
  );

class procedure TWpInputMethodContextV1.RegisterInterface;
begin
  if vwp_input_method_context_v1_registered then Exit;
  vwp_input_method_context_v1_registered := True;
  Pointer(vIntf_wp_input_method_context_v1_Listener.surrounding_text) := @wp_input_method_context_v1_surrounding_text_Intf;
  Pointer(vIntf_wp_input_method_context_v1_Listener.reset) := @wp_input_method_context_v1_reset_Intf;
  Pointer(vIntf_wp_input_method_context_v1_Listener.content_type) := @wp_input_method_context_v1_content_type_Intf;
  Pointer(vIntf_wp_input_method_context_v1_Listener.invoke_action) := @wp_input_method_context_v1_invoke_action_Intf;
  Pointer(vIntf_wp_input_method_context_v1_Listener.commit_state) := @wp_input_method_context_v1_commit_state_Intf;
  Pointer(vIntf_wp_input_method_context_v1_Listener.preferred_language) := @wp_input_method_context_v1_preferred_language_Intf;
  wp_input_method_context_v1_interface.name := PChar(WP_INPUT_METHOD_CONTEXT_V1_INTERFACE_NAME);
  wp_input_method_context_v1_interface.version := 1;
  wp_input_method_context_v1_interface.method_count := 14;
  wp_input_method_context_v1_interface.methods := @wp_input_method_context_v1_requests;
  wp_input_method_context_v1_interface.event_count := 6;
  wp_input_method_context_v1_interface.events := @wp_input_method_context_v1_events;
end;

class procedure TWpInputMethodV1.RegisterInterface;
begin
  if vwp_input_method_v1_registered then Exit;
  vwp_input_method_v1_registered := True;
  Pointer(vIntf_wp_input_method_v1_Listener.activate) := @wp_input_method_v1_activate_Intf;
  Pointer(vIntf_wp_input_method_v1_Listener.deactivate) := @wp_input_method_v1_deactivate_Intf;
  wp_input_method_v1_interface.name := PChar(WP_INPUT_METHOD_V1_INTERFACE_NAME);
  wp_input_method_v1_interface.version := 1;
  wp_input_method_v1_interface.method_count := 0;
  wp_input_method_v1_interface.methods := nil;
  wp_input_method_v1_interface.event_count := 2;
  wp_input_method_v1_interface.events := @wp_input_method_v1_events;
end;

class procedure TWpInputPanelV1.RegisterInterface;
begin
  if vwp_input_panel_v1_registered then Exit;
  vwp_input_panel_v1_registered := True;
  wp_input_panel_v1_interface.name := PChar(WP_INPUT_PANEL_V1_INTERFACE_NAME);
  wp_input_panel_v1_interface.version := 1;
  wp_input_panel_v1_interface.method_count := 1;
  wp_input_panel_v1_interface.methods := @wp_input_panel_v1_requests;
  wp_input_panel_v1_interface.event_count := 0;
  wp_input_panel_v1_interface.events := nil;
end;

class procedure TWpInputPanelSurfaceV1.RegisterInterface;
begin
  if vwp_input_panel_surface_v1_registered then Exit;
  vwp_input_panel_surface_v1_registered := True;
  wp_input_panel_surface_v1_interface.name := PChar(WP_INPUT_PANEL_SURFACE_V1_INTERFACE_NAME);
  wp_input_panel_surface_v1_interface.version := 1;
  wp_input_panel_surface_v1_interface.method_count := 2;
  wp_input_panel_surface_v1_interface.methods := @wp_input_panel_surface_v1_requests;
  wp_input_panel_surface_v1_interface.event_count := 0;
  wp_input_panel_surface_v1_interface.events := nil;
end;


end.
