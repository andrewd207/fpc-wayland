unit text_input_unstable_v3_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_text_input_v3 = Pointer;
  Pzwp_text_input_manager_v3 = Pointer;
const
  ZWP_TEXT_INPUT_V3_CHANGE_CAUSE_INPUT_METHOD = 0; // input method caused the change
  ZWP_TEXT_INPUT_V3_CHANGE_CAUSE_OTHER = 1; // something else than the input method caused the change
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_NONE = $0; // no special behavior
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_COMPLETION = $1; // suggest word completions
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_SPELLCHECK = $2; // suggest word corrections
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_AUTO_CAPITALIZATION = $4; // switch to uppercase letters at the start of a sentence
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_LOWERCASE = $8; // prefer lowercase letters
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_UPPERCASE = $10; // prefer uppercase letters
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_TITLECASE = $20; // prefer casing for titles and headings (can be language dependent)
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_HIDDEN_TEXT = $40; // characters should be hidden
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA = $80; // typed text should not be stored
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_LATIN = $100; // just Latin characters should be entered
  ZWP_TEXT_INPUT_V3_CONTENT_HINT_MULTILINE = $200; // the text input is multiline
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NORMAL = 0; // default input, allowing all characters
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_ALPHA = 1; // allow only alphabetic characters
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_DIGITS = 2; // allow only digits
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NUMBER = 3; // input a number (including decimal separator and sign)
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PHONE = 4; // input a phone number
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_URL = 5; // input an URL
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_EMAIL = 6; // input an email address
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NAME = 7; // input a name of a person
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PASSWORD = 8; // input a password (combine with sensitive_data hint)
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PIN = 9; // input is a numeric password (combine with sensitive_data hint)
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_DATE = 10; // input a date
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_TIME = 11; // input a time
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_DATETIME = 12; // input a date and time
  ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_TERMINAL = 13; // input for a terminal

type
  Pzwp_text_input_v3_listener = ^Tzwp_text_input_v3_listener;
  Tzwp_text_input_v3_listener = record
    enter : procedure(data: Pointer; AZwpTextInputV3: Pzwp_text_input_v3; ASurface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; AZwpTextInputV3: Pzwp_text_input_v3; ASurface: Pwl_surface); cdecl;
    preedit_string : procedure(data: Pointer; AZwpTextInputV3: Pzwp_text_input_v3; AText: Pchar; ACursorBegin: LongInt; ACursorEnd: LongInt); cdecl;
    commit_string : procedure(data: Pointer; AZwpTextInputV3: Pzwp_text_input_v3; AText: Pchar); cdecl;
    delete_surrounding_text : procedure(data: Pointer; AZwpTextInputV3: Pzwp_text_input_v3; ABeforeLength: DWord; AAfterLength: DWord); cdecl;
    done : procedure(data: Pointer; AZwpTextInputV3: Pzwp_text_input_v3; ASerial: DWord); cdecl;
  end;

  Pzwp_text_input_manager_v3_listener = ^Tzwp_text_input_manager_v3_listener;
  Tzwp_text_input_manager_v3_listener = record
  end;



  TZwpTextInputV3 = class;
  TZwpTextInputManagerV3 = class;


  IZwpTextInputV3Listener = interface
  ['IZwpTextInputV3Listener']
    procedure zwp_text_input_v3_enter(AZwpTextInputV3: TZwpTextInputV3; ASurface: TWlSurface);
    procedure zwp_text_input_v3_leave(AZwpTextInputV3: TZwpTextInputV3; ASurface: TWlSurface);
    procedure zwp_text_input_v3_preedit_string(AZwpTextInputV3: TZwpTextInputV3; AText: String; ACursorBegin: LongInt; ACursorEnd: LongInt);
    procedure zwp_text_input_v3_commit_string(AZwpTextInputV3: TZwpTextInputV3; AText: String);
    procedure zwp_text_input_v3_delete_surrounding_text(AZwpTextInputV3: TZwpTextInputV3; ABeforeLength: DWord; AAfterLength: DWord);
    procedure zwp_text_input_v3_done(AZwpTextInputV3: TZwpTextInputV3; ASerial: DWord);
  end;

  IZwpTextInputManagerV3Listener = interface
  ['IZwpTextInputManagerV3Listener']
  end;




  TZwpTextInputV3 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _ENABLE = 1;
    const _DISABLE = 2;
    const _SET_SURROUNDING_TEXT = 3;
    const _SET_TEXT_CHANGE_CAUSE = 4;
    const _SET_CONTENT_TYPE = 5;
    const _SET_CURSOR_RECTANGLE = 6;
    const _COMMIT = 7;
  public
    destructor Destroy; override;
    procedure Enable;
    procedure Disable;
    procedure SetSurroundingText(AText: String; ACursor: LongInt; AAnchor: LongInt);
    procedure SetTextChangeCause(ACause: DWord);
    procedure SetContentType(AHint: DWord; APurpose: DWord);
    procedure SetCursorRectangle(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure Commit;
    function AddListener(AIntf: IZwpTextInputV3Listener): LongInt;
  end;

  TZwpTextInputManagerV3 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_TEXT_INPUT = 1;
  public
    destructor Destroy; override;
    function GetTextInput(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpTextInputV3}): TZwpTextInputV3;
    function AddListener(AIntf: IZwpTextInputManagerV3Listener): LongInt;
  end;






var
  zwp_text_input_v3_interface: Twl_interface;
  zwp_text_input_manager_v3_interface: Twl_interface;



implementation

var
  vIntf_zwp_text_input_v3_Listener: Tzwp_text_input_v3_listener;
  vIntf_zwp_text_input_manager_v3_Listener: Tzwp_text_input_manager_v3_listener;



destructor TZwpTextInputV3.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZwpTextInputV3.Enable;
begin
  wl_proxy_marshal(FProxy, _ENABLE);
end;

procedure TZwpTextInputV3.Disable;
begin
  wl_proxy_marshal(FProxy, _DISABLE);
end;

procedure TZwpTextInputV3.SetSurroundingText(AText: String; ACursor: LongInt; AAnchor: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_SURROUNDING_TEXT, PChar(AText), ACursor, AAnchor);
end;

procedure TZwpTextInputV3.SetTextChangeCause(ACause: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TEXT_CHANGE_CAUSE, ACause);
end;

procedure TZwpTextInputV3.SetContentType(AHint: DWord; APurpose: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONTENT_TYPE, AHint, APurpose);
end;

procedure TZwpTextInputV3.SetCursorRectangle(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR_RECTANGLE, AX, AY, AWidth, AHeight);
end;

procedure TZwpTextInputV3.Commit;
begin
  wl_proxy_marshal(FProxy, _COMMIT);
end;

function TZwpTextInputV3.AddListener(AIntf: IZwpTextInputV3Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_text_input_v3_Listener, @FUserDataRec);
end;
destructor TZwpTextInputManagerV3.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTextInputManagerV3.GetTextInput(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpTextInputV3}): TZwpTextInputV3;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TEXT_INPUT, @zwp_text_input_v3_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpTextInputV3;
  Result := TZwpTextInputV3(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpTextInputV3) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpTextInputV3]);
end;

function TZwpTextInputManagerV3.AddListener(AIntf: IZwpTextInputManagerV3Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_text_input_manager_v3_Listener, @FUserDataRec);
end;




procedure zwp_text_input_v3_enter_Intf(AData: PWLUserData; Azwp_text_input_v3: Pzwp_text_input_v3; ASurface: Pwl_surface); cdecl;
var
  AIntf: IZwpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v3_enter(TZwpTextInputV3(AData^.PascalObject),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure zwp_text_input_v3_leave_Intf(AData: PWLUserData; Azwp_text_input_v3: Pzwp_text_input_v3; ASurface: Pwl_surface); cdecl;
var
  AIntf: IZwpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v3_leave(TZwpTextInputV3(AData^.PascalObject),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure zwp_text_input_v3_preedit_string_Intf(AData: PWLUserData; Azwp_text_input_v3: Pzwp_text_input_v3; AText: Pchar; ACursorBegin: LongInt; ACursorEnd: LongInt); cdecl;
var
  AIntf: IZwpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v3_preedit_string(TZwpTextInputV3(AData^.PascalObject), AText, ACursorBegin, ACursorEnd);
end;

procedure zwp_text_input_v3_commit_string_Intf(AData: PWLUserData; Azwp_text_input_v3: Pzwp_text_input_v3; AText: Pchar); cdecl;
var
  AIntf: IZwpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v3_commit_string(TZwpTextInputV3(AData^.PascalObject), AText);
end;

procedure zwp_text_input_v3_delete_surrounding_text_Intf(AData: PWLUserData; Azwp_text_input_v3: Pzwp_text_input_v3; ABeforeLength: DWord; AAfterLength: DWord); cdecl;
var
  AIntf: IZwpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v3_delete_surrounding_text(TZwpTextInputV3(AData^.PascalObject), ABeforeLength, AAfterLength);
end;

procedure zwp_text_input_v3_done_Intf(AData: PWLUserData; Azwp_text_input_v3: Pzwp_text_input_v3; ASerial: DWord); cdecl;
var
  AIntf: IZwpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.zwp_text_input_v3_done(TZwpTextInputV3(AData^.PascalObject), ASerial);
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
    (@wl_surface_interface),
    (@wl_surface_interface),
    (@zwp_text_input_v3_interface),
    (@wl_seat_interface)
  );

  zwp_text_input_v3_requests: array[0..7] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'enable'; signature: ''; types: @pInterfaces[0]),
    (name: 'disable'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_surrounding_text'; signature: 'sii'; types: @pInterfaces[0]),
    (name: 'set_text_change_cause'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_content_type'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'set_cursor_rectangle'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'commit'; signature: ''; types: @pInterfaces[0])
  );
  zwp_text_input_v3_events: array[0..5] of Twl_message = (
    (name: 'enter'; signature: 'o'; types: @pInterfaces[8]),
    (name: 'leave'; signature: 'o'; types: @pInterfaces[9]),
    (name: 'preedit_string'; signature: '?sii'; types: @pInterfaces[0]),
    (name: 'commit_string'; signature: '?s'; types: @pInterfaces[0]),
    (name: 'delete_surrounding_text'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'done'; signature: 'u'; types: @pInterfaces[0])
  );
  zwp_text_input_manager_v3_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_text_input'; signature: 'no'; types: @pInterfaces[10])
  );

initialization
  Pointer(vIntf_zwp_text_input_v3_Listener.enter) := @zwp_text_input_v3_enter_Intf;
  Pointer(vIntf_zwp_text_input_v3_Listener.leave) := @zwp_text_input_v3_leave_Intf;
  Pointer(vIntf_zwp_text_input_v3_Listener.preedit_string) := @zwp_text_input_v3_preedit_string_Intf;
  Pointer(vIntf_zwp_text_input_v3_Listener.commit_string) := @zwp_text_input_v3_commit_string_Intf;
  Pointer(vIntf_zwp_text_input_v3_Listener.delete_surrounding_text) := @zwp_text_input_v3_delete_surrounding_text_Intf;
  Pointer(vIntf_zwp_text_input_v3_Listener.done) := @zwp_text_input_v3_done_Intf;


  zwp_text_input_v3_interface.name := 'zwp_text_input_v3';
  zwp_text_input_v3_interface.version := 1;
  zwp_text_input_v3_interface.method_count := 8;
  zwp_text_input_v3_interface.methods := @zwp_text_input_v3_requests;
  zwp_text_input_v3_interface.event_count := 6;
  zwp_text_input_v3_interface.events := @zwp_text_input_v3_events;

  zwp_text_input_manager_v3_interface.name := 'zwp_text_input_manager_v3';
  zwp_text_input_manager_v3_interface.version := 1;
  zwp_text_input_manager_v3_interface.method_count := 2;
  zwp_text_input_manager_v3_interface.methods := @zwp_text_input_manager_v3_requests;
  zwp_text_input_manager_v3_interface.event_count := 0;
  zwp_text_input_manager_v3_interface.events := nil;

end.
