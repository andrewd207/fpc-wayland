unit text_input_unstable_v3_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_text_input_v3 = Pointer;
  Pwp_text_input_manager_v3 = Pointer;
const
  WP_TEXT_INPUT_V3_CHANGE_CAUSE_INPUT_METHOD = 0; // input method caused the change
  WP_TEXT_INPUT_V3_CHANGE_CAUSE_OTHER = 1; // something else than the input method caused the change
  WP_TEXT_INPUT_V3_CONTENT_HINT_NONE = $0; // no special behavior
  WP_TEXT_INPUT_V3_CONTENT_HINT_COMPLETION = $1; // suggest word completions
  WP_TEXT_INPUT_V3_CONTENT_HINT_SPELLCHECK = $2; // suggest word corrections
  WP_TEXT_INPUT_V3_CONTENT_HINT_AUTO_CAPITALIZATION = $4; // switch to uppercase letters at the start of a sentence
  WP_TEXT_INPUT_V3_CONTENT_HINT_LOWERCASE = $8; // prefer lowercase letters
  WP_TEXT_INPUT_V3_CONTENT_HINT_UPPERCASE = $10; // prefer uppercase letters
  WP_TEXT_INPUT_V3_CONTENT_HINT_TITLECASE = $20; // prefer casing for titles and headings (can be language dependent)
  WP_TEXT_INPUT_V3_CONTENT_HINT_HIDDEN_TEXT = $40; // characters should be hidden
  WP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA = $80; // typed text should not be stored
  WP_TEXT_INPUT_V3_CONTENT_HINT_LATIN = $100; // just Latin characters should be entered
  WP_TEXT_INPUT_V3_CONTENT_HINT_MULTILINE = $200; // the text input is multiline
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_NORMAL = 0; // default input, allowing all characters
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_ALPHA = 1; // allow only alphabetic characters
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_DIGITS = 2; // allow only digits
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_NUMBER = 3; // input a number (including decimal separator and sign)
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_PHONE = 4; // input a phone number
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_URL = 5; // input an URL
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_EMAIL = 6; // input an email address
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_NAME = 7; // input a name of a person
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_PASSWORD = 8; // input a password (combine with sensitive_data hint)
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_PIN = 9; // input is a numeric password (combine with sensitive_data hint)
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_DATE = 10; // input a date
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_TIME = 11; // input a time
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_DATETIME = 12; // input a date and time
  WP_TEXT_INPUT_V3_CONTENT_PURPOSE_TERMINAL = 13; // input for a terminal

type
  Pwp_text_input_v3_listener = ^Twp_text_input_v3_listener;
  Twp_text_input_v3_listener = record
    enter : procedure(data: Pointer; AWpTextInputV3: Pwp_text_input_v3; ASurface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; AWpTextInputV3: Pwp_text_input_v3; ASurface: Pwl_surface); cdecl;
    preedit_string : procedure(data: Pointer; AWpTextInputV3: Pwp_text_input_v3; AText: Pchar; ACursorBegin: LongInt; ACursorEnd: LongInt); cdecl;
    commit_string : procedure(data: Pointer; AWpTextInputV3: Pwp_text_input_v3; AText: Pchar); cdecl;
    delete_surrounding_text : procedure(data: Pointer; AWpTextInputV3: Pwp_text_input_v3; ABeforeLength: DWord; AAfterLength: DWord); cdecl;
    done : procedure(data: Pointer; AWpTextInputV3: Pwp_text_input_v3; ASerial: DWord); cdecl;
  end;

  Pwp_text_input_manager_v3_listener = ^Twp_text_input_manager_v3_listener;
  Twp_text_input_manager_v3_listener = record
  end;



  TWpTextInputV3 = class;
  TWpTextInputManagerV3 = class;


  IWpTextInputV3Listener = interface
  ['IWpTextInputV3Listener']
    procedure wp_text_input_v3_enter(AWpTextInputV3: TWpTextInputV3; ASurface: TWlSurface);
    procedure wp_text_input_v3_leave(AWpTextInputV3: TWpTextInputV3; ASurface: TWlSurface);
    procedure wp_text_input_v3_preedit_string(AWpTextInputV3: TWpTextInputV3; AText: String; ACursorBegin: LongInt; ACursorEnd: LongInt);
    procedure wp_text_input_v3_commit_string(AWpTextInputV3: TWpTextInputV3; AText: String);
    procedure wp_text_input_v3_delete_surrounding_text(AWpTextInputV3: TWpTextInputV3; ABeforeLength: DWord; AAfterLength: DWord);
    procedure wp_text_input_v3_done(AWpTextInputV3: TWpTextInputV3; ASerial: DWord);
  end;

  IWpTextInputManagerV3Listener = interface
  ['IWpTextInputManagerV3Listener']
  end;




  TWpTextInputV3 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
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
    function AddListener(AIntf: IWpTextInputV3Listener): LongInt;
  end;

  TWpTextInputManagerV3 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_TEXT_INPUT = 1;
  public
    destructor Destroy; override;
    function GetTextInput(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpTextInputV3}): TWpTextInputV3;
    function AddListener(AIntf: IWpTextInputManagerV3Listener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_text_input_v3_interface: Twl_interface;
  WP_TEXT_INPUT_V3_INTERFACE_NAME: String = 'zwp_text_input_v3';
  wp_text_input_manager_v3_interface: Twl_interface;
  WP_TEXT_INPUT_MANAGER_V3_INTERFACE_NAME: String = 'zwp_text_input_manager_v3';



implementation

var
  vIntf_wp_text_input_v3_Listener: Twp_text_input_v3_listener;
  vIntf_wp_text_input_manager_v3_Listener: Twp_text_input_manager_v3_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpTextInputV3.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpTextInputV3.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpTextInputV3.Enable;
begin
  wl_proxy_marshal(FProxy, _ENABLE);
end;

procedure TWpTextInputV3.Disable;
begin
  wl_proxy_marshal(FProxy, _DISABLE);
end;

procedure TWpTextInputV3.SetSurroundingText(AText: String; ACursor: LongInt; AAnchor: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_SURROUNDING_TEXT, PChar(AText), ACursor, AAnchor);
end;

procedure TWpTextInputV3.SetTextChangeCause(ACause: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TEXT_CHANGE_CAUSE, ACause);
end;

procedure TWpTextInputV3.SetContentType(AHint: DWord; APurpose: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONTENT_TYPE, AHint, APurpose);
end;

procedure TWpTextInputV3.SetCursorRectangle(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR_RECTANGLE, AX, AY, AWidth, AHeight);
end;

procedure TWpTextInputV3.Commit;
begin
  wl_proxy_marshal(FProxy, _COMMIT);
end;

function TWpTextInputV3.AddListener(AIntf: IWpTextInputV3Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_text_input_v3_Listener, @FUserDataRec);
end;
constructor TWpTextInputManagerV3.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpTextInputManagerV3.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTextInputManagerV3.GetTextInput(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpTextInputV3}): TWpTextInputV3;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TEXT_INPUT, @wp_text_input_v3_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpTextInputV3;
  Result := TWpTextInputV3(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpTextInputV3) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpTextInputV3]);
end;

function TWpTextInputManagerV3.AddListener(AIntf: IWpTextInputManagerV3Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_text_input_manager_v3_Listener, @FUserDataRec);
end;




procedure wp_text_input_v3_enter_Intf(AData: PWLUserData; Awp_text_input_v3: Pwp_text_input_v3; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v3_enter(TWpTextInputV3(AData^.PascalObject),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wp_text_input_v3_leave_Intf(AData: PWLUserData; Awp_text_input_v3: Pwp_text_input_v3; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v3_leave(TWpTextInputV3(AData^.PascalObject),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wp_text_input_v3_preedit_string_Intf(AData: PWLUserData; Awp_text_input_v3: Pwp_text_input_v3; AText: Pchar; ACursorBegin: LongInt; ACursorEnd: LongInt); cdecl;
var
  AIntf: IWpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v3_preedit_string(TWpTextInputV3(AData^.PascalObject), AText, ACursorBegin, ACursorEnd);
end;

procedure wp_text_input_v3_commit_string_Intf(AData: PWLUserData; Awp_text_input_v3: Pwp_text_input_v3; AText: Pchar); cdecl;
var
  AIntf: IWpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v3_commit_string(TWpTextInputV3(AData^.PascalObject), AText);
end;

procedure wp_text_input_v3_delete_surrounding_text_Intf(AData: PWLUserData; Awp_text_input_v3: Pwp_text_input_v3; ABeforeLength: DWord; AAfterLength: DWord); cdecl;
var
  AIntf: IWpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v3_delete_surrounding_text(TWpTextInputV3(AData^.PascalObject), ABeforeLength, AAfterLength);
end;

procedure wp_text_input_v3_done_Intf(AData: PWLUserData; Awp_text_input_v3: Pwp_text_input_v3; ASerial: DWord); cdecl;
var
  AIntf: IWpTextInputV3Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTextInputV3Listener(AData^.ListenerUserData);
  AIntf.wp_text_input_v3_done(TWpTextInputV3(AData^.PascalObject), ASerial);
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
    (@wp_text_input_v3_interface),
    (@wl_seat_interface)
  );

  wp_text_input_v3_requests: array[0..7] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'enable'; signature: ''; types: @pInterfaces[0]),
    (name: 'disable'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_surrounding_text'; signature: 'sii'; types: @pInterfaces[0]),
    (name: 'set_text_change_cause'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_content_type'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'set_cursor_rectangle'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'commit'; signature: ''; types: @pInterfaces[0])
  );
  wp_text_input_v3_events: array[0..5] of Twl_message = (
    (name: 'enter'; signature: 'o'; types: @pInterfaces[8]),
    (name: 'leave'; signature: 'o'; types: @pInterfaces[9]),
    (name: 'preedit_string'; signature: '?sii'; types: @pInterfaces[0]),
    (name: 'commit_string'; signature: '?s'; types: @pInterfaces[0]),
    (name: 'delete_surrounding_text'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'done'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_text_input_manager_v3_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_text_input'; signature: 'no'; types: @pInterfaces[10])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_wp_text_input_v3_Listener.enter) := @wp_text_input_v3_enter_Intf;
  Pointer(vIntf_wp_text_input_v3_Listener.leave) := @wp_text_input_v3_leave_Intf;
  Pointer(vIntf_wp_text_input_v3_Listener.preedit_string) := @wp_text_input_v3_preedit_string_Intf;
  Pointer(vIntf_wp_text_input_v3_Listener.commit_string) := @wp_text_input_v3_commit_string_Intf;
  Pointer(vIntf_wp_text_input_v3_Listener.delete_surrounding_text) := @wp_text_input_v3_delete_surrounding_text_Intf;
  Pointer(vIntf_wp_text_input_v3_Listener.done) := @wp_text_input_v3_done_Intf;


  wp_text_input_v3_interface.name := PChar(WP_TEXT_INPUT_V3_INTERFACE_NAME);
  wp_text_input_v3_interface.version := 1;
  wp_text_input_v3_interface.method_count := 8;
  wp_text_input_v3_interface.methods := @wp_text_input_v3_requests;
  wp_text_input_v3_interface.event_count := 6;
  wp_text_input_v3_interface.events := @wp_text_input_v3_events;

  wp_text_input_manager_v3_interface.name := PChar(WP_TEXT_INPUT_MANAGER_V3_INTERFACE_NAME);
  wp_text_input_manager_v3_interface.version := 1;
  wp_text_input_manager_v3_interface.method_count := 2;
  wp_text_input_manager_v3_interface.methods := @wp_text_input_manager_v3_requests;
  wp_text_input_manager_v3_interface.event_count := 0;
  wp_text_input_manager_v3_interface.events := nil;

end;

end.
