unit text_input_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_text_input_v1 = Pointer;
  Pzwp_text_input_manager_v1 = Pointer;
const
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_NONE = $0; // no special behaviour
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_DEFAULT = $7; // auto completion, correction and capitalization
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_PASSWORD = $c0; // hidden and sensitive text
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_AUTO_COMPLETION = $1; // suggest word completions
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_AUTO_CORRECTION = $2; // suggest word corrections
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_AUTO_CAPITALIZATION = $4; // switch to uppercase letters at the start of a sentence
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_LOWERCASE = $8; // prefer lowercase letters
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_UPPERCASE = $10; // prefer uppercase letters
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_TITLECASE = $20; // prefer casing for titles and headings (can be language dependent)
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_HIDDEN_TEXT = $40; // characters should be hidden
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_SENSITIVE_DATA = $80; // typed text should not be stored
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_LATIN = $100; // just latin characters should be entered
  ZWP_TEXT_INPUT_V1_CONTENT_HINT_MULTILINE = $200; // the text input is multiline
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_NORMAL = 0; // default input, allowing all characters
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_ALPHA = 1; // allow only alphabetic characters
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_DIGITS = 2; // allow only digits
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_NUMBER = 3; // input a number (including decimal separator and sign)
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_PHONE = 4; // input a phone number
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_URL = 5; // input an URL
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_EMAIL = 6; // input an email address
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_NAME = 7; // input a name of a person
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_PASSWORD = 8; // input a password (combine with password or sensitive_data hint)
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_DATE = 9; // input a date
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_TIME = 10; // input a time
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_DATETIME = 11; // input a date and time
  ZWP_TEXT_INPUT_V1_CONTENT_PURPOSE_TERMINAL = 12; // input for a terminal
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_DEFAULT = 0; // default style for composing text
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_NONE = 1; // style should be the same as in non-composing text
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_ACTIVE = 2;
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_INACTIVE = 3;
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_HIGHLIGHT = 4;
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_UNDERLINE = 5;
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_SELECTION = 6;
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_INCORRECT = 7;
  ZWP_TEXT_INPUT_V1_TEXT_DIRECTION_AUTO = 0; // automatic text direction based on text and language
  ZWP_TEXT_INPUT_V1_TEXT_DIRECTION_LTR = 1; // left-to-right
  ZWP_TEXT_INPUT_V1_TEXT_DIRECTION_RTL = 2; // right-to-left

type
  Pzwp_text_input_v1_listener = ^Tzwp_text_input_v1_listener;
  Tzwp_text_input_v1_listener = record
    enter : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; ASurface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1); cdecl;
    modifiers_map : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; AMap: Pwl_array); cdecl;
    input_panel_state : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; AState: DWord); cdecl;
    preedit_string : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; ASerial: DWord; AText: Pchar; ACommit: Pchar); cdecl;
    preedit_styling : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; AIndex: DWord; ALength: DWord; AStyle: DWord); cdecl;
    preedit_cursor : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; AIndex: LongInt); cdecl;
    commit_string : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; ASerial: DWord; AText: Pchar); cdecl;
    cursor_position : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; AIndex: LongInt; AAnchor: LongInt); cdecl;
    delete_surrounding_text : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; AIndex: LongInt; ALength: DWord); cdecl;
    keysym : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord); cdecl;
    language : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; ASerial: DWord; ALanguage: Pchar); cdecl;
    text_direction : procedure(data: Pointer; AZwpTextInputV1: Pzwp_text_input_v1; ASerial: DWord; ADirection: DWord); cdecl;
  end;

  Pzwp_text_input_manager_v1_listener = ^Tzwp_text_input_manager_v1_listener;
  Tzwp_text_input_manager_v1_listener = record
  end;



  TZwpTextInputV1 = class;
  TZwpTextInputManagerV1 = class;


  IZwpTextInputV1Listener = interface
  ['IZwpTextInputV1Listener']
    procedure zwp_text_input_v1_enter(AZwpTextInputV1: TZwpTextInputV1; ASurface: TWlSurface);
    procedure zwp_text_input_v1_leave(AZwpTextInputV1: TZwpTextInputV1);
    procedure zwp_text_input_v1_modifiers_map(AZwpTextInputV1: TZwpTextInputV1; AMap: Pwl_array);
    procedure zwp_text_input_v1_input_panel_state(AZwpTextInputV1: TZwpTextInputV1; AState: DWord);
    procedure zwp_text_input_v1_preedit_string(AZwpTextInputV1: TZwpTextInputV1; ASerial: DWord; AText: String; ACommit: String);
    procedure zwp_text_input_v1_preedit_styling(AZwpTextInputV1: TZwpTextInputV1; AIndex: DWord; ALength: DWord; AStyle: DWord);
    procedure zwp_text_input_v1_preedit_cursor(AZwpTextInputV1: TZwpTextInputV1; AIndex: LongInt);
    procedure zwp_text_input_v1_commit_string(AZwpTextInputV1: TZwpTextInputV1; ASerial: DWord; AText: String);
    procedure zwp_text_input_v1_cursor_position(AZwpTextInputV1: TZwpTextInputV1; AIndex: LongInt; AAnchor: LongInt);
    procedure zwp_text_input_v1_delete_surrounding_text(AZwpTextInputV1: TZwpTextInputV1; AIndex: LongInt; ALength: DWord);
    procedure zwp_text_input_v1_keysym(AZwpTextInputV1: TZwpTextInputV1; ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord);
    procedure zwp_text_input_v1_language(AZwpTextInputV1: TZwpTextInputV1; ASerial: DWord; ALanguage: String);
    procedure zwp_text_input_v1_text_direction(AZwpTextInputV1: TZwpTextInputV1; ASerial: DWord; ADirection: DWord);
  end;

  IZwpTextInputManagerV1Listener = interface
  ['IZwpTextInputManagerV1Listener']
  end;




  TZwpTextInputV1 = class(TWLProxyObject)
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
    function AddListener(AIntf: IZwpTextInputV1Listener): LongInt;
  end;

  TZwpTextInputManagerV1 = class(TWLProxyObject)
  private
    const _CREATE_TEXT_INPUT = 0;
  public
    function CreateTextInput(AProxyClass: TWLProxyObjectClass = nil {TZwpTextInputV1}): TZwpTextInputV1;
    function AddListener(AIntf: IZwpTextInputManagerV1Listener): LongInt;
  end;






var
  zwp_text_input_v1_interface: Twl_interface;
  zwp_text_input_manager_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_text_input_v1_Listener: Tzwp_text_input_v1_listener;
  vIntf_zwp_text_input_manager_v1_Listener: Tzwp_text_input_manager_v1_listener;



procedure TZwpTextInputV1.Activate(ASeat: TWlSeat; ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _ACTIVATE, ASeat.Proxy, ASurface.Proxy);
end;

procedure TZwpTextInputV1.Deactivate(ASeat: TWlSeat);
begin
  wl_proxy_marshal(FProxy, _DEACTIVATE, ASeat.Proxy);
end;

procedure TZwpTextInputV1.ShowInputPanel;
begin
  wl_proxy_marshal(FProxy, _SHOW_INPUT_PANEL);
end;

procedure TZwpTextInputV1.HideInputPanel;
begin
  wl_proxy_marshal(FProxy, _HIDE_INPUT_PANEL);
end;

procedure TZwpTextInputV1.Reset;
begin
  wl_proxy_marshal(FProxy, _RESET);
end;

procedure TZwpTextInputV1.SetSurroundingText(AText: String; ACursor: DWord; AAnchor: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_SURROUNDING_TEXT, PChar(AText), ACursor, AAnchor);
end;

procedure TZwpTextInputV1.SetContentType(AHint: DWord; APurpose: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONTENT_TYPE, AHint, APurpose);
end;

procedure TZwpTextInputV1.SetCursorRectangle(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR_RECTANGLE, AX, AY, AWidth, AHeight);
end;

procedure TZwpTextInputV1.SetPreferredLanguage(ALanguage: String);
begin
  wl_proxy_marshal(FProxy, _SET_PREFERRED_LANGUAGE, PChar(ALanguage));
end;

procedure TZwpTextInputV1.CommitState(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _COMMIT_STATE, ASerial);
end;

procedure TZwpTextInputV1.InvokeAction(AButton: DWord; AIndex: DWord);
begin
  wl_proxy_marshal(FProxy, _INVOKE_ACTION, AButton, AIndex);
end;

function TZwpTextInputV1.AddListener(AIntf: IZwpTextInputV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_text_input_v1_Listener, @FUserDataRec);
end;
function TZwpTextInputManagerV1.CreateTextInput(AProxyClass: TWLProxyObjectClass = nil {TZwpTextInputV1}): TZwpTextInputV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_TEXT_INPUT, @zwp_text_input_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TZwpTextInputV1;
  Result := TZwpTextInputV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpTextInputV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpTextInputV1]);
end;

function TZwpTextInputManagerV1.AddListener(AIntf: IZwpTextInputManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_text_input_manager_v1_Listener, @FUserDataRec);
end;




procedure zwp_text_input_v1_enter_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; ASurface: Pwl_surface); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_enter(TZwpTextInputV1(AData^.PascalObject),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure zwp_text_input_v1_leave_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_leave(TZwpTextInputV1(AData^.PascalObject));
end;

procedure zwp_text_input_v1_modifiers_map_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; AMap: Pwl_array); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_modifiers_map(TZwpTextInputV1(AData^.PascalObject), AMap);
end;

procedure zwp_text_input_v1_input_panel_state_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; AState: DWord); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_input_panel_state(TZwpTextInputV1(AData^.PascalObject), AState);
end;

procedure zwp_text_input_v1_preedit_string_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; ASerial: DWord; AText: Pchar; ACommit: Pchar); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_preedit_string(TZwpTextInputV1(AData^.PascalObject), ASerial, AText, ACommit);
end;

procedure zwp_text_input_v1_preedit_styling_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; AIndex: DWord; ALength: DWord; AStyle: DWord); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_preedit_styling(TZwpTextInputV1(AData^.PascalObject), AIndex, ALength, AStyle);
end;

procedure zwp_text_input_v1_preedit_cursor_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; AIndex: LongInt); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_preedit_cursor(TZwpTextInputV1(AData^.PascalObject), AIndex);
end;

procedure zwp_text_input_v1_commit_string_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; ASerial: DWord; AText: Pchar); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_commit_string(TZwpTextInputV1(AData^.PascalObject), ASerial, AText);
end;

procedure zwp_text_input_v1_cursor_position_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; AIndex: LongInt; AAnchor: LongInt); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_cursor_position(TZwpTextInputV1(AData^.PascalObject), AIndex, AAnchor);
end;

procedure zwp_text_input_v1_delete_surrounding_text_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; AIndex: LongInt; ALength: DWord); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_delete_surrounding_text(TZwpTextInputV1(AData^.PascalObject), AIndex, ALength);
end;

procedure zwp_text_input_v1_keysym_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; ASerial: DWord; ATime: DWord; ASym: DWord; AState: DWord; AModifiers: DWord); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_keysym(TZwpTextInputV1(AData^.PascalObject), ASerial, ATime, ASym, AState, AModifiers);
end;

procedure zwp_text_input_v1_language_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; ASerial: DWord; ALanguage: Pchar); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_language(TZwpTextInputV1(AData^.PascalObject), ASerial, ALanguage);
end;

procedure zwp_text_input_v1_text_direction_Intf(AData: PWLUserData; Azwp_text_input_v1: Pzwp_text_input_v1; ASerial: DWord; ADirection: DWord); cdecl;
var
  AIntf: IZwpTextInputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV1Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v1_text_direction(TZwpTextInputV1(AData^.PascalObject), ASerial, ADirection);
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
    (@zwp_text_input_v1_interface)
  );

  zwp_text_input_v1_requests: array[0..10] of Twl_message = (
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
  zwp_text_input_v1_events: array[0..12] of Twl_message = (
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
  zwp_text_input_manager_v1_requests: array[0..0] of Twl_message = (
    (name: 'create_text_input'; signature: 'n'; types: @pInterfaces[12])
  );

initialization
  Pointer(vIntf_zwp_text_input_v1_Listener.enter) := @zwp_text_input_v1_enter_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.leave) := @zwp_text_input_v1_leave_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.modifiers_map) := @zwp_text_input_v1_modifiers_map_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.input_panel_state) := @zwp_text_input_v1_input_panel_state_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.preedit_string) := @zwp_text_input_v1_preedit_string_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.preedit_styling) := @zwp_text_input_v1_preedit_styling_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.preedit_cursor) := @zwp_text_input_v1_preedit_cursor_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.commit_string) := @zwp_text_input_v1_commit_string_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.cursor_position) := @zwp_text_input_v1_cursor_position_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.delete_surrounding_text) := @zwp_text_input_v1_delete_surrounding_text_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.keysym) := @zwp_text_input_v1_keysym_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.language) := @zwp_text_input_v1_language_Intf;
  Pointer(vIntf_zwp_text_input_v1_Listener.text_direction) := @zwp_text_input_v1_text_direction_Intf;


  zwp_text_input_v1_interface.name := 'zwp_text_input_v1';
  zwp_text_input_v1_interface.version := 1;
  zwp_text_input_v1_interface.method_count := 11;
  zwp_text_input_v1_interface.methods := @zwp_text_input_v1_requests;
  zwp_text_input_v1_interface.event_count := 13;
  zwp_text_input_v1_interface.events := @zwp_text_input_v1_events;

  zwp_text_input_manager_v1_interface.name := 'zwp_text_input_manager_v1';
  zwp_text_input_manager_v1_interface.version := 1;
  zwp_text_input_manager_v1_interface.method_count := 1;
  zwp_text_input_manager_v1_interface.methods := @zwp_text_input_manager_v1_requests;
  zwp_text_input_manager_v1_interface.event_count := 0;
  zwp_text_input_manager_v1_interface.events := nil;

end.
