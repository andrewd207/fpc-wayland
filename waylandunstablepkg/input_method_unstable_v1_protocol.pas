unit input_method_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_input_method_context_v1 = Pointer;
  Pzwp_input_method_v1 = Pointer;
  Pzwp_input_panel_v1 = Pointer;
  Pzwp_input_panel_surface_v1 = Pointer;
  Pzwp_input_method_context_v1_listener = ^Tzwp_input_method_context_v1_listener;
  Tzwp_input_method_context_v1_listener = record
    surrounding_text : procedure(data: Pointer; AZwpInputMethodContextV1: Pzwp_input_method_context_v1; AText: Pchar; ACursor: DWord; AAnchor: DWord); cdecl;
    reset : procedure(data: Pointer; AZwpInputMethodContextV1: Pzwp_input_method_context_v1); cdecl;
    content_type : procedure(data: Pointer; AZwpInputMethodContextV1: Pzwp_input_method_context_v1; AHint: DWord; APurpose: DWord); cdecl;
    invoke_action : procedure(data: Pointer; AZwpInputMethodContextV1: Pzwp_input_method_context_v1; AButton: DWord; AIndex: DWord); cdecl;
    commit_state : procedure(data: Pointer; AZwpInputMethodContextV1: Pzwp_input_method_context_v1; ASerial: DWord); cdecl;
    preferred_language : procedure(data: Pointer; AZwpInputMethodContextV1: Pzwp_input_method_context_v1; ALanguage: Pchar); cdecl;
  end;

  Pzwp_input_method_v1_listener = ^Tzwp_input_method_v1_listener;
  Tzwp_input_method_v1_listener = record
    activate : procedure(data: Pointer; AZwpInputMethodV1: Pzwp_input_method_v1; AId: Pzwp_input_method_context_v1); cdecl;
    deactivate : procedure(data: Pointer; AZwpInputMethodV1: Pzwp_input_method_v1; AContext: Pzwp_input_method_context_v1); cdecl;
  end;

  Pzwp_input_panel_v1_listener = ^Tzwp_input_panel_v1_listener;
  Tzwp_input_panel_v1_listener = record
  end;

const
  ZWP_INPUT_PANEL_SURFACE_V1_POSITION_CENTER_BOTTOM = 0;

type
  Pzwp_input_panel_surface_v1_listener = ^Tzwp_input_panel_surface_v1_listener;
  Tzwp_input_panel_surface_v1_listener = record
  end;



  TZwpInputMethodContextV1 = class;
  TZwpInputMethodV1 = class;
  TZwpInputPanelV1 = class;
  TZwpInputPanelSurfaceV1 = class;


  IZwpInputMethodContextV1Listener = interface
  ['IZwpInputMethodContextV1Listener']
    procedure zwp_input_method_context_v1_surrounding_text(AZwpInputMethodContextV1: TZwpInputMethodContextV1; AText: String; ACursor: DWord; AAnchor: DWord);
    procedure zwp_input_method_context_v1_reset(AZwpInputMethodContextV1: TZwpInputMethodContextV1);
    procedure zwp_input_method_context_v1_content_type(AZwpInputMethodContextV1: TZwpInputMethodContextV1; AHint: DWord; APurpose: DWord);
    procedure zwp_input_method_context_v1_invoke_action(AZwpInputMethodContextV1: TZwpInputMethodContextV1; AButton: DWord; AIndex: DWord);
    procedure zwp_input_method_context_v1_commit_state(AZwpInputMethodContextV1: TZwpInputMethodContextV1; ASerial: DWord);
    procedure zwp_input_method_context_v1_preferred_language(AZwpInputMethodContextV1: TZwpInputMethodContextV1; ALanguage: String);
  end;

  IZwpInputMethodV1Listener = interface
  ['IZwpInputMethodV1Listener']
    procedure zwp_input_method_v1_activate(AZwpInputMethodV1: TZwpInputMethodV1; AId: TZwpInputMethodContextV1);
    procedure zwp_input_method_v1_deactivate(AZwpInputMethodV1: TZwpInputMethodV1; AContext: TZwpInputMethodContextV1);
  end;

  IZwpInputPanelV1Listener = interface
  ['IZwpInputPanelV1Listener']
  end;

  IZwpInputPanelSurfaceV1Listener = interface
  ['IZwpInputPanelSurfaceV1Listener']
  end;




  TZwpInputMethodContextV1 = class(TWLProxyObject)
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
    function AddListener(AIntf: IZwpInputMethodContextV1Listener): LongInt;
  end;

  TZwpInputMethodV1 = class(TWLProxyObject)
    function AddListener(AIntf: IZwpInputMethodV1Listener): LongInt;
  end;

  TZwpInputPanelV1 = class(TWLProxyObject)
  private
    const _GET_INPUT_PANEL_SURFACE = 0;
  public
    function GetInputPanelSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpInputPanelSurfaceV1}): TZwpInputPanelSurfaceV1;
    function AddListener(AIntf: IZwpInputPanelV1Listener): LongInt;
  end;

  TZwpInputPanelSurfaceV1 = class(TWLProxyObject)
  private
    const _SET_TOPLEVEL = 0;
    const _SET_OVERLAY_PANEL = 1;
  public
    procedure SetToplevel(AOutput: TWlOutput; APosition: DWord);
    procedure SetOverlayPanel;
    function AddListener(AIntf: IZwpInputPanelSurfaceV1Listener): LongInt;
  end;






var
  zwp_input_method_context_v1_interface: Twl_interface;
  zwp_input_method_v1_interface: Twl_interface;
  zwp_input_panel_v1_interface: Twl_interface;
  zwp_input_panel_surface_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_input_method_context_v1_Listener: Tzwp_input_method_context_v1_listener;
  vIntf_zwp_input_method_v1_Listener: Tzwp_input_method_v1_listener;
  vIntf_zwp_input_panel_v1_Listener: Tzwp_input_panel_v1_listener;
  vIntf_zwp_input_panel_surface_v1_Listener: Tzwp_input_panel_surface_v1_listener;



destructor TZwpInputMethodContextV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZwpInputMethodContextV1.CommitString(ASerial: DWord; AText: String);
begin
  wl_proxy_marshal(FProxy, _COMMIT_STRING, ASerial, PChar(AText));
end;

procedure TZwpInputMethodContextV1.PreeditString(ASerial: DWord; AText: String; ACommit: String);
begin
  wl_proxy_marshal(FProxy, _PREEDIT_STRING, ASerial, PChar(AText), PChar(ACommit));
end;

procedure TZwpInputMethodContextV1.PreeditStyling(AIndex: DWord; ALength: DWord; AStyle: DWord);
begin
  wl_proxy_marshal(FProxy, _PREEDIT_STYLING, AIndex, ALength, AStyle);
end;

procedure TZwpInputMethodContextV1.PreeditCursor(AIndex: LongInt);
begin
  wl_proxy_marshal(FProxy, _PREEDIT_CURSOR, AIndex);
end;

procedure TZwpInputMethodContextV1.DeleteSurroundingText(AIndex: LongInt; ALength: DWord);
begin
  wl_proxy_marshal(FProxy, _DELETE_SURROUNDING_TEXT, AIndex, ALength);
end;

procedure TZwpInputMethodContextV1.CursorPosition(AIndex: LongInt; AAnchor: LongInt);
begin
  wl_proxy_marshal(FProxy, _CURSOR_POSITION, AIndex, AAnchor);
end;

procedure TZwpInputMethodContextV1.ModifiersMap(AMap: Pwl_array);
begin
  wl_proxy_marshal(FProxy, _MODIFIERS_MAP, AMap);
end;

procedure TZwpInputMethodContextV1.Keysym(ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord);
begin
  wl_proxy_marshal(FProxy, _KEYSYM, ASerial, ATime, ASym, AState, AModifiers);
end;

function TZwpInputMethodContextV1.GrabKeyboard(AProxyClass: TWLProxyObjectClass = nil {TWlKeyboard}): TWlKeyboard;
var
  keyboard: Pwl_proxy;
begin
  keyboard := wl_proxy_marshal_constructor(FProxy,
      _GRAB_KEYBOARD, @wl_keyboard_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlKeyboard;
  Result := TWlKeyboard(AProxyClass.Create(keyboard));
  if not AProxyClass.InheritsFrom(TWlKeyboard) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlKeyboard]);
end;

procedure TZwpInputMethodContextV1.Key(ASerial: DWord; ATime: DWord; AKey: DWord; AState: DWord);
begin
  wl_proxy_marshal(FProxy, _KEY, ASerial, ATime, AKey, AState);
end;

procedure TZwpInputMethodContextV1.Modifiers(ASerial: DWord; AModsDepressed: DWord; AModsLatched: DWord; AModsLocked: DWord; AGroup: DWord);
begin
  wl_proxy_marshal(FProxy, _MODIFIERS, ASerial, AModsDepressed, AModsLatched, AModsLocked, AGroup);
end;

procedure TZwpInputMethodContextV1.Language(ASerial: DWord; ALanguage: String);
begin
  wl_proxy_marshal(FProxy, _LANGUAGE, ASerial, PChar(ALanguage));
end;

procedure TZwpInputMethodContextV1.TextDirection(ASerial: DWord; ADirection: DWord);
begin
  wl_proxy_marshal(FProxy, _TEXT_DIRECTION, ASerial, ADirection);
end;

function TZwpInputMethodContextV1.AddListener(AIntf: IZwpInputMethodContextV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_input_method_context_v1_Listener, @FUserDataRec);
end;
function TZwpInputMethodV1.AddListener(AIntf: IZwpInputMethodV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_input_method_v1_Listener, @FUserDataRec);
end;
function TZwpInputPanelV1.GetInputPanelSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpInputPanelSurfaceV1}): TZwpInputPanelSurfaceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_INPUT_PANEL_SURFACE, @zwp_input_panel_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpInputPanelSurfaceV1;
  Result := TZwpInputPanelSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpInputPanelSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpInputPanelSurfaceV1]);
end;

function TZwpInputPanelV1.AddListener(AIntf: IZwpInputPanelV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_input_panel_v1_Listener, @FUserDataRec);
end;
procedure TZwpInputPanelSurfaceV1.SetToplevel(AOutput: TWlOutput; APosition: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TOPLEVEL, AOutput.Proxy, APosition);
end;

procedure TZwpInputPanelSurfaceV1.SetOverlayPanel;
begin
  wl_proxy_marshal(FProxy, _SET_OVERLAY_PANEL);
end;

function TZwpInputPanelSurfaceV1.AddListener(AIntf: IZwpInputPanelSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_input_panel_surface_v1_Listener, @FUserDataRec);
end;




procedure zwp_input_method_context_v1_surrounding_text_Intf(AData: PWLUserData; Azwp_input_method_context_v1: Pzwp_input_method_context_v1; AText: Pchar; ACursor: DWord; AAnchor: DWord); cdecl;
var
  AIntf: IZwpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_context_v1_surrounding_text(TZwpInputMethodContextV1(AData^.PascalObject), AText, ACursor, AAnchor);
end;

procedure zwp_input_method_context_v1_reset_Intf(AData: PWLUserData; Azwp_input_method_context_v1: Pzwp_input_method_context_v1); cdecl;
var
  AIntf: IZwpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_context_v1_reset(TZwpInputMethodContextV1(AData^.PascalObject));
end;

procedure zwp_input_method_context_v1_content_type_Intf(AData: PWLUserData; Azwp_input_method_context_v1: Pzwp_input_method_context_v1; AHint: DWord; APurpose: DWord); cdecl;
var
  AIntf: IZwpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_context_v1_content_type(TZwpInputMethodContextV1(AData^.PascalObject), AHint, APurpose);
end;

procedure zwp_input_method_context_v1_invoke_action_Intf(AData: PWLUserData; Azwp_input_method_context_v1: Pzwp_input_method_context_v1; AButton: DWord; AIndex: DWord); cdecl;
var
  AIntf: IZwpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_context_v1_invoke_action(TZwpInputMethodContextV1(AData^.PascalObject), AButton, AIndex);
end;

procedure zwp_input_method_context_v1_commit_state_Intf(AData: PWLUserData; Azwp_input_method_context_v1: Pzwp_input_method_context_v1; ASerial: DWord); cdecl;
var
  AIntf: IZwpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_context_v1_commit_state(TZwpInputMethodContextV1(AData^.PascalObject), ASerial);
end;

procedure zwp_input_method_context_v1_preferred_language_Intf(AData: PWLUserData; Azwp_input_method_context_v1: Pzwp_input_method_context_v1; ALanguage: Pchar); cdecl;
var
  AIntf: IZwpInputMethodContextV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodContextV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_context_v1_preferred_language(TZwpInputMethodContextV1(AData^.PascalObject), ALanguage);
end;

procedure zwp_input_method_v1_activate_Intf(AData: PWLUserData; Azwp_input_method_v1: Pzwp_input_method_v1; AId: Pzwp_input_method_context_v1); cdecl;
var
  AIntf: IZwpInputMethodV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_v1_activate(TZwpInputMethodV1(AData^.PascalObject),  TZwpInputMethodContextV1.Create(AId));
end;

procedure zwp_input_method_v1_deactivate_Intf(AData: PWLUserData; Azwp_input_method_v1: Pzwp_input_method_v1; AContext: Pzwp_input_method_context_v1); cdecl;
var
  AIntf: IZwpInputMethodV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputMethodV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_method_v1_deactivate(TZwpInputMethodV1(AData^.PascalObject),  TZwpInputMethodContextV1(TWLProxyObject.WLToObj(AContext)));
end;



const
  pInterfaces: array[0..13] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_keyboard_interface),
    (@zwp_input_method_context_v1_interface),
    (@zwp_input_panel_surface_v1_interface),
    (@wl_surface_interface),
    (@wl_output_interface),
    (nil)
  );

  zwp_input_method_context_v1_requests: array[0..13] of Twl_message = (
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
  zwp_input_method_context_v1_events: array[0..5] of Twl_message = (
    (name: 'surrounding_text'; signature: 'suu'; types: @pInterfaces[0]),
    (name: 'reset'; signature: ''; types: @pInterfaces[0]),
    (name: 'content_type'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'invoke_action'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'commit_state'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'preferred_language'; signature: 's'; types: @pInterfaces[0])
  );
  zwp_input_method_v1_events: array[0..1] of Twl_message = (
    (name: 'activate'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'deactivate'; signature: 'o'; types: @pInterfaces[9])
  );
  zwp_input_panel_v1_requests: array[0..0] of Twl_message = (
    (name: 'get_input_panel_surface'; signature: 'no'; types: @pInterfaces[10])
  );
  zwp_input_panel_surface_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_toplevel'; signature: 'ou'; types: @pInterfaces[12]),
    (name: 'set_overlay_panel'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_input_method_context_v1_Listener.surrounding_text) := @zwp_input_method_context_v1_surrounding_text_Intf;
  Pointer(vIntf_zwp_input_method_context_v1_Listener.reset) := @zwp_input_method_context_v1_reset_Intf;
  Pointer(vIntf_zwp_input_method_context_v1_Listener.content_type) := @zwp_input_method_context_v1_content_type_Intf;
  Pointer(vIntf_zwp_input_method_context_v1_Listener.invoke_action) := @zwp_input_method_context_v1_invoke_action_Intf;
  Pointer(vIntf_zwp_input_method_context_v1_Listener.commit_state) := @zwp_input_method_context_v1_commit_state_Intf;
  Pointer(vIntf_zwp_input_method_context_v1_Listener.preferred_language) := @zwp_input_method_context_v1_preferred_language_Intf;
  Pointer(vIntf_zwp_input_method_v1_Listener.activate) := @zwp_input_method_v1_activate_Intf;
  Pointer(vIntf_zwp_input_method_v1_Listener.deactivate) := @zwp_input_method_v1_deactivate_Intf;


  zwp_input_method_context_v1_interface.name := 'zwp_input_method_context_v1';
  zwp_input_method_context_v1_interface.version := 1;
  zwp_input_method_context_v1_interface.method_count := 14;
  zwp_input_method_context_v1_interface.methods := @zwp_input_method_context_v1_requests;
  zwp_input_method_context_v1_interface.event_count := 6;
  zwp_input_method_context_v1_interface.events := @zwp_input_method_context_v1_events;

  zwp_input_method_v1_interface.name := 'zwp_input_method_v1';
  zwp_input_method_v1_interface.version := 1;
  zwp_input_method_v1_interface.method_count := 0;
  zwp_input_method_v1_interface.methods := nil;
  zwp_input_method_v1_interface.event_count := 2;
  zwp_input_method_v1_interface.events := @zwp_input_method_v1_events;

  zwp_input_panel_v1_interface.name := 'zwp_input_panel_v1';
  zwp_input_panel_v1_interface.version := 1;
  zwp_input_panel_v1_interface.method_count := 1;
  zwp_input_panel_v1_interface.methods := @zwp_input_panel_v1_requests;
  zwp_input_panel_v1_interface.event_count := 0;
  zwp_input_panel_v1_interface.events := nil;

  zwp_input_panel_surface_v1_interface.name := 'zwp_input_panel_surface_v1';
  zwp_input_panel_surface_v1_interface.version := 1;
  zwp_input_panel_surface_v1_interface.method_count := 2;
  zwp_input_panel_surface_v1_interface.methods := @zwp_input_panel_surface_v1_requests;
  zwp_input_panel_surface_v1_interface.event_count := 0;
  zwp_input_panel_surface_v1_interface.events := nil;

end.
