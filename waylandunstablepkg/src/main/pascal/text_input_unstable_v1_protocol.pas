unit text_input_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_text_input_v1 = Pointer;
  Pwp_text_input_manager_v1 = Pointer;
const
  WP_TEXT_INPUT_V1_CONTENT_HINT_NONE = $0; // no special behaviour
  WP_TEXT_INPUT_V1_CONTENT_HINT_DEFAULT = $7; // auto completion, correction and capitalization
  WP_TEXT_INPUT_V1_CONTENT_HINT_PASSWORD = $c0; // hidden and sensitive text
  WP_TEXT_INPUT_V1_CONTENT_HINT_AUTO_COMPLETION = $1; // suggest word completions
  WP_TEXT_INPUT_V1_CONTENT_HINT_AUTO_CORRECTION = $2; // suggest word corrections
  WP_TEXT_INPUT_V1_CONTENT_HINT_AUTO_CAPITALIZATION = $4; // switch to uppercase letters at the start of a sentence
  WP_TEXT_INPUT_V1_CONTENT_HINT_LOWERCASE = $8; // prefer lowercase letters
  WP_TEXT_INPUT_V1_CONTENT_HINT_UPPERCASE = $10; // prefer uppercase letters
  WP_TEXT_INPUT_V1_CONTENT_HINT_TITLECASE = $20; // prefer casing for titles and headings (can be language dependent)
  WP_TEXT_INPUT_V1_CONTENT_HINT_HIDDEN_TEXT = $40; // characters should be hidden
  WP_TEXT_INPUT_V1_CONTENT_HINT_SENSITIVE_DATA = $80; // typed text should not be stored
  WP_TEXT_INPUT_V1_CONTENT_HINT_LATIN = $100; // just latin characters should be entered
  WP_TEXT_INPUT_V1_CONTENT_HINT_MULTILINE = $200; // the text input is multiline
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_NORMAL = 0; // default input, allowing all characters
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_ALPHA = 1; // allow only alphabetic characters
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_DIGITS = 2; // allow only digits
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_NUMBER = 3; // input a number (including decimal separator and sign)
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_PHONE = 4; // input a phone number
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_URL = 5; // input an URL
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_EMAIL = 6; // input an email address
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_NAME = 7; // input a name of a person
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_PASSWORD = 8; // input a password (combine with password or sensitive_data hint)
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_DATE = 9; // input a date
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_TIME = 10; // input a time
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_DATETIME = 11; // input a date and time
  WP_TEXT_INPUT_V1_CONTENT_PURPOSE_TERMINAL = 12; // input for a terminal
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_DEFAULT = 0; // default style for composing text
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_NONE = 1; // style should be the same as in non-composing text
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_ACTIVE = 2; // 
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_INACTIVE = 3; // 
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_HIGHLIGHT = 4; // 
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_UNDERLINE = 5; // 
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_SELECTION = 6; // 
  WP_TEXT_INPUT_V1_PREEDIT_STYLE_INCORRECT = 7; // 
  WP_TEXT_INPUT_V1_TEXT_DIRECTION_AUTO = 0; // automatic text direction based on text and language
  WP_TEXT_INPUT_V1_TEXT_DIRECTION_LTR = 1; // left-to-right
  WP_TEXT_INPUT_V1_TEXT_DIRECTION_RTL = 2; // right-to-left

type
  Pwp_text_input_v1_listener = ^Twp_text_input_v1_listener;
  Twp_text_input_v1_listener = record
    enter : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; ASurface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1); cdecl;
    modifiers_map : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; AMap: Pwl_array); cdecl;
    input_panel_state : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; AState: DWord); cdecl;
    preedit_string : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; ASerial: DWord; AText: Pchar; ACommit: Pchar); cdecl;
    preedit_styling : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; AIndex: DWord; ALength: DWord; AStyle: DWord); cdecl;
    preedit_cursor : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; AIndex: LongInt); cdecl;
    commit_string : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; ASerial: DWord; AText: Pchar); cdecl;
    cursor_position : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; AIndex: LongInt; AAnchor: LongInt); cdecl;
    delete_surrounding_text : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; AIndex: LongInt; ALength: DWord); cdecl;
    keysym : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord); cdecl;
    language : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; ASerial: DWord; ALanguage: Pchar); cdecl;
    text_direction : procedure(data: Pointer; AWpTextInputV1: Pwp_text_input_v1; ASerial: DWord; ADirection: DWord); cdecl;
  end;

  Pwp_text_input_manager_v1_listener = ^Twp_text_input_manager_v1_listener;
  Twp_text_input_manager_v1_listener = record
  end;



  TWpTextInputV1 = class;
  TWpTextInputManagerV1 = class;


  IWpTextInputV1Listener = interface
  ['IWpTextInputV1Listener']
    procedure wp_text_input_v1_enter(AWpTextInputV1: TWpTextInputV1; ASurface: TWlSurface);
    procedure wp_text_input_v1_leave(AWpTextInputV1: TWpTextInputV1);
    procedure wp_text_input_v1_modifiers_map(AWpTextInputV1: TWpTextInputV1; AMap: Pwl_array);
    procedure wp_text_input_v1_input_panel_state(AWpTextInputV1: TWpTextInputV1; AState: DWord);
    procedure wp_text_input_v1_preedit_string(AWpTextInputV1: TWpTextInputV1; ASerial: DWord; AText: String; ACommit: String);
    procedure wp_text_input_v1_preedit_styling(AWpTextInputV1: TWpTextInputV1; AIndex: DWord; ALength: DWord; AStyle: DWord);
    procedure wp_text_input_v1_preedit_cursor(AWpTextInputV1: TWpTextInputV1; AIndex: LongInt);
    procedure wp_text_input_v1_commit_string(AWpTextInputV1: TWpTextInputV1; ASerial: DWord; AText: String);
    procedure wp_text_input_v1_cursor_position(AWpTextInputV1: TWpTextInputV1; AIndex: LongInt; AAnchor: LongInt);
    procedure wp_text_input_v1_delete_surrounding_text(AWpTextInputV1: TWpTextInputV1; AIndex: LongInt; ALength: DWord);
    procedure wp_text_input_v1_keysym(AWpTextInputV1: TWpTextInputV1; ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord);
    procedure wp_text_input_v1_language(AWpTextInputV1: TWpTextInputV1; ASerial: DWord; ALanguage: String);
    procedure wp_text_input_v1_text_direction(AWpTextInputV1: TWpTextInputV1; ASerial: DWord; ADirection: DWord);
  end;

  IWpTextInputManagerV1Listener = interface
  ['IWpTextInputManagerV1Listener']
  end;




  TWpTextInputV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTextInputV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _ACTIVATE = 0;
    const _DEACTIVATE = 1;
    const _SHOW_INPUT_PANEL = 2;
    const _HIDE_INPUT_PANEL = 3;
    const _RESET = 4;
    const _SET_SURROUNDING_TEXT = 5;
    const _SET_CONTENT_TYPE = 6;
    const _SET_CURSOR_RECTANGLE = 7;
    const _SET_PREFERRED_LANGUAGE = 8;
    const _COMMIT_STATE = 9;
    const _INVOKE_ACTION = 10;
  public
    procedure Activate(ASeat: TWlSeat; ASurface: TWlSurface);
    procedure Deactivate(ASeat: TWlSeat);
    procedure ShowInputPanel;
    procedure HideInputPanel;
    procedure Reset;
    procedure SetSurroundingText(AText: String; ACursor: DWord; AAnchor: DWord);
    procedure SetContentType(AHint: DWord; APurpose: DWord);
    procedure SetCursorRectangle(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure SetPreferredLanguage(ALanguage: String);
    procedure CommitState(ASerial: DWord);
    procedure InvokeAction(AButton: DWord; AIndex: DWord);
    function AddListener(AIntf: IWpTextInputV1Listener): LongInt;
  end;

  TWpTextInputManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTextInputManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE_TEXT_INPUT = 0;
  public
    function CreateTextInput(AProxyClass: TWLProxyObjectClass = nil {TWpTextInputV1}): TWpTextInputV1;
    function AddListener(AIntf: IWpTextInputManagerV1Listener): LongInt;
  end;






var
  wp_text_input_v1_interface: Twl_interface;
  WP_TEXT_INPUT_V1_INTERFACE_NAME: String = 'zwp_text_input_v1';
  wp_text_input_manager_v1_interface: Twl_interface;
  WP_TEXT_INPUT_MANAGER_V1_INTERFACE_NAME: String = 'zwp_text_input_manager_v1';



implementation

var
  vwp_text_input_v1_registered: Boolean = False;
  vIntf_wp_text_input_v1_Listener: Twp_text_input_v1_listener;
  vwp_text_input_manager_v1_registered: Boolean = False;
  vIntf_wp_text_input_manager_v1_Listener: Twp_text_input_manager_v1_listener;



constructor TWpTextInputV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTextInputV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTextInputV1;
begin
  RegisterInterface;
  Result := TWpTextInputV1.Create(ARegistry.Bind(AName, @wp_text_input_v1_interface, AVersion));
end;

procedure TWpTextInputV1.Activate(ASeat: TWlSeat; ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _ACTIVATE, ASeat.Proxy, ASurface.Proxy);
end;

procedure TWpTextInputV1.Deactivate(ASeat: TWlSeat);
begin
  wl_proxy_marshal(FProxy, _DEACTIVATE, ASeat.Proxy);
end;

procedure TWpTextInputV1.ShowInputPanel;
begin
  wl_proxy_marshal(FProxy, _SHOW_INPUT_PANEL);
end;

procedure TWpTextInputV1.HideInputPanel;
begin
  wl_proxy_marshal(FProxy, _HIDE_INPUT_PANEL);
end;

procedure TWpTextInputV1.Reset;
begin
  wl_proxy_marshal(FProxy, _RESET);
end;

procedure TWpTextInputV1.SetSurroundingText(AText: String; ACursor: DWord; AAnchor: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_SURROUNDING_TEXT, PChar(AText), ACursor, AAnchor);
end;

procedure TWpTextInputV1.SetContentType(AHint: DWord; APurpose: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONTENT_TYPE, AHint, APurpose);
end;

procedure TWpTextInputV1.SetCursorRectangle(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR_RECTANGLE, AX, AY, AWidth, AHeight);
end;

procedure TWpTextInputV1.SetPreferredLanguage(ALanguage: String);
begin
  wl_proxy_marshal(FProxy, _SET_PREFERRED_LANGUAGE, PChar(ALanguage));
end;

procedure TWpTextInputV1.CommitState(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _COMMIT_STATE, ASerial);
end;

procedure TWpTextInputV1.InvokeAction(AButton: DWord; AIndex: DWord);
begin
  wl_proxy_marshal(FProxy, _INVOKE_ACTION, AButton, AIndex);
end;

function TWpTextInputV1.AddListener(AIntf: IWpTextInputV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_text_input_v1_Listener, @FUserDataRec);
end;
constructor TWpTextInputManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTextInputManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTextInputManagerV1;
begin
  RegisterInterface;
  Result := TWpTextInputManagerV1.Create(ARegistry.Bind(AName, @wp_text_input_manager_v1_interface, AVersion));
end;

function TWpTextInputManagerV1.CreateTextInput(AProxyClass: TWLProxyObjectClass = nil {TWpTextInputV1}): TWpTextInputV1;
var
  id: Pwl_proxy;
begin
  TWpTextInputV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_TEXT_INPUT, @wp_text_input_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpTextInputV1;
  Result := TWpTextInputV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpTextInputV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpTextInputV1]);
end;

function TWpTextInputManagerV1.AddListener(AIntf: IWpTextInputManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_text_input_manager_v1_Listener, @FUserDataRec);
end;




procedure wp_text_input_v1_enter_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_enter(TWpTextInputV1(AData^.PascalObject),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wp_text_input_v1_leave_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_leave(TWpTextInputV1(AData^.PascalObject));
end;

procedure wp_text_input_v1_modifiers_map_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; AMap: Pwl_array); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_modifiers_map(TWpTextInputV1(AData^.PascalObject), AMap);
end;

procedure wp_text_input_v1_input_panel_state_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; AState: DWord); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_input_panel_state(TWpTextInputV1(AData^.PascalObject), AState);
end;

procedure wp_text_input_v1_preedit_string_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; ASerial: DWord; AText: Pchar; ACommit: Pchar); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_preedit_string(TWpTextInputV1(AData^.PascalObject), ASerial, AText, ACommit);
end;

procedure wp_text_input_v1_preedit_styling_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; AIndex: DWord; ALength: DWord; AStyle: DWord); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_preedit_styling(TWpTextInputV1(AData^.PascalObject), AIndex, ALength, AStyle);
end;

procedure wp_text_input_v1_preedit_cursor_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; AIndex: LongInt); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_preedit_cursor(TWpTextInputV1(AData^.PascalObject), AIndex);
end;

procedure wp_text_input_v1_commit_string_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; ASerial: DWord; AText: Pchar); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_commit_string(TWpTextInputV1(AData^.PascalObject), ASerial, AText);
end;

procedure wp_text_input_v1_cursor_position_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; AIndex: LongInt; AAnchor: LongInt); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_cursor_position(TWpTextInputV1(AData^.PascalObject), AIndex, AAnchor);
end;

procedure wp_text_input_v1_delete_surrounding_text_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; AIndex: LongInt; ALength: DWord); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_delete_surrounding_text(TWpTextInputV1(AData^.PascalObject), AIndex, ALength);
end;

procedure wp_text_input_v1_keysym_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_keysym(TWpTextInputV1(AData^.PascalObject), ASerial, ATime, ASym, AState, AModifiers);
end;

procedure wp_text_input_v1_language_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; ASerial: DWord; ALanguage: Pchar); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_language(TWpTextInputV1(AData^.PascalObject), ASerial, ALanguage);
end;

procedure wp_text_input_v1_text_direction_Intf(AData: PWLUserData; Awp_text_input_v1: Pwp_text_input_v1; ASerial: DWord; ADirection: DWord); cdecl;
var
  AIntf: IWpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v1_text_direction(TWpTextInputV1(AData^.PascalObject), ASerial, ADirection);
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
    (@wl_seat_interface),
    (@wl_surface_interface),
    (@wl_seat_interface),
    (@wl_surface_interface),
    (@wp_text_input_v1_interface)
  );

  wp_text_input_v1_requests: array[0..10] of Twl_message = (
    (name: 'activate'; signature: 'oo'; types: @pInterfaces[8]),
    (name: 'deactivate'; signature: 'o'; types: @pInterfaces[10]),
    (name: 'show_input_panel'; signature: ''; types: @pInterfaces[0]),
    (name: 'hide_input_panel'; signature: ''; types: @pInterfaces[0]),
    (name: 'reset'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_surrounding_text'; signature: 'suu'; types: @pInterfaces[0]),
    (name: 'set_content_type'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'set_cursor_rectangle'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_preferred_language'; signature: 's'; types: @pInterfaces[0]),
    (name: 'commit_state'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'invoke_action'; signature: 'uu'; types: @pInterfaces[0])
  );
  wp_text_input_v1_events: array[0..12] of Twl_message = (
    (name: 'enter'; signature: 'o'; types: @pInterfaces[11]),
    (name: 'leave'; signature: ''; types: @pInterfaces[0]),
    (name: 'modifiers_map'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'input_panel_state'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'preedit_string'; signature: 'uss'; types: @pInterfaces[0]),
    (name: 'preedit_styling'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'preedit_cursor'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'commit_string'; signature: 'us'; types: @pInterfaces[0]),
    (name: 'cursor_position'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'delete_surrounding_text'; signature: 'iu'; types: @pInterfaces[0]),
    (name: 'keysym'; signature: 'uuuuu'; types: @pInterfaces[0]),
    (name: 'language'; signature: 'us'; types: @pInterfaces[0]),
    (name: 'text_direction'; signature: 'uu'; types: @pInterfaces[0])
  );
  wp_text_input_manager_v1_requests: array[0..0] of Twl_message = (
    (name: 'create_text_input'; signature: 'n'; types: @pInterfaces[12])
  );

class procedure TWpTextInputV1.RegisterInterface;
begin
  if vwp_text_input_v1_registered then Exit;
  vwp_text_input_v1_registered := True;
  Pointer(vIntf_wp_text_input_v1_Listener.enter) := @wp_text_input_v1_enter_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.leave) := @wp_text_input_v1_leave_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.modifiers_map) := @wp_text_input_v1_modifiers_map_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.input_panel_state) := @wp_text_input_v1_input_panel_state_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.preedit_string) := @wp_text_input_v1_preedit_string_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.preedit_styling) := @wp_text_input_v1_preedit_styling_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.preedit_cursor) := @wp_text_input_v1_preedit_cursor_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.commit_string) := @wp_text_input_v1_commit_string_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.cursor_position) := @wp_text_input_v1_cursor_position_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.delete_surrounding_text) := @wp_text_input_v1_delete_surrounding_text_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.keysym) := @wp_text_input_v1_keysym_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.language) := @wp_text_input_v1_language_Intf;
  Pointer(vIntf_wp_text_input_v1_Listener.text_direction) := @wp_text_input_v1_text_direction_Intf;
  wp_text_input_v1_interface.name := PChar(WP_TEXT_INPUT_V1_INTERFACE_NAME);
  wp_text_input_v1_interface.version := 1;
  wp_text_input_v1_interface.method_count := 11;
  wp_text_input_v1_interface.methods := @wp_text_input_v1_requests;
  wp_text_input_v1_interface.event_count := 13;
  wp_text_input_v1_interface.events := @wp_text_input_v1_events;
end;

class procedure TWpTextInputManagerV1.RegisterInterface;
begin
  if vwp_text_input_manager_v1_registered then Exit;
  vwp_text_input_manager_v1_registered := True;
  wp_text_input_manager_v1_interface.name := PChar(WP_TEXT_INPUT_MANAGER_V1_INTERFACE_NAME);
  wp_text_input_manager_v1_interface.version := 1;
  wp_text_input_manager_v1_interface.method_count := 1;
  wp_text_input_manager_v1_interface.methods := @wp_text_input_manager_v1_requests;
  wp_text_input_manager_v1_interface.event_count := 0;
  wp_text_input_manager_v1_interface.events := nil;
end;


end.
