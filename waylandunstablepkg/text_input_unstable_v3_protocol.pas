unit text_input_unstable_v3_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_text_input_v3 = ^Tzwp_text_input_v3;
  Tzwp_text_input_v3 = record end;
  Pzwp_text_input_manager_v3 = ^Tzwp_text_input_manager_v3;
  Tzwp_text_input_manager_v3 = record end;
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
    enter : procedure(data: Pointer; zwp_text_input_v3: Pzwp_text_input_v3; surface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; zwp_text_input_v3: Pzwp_text_input_v3; surface: Pwl_surface); cdecl;
    preedit_string : procedure(data: Pointer; zwp_text_input_v3: Pzwp_text_input_v3; text: pchar; cursor_begin: cint; cursor_end: cint); cdecl;
    commit_string : procedure(data: Pointer; zwp_text_input_v3: Pzwp_text_input_v3; text: pchar); cdecl;
    delete_surrounding_text : procedure(data: Pointer; zwp_text_input_v3: Pzwp_text_input_v3; before_length: cuint; after_length: cuint); cdecl;
    done : procedure(data: Pointer; zwp_text_input_v3: Pzwp_text_input_v3; serial: cuint); cdecl;
  end;

  Pzwp_text_input_manager_v3_listener = ^Tzwp_text_input_manager_v3_listener;
  Tzwp_text_input_manager_v3_listener = record
  end;



  Izwp_text_input_v3Listener = interface
  ['Izwp_text_input_v3Listener']
    procedure zwp_text_input_v3_enter(zwp_text_input_v3: Pzwp_text_input_v3; surface: Pwl_surface);
    procedure zwp_text_input_v3_leave(zwp_text_input_v3: Pzwp_text_input_v3; surface: Pwl_surface);
    procedure zwp_text_input_v3_preedit_string(zwp_text_input_v3: Pzwp_text_input_v3; text: pchar; cursor_begin: cint; cursor_end: cint);
    procedure zwp_text_input_v3_commit_string(zwp_text_input_v3: Pzwp_text_input_v3; text: pchar);
    procedure zwp_text_input_v3_delete_surrounding_text(zwp_text_input_v3: Pzwp_text_input_v3; before_length: cuint; after_length: cuint);
    procedure zwp_text_input_v3_done(zwp_text_input_v3: Pzwp_text_input_v3; serial: cuint);
  end;

  Izwp_text_input_manager_v3Listener = interface
  ['Izwp_text_input_manager_v3Listener']
  end;



procedure zwp_text_input_v3_destroy(zwp_text_input_v3: Pzwp_text_input_v3);
procedure zwp_text_input_v3_enable(zwp_text_input_v3: Pzwp_text_input_v3);
procedure zwp_text_input_v3_disable(zwp_text_input_v3: Pzwp_text_input_v3);
procedure zwp_text_input_v3_set_surrounding_text(zwp_text_input_v3: Pzwp_text_input_v3; text: pchar; cursor: cint; anchor: cint);
procedure zwp_text_input_v3_set_text_change_cause(zwp_text_input_v3: Pzwp_text_input_v3; cause: cuint);
procedure zwp_text_input_v3_set_content_type(zwp_text_input_v3: Pzwp_text_input_v3; hint: cuint; purpose: cuint);
procedure zwp_text_input_v3_set_cursor_rectangle(zwp_text_input_v3: Pzwp_text_input_v3; x: cint; y: cint; width: cint; height: cint);
procedure zwp_text_input_v3_commit(zwp_text_input_v3: Pzwp_text_input_v3);
function  zwp_text_input_v3_add_listener(zwp_text_input_v3: Pzwp_text_input_v3; listener: Pzwp_text_input_v3_listener; data: Pointer): cint;
procedure  zwp_text_input_v3_add_listener(zwp_text_input_v3: Pzwp_text_input_v3; AIntf: Izwp_text_input_v3Listener);
procedure zwp_text_input_v3_set_user_data(zwp_text_input_v3: Pzwp_text_input_v3; user_data: Pointer);
function  zwp_text_input_v3_get_user_data(zwp_text_input_v3: Pzwp_text_input_v3): Pointer;
function  zwp_text_input_v3_get_version(zwp_text_input_v3: Pzwp_text_input_v3): cuint32;
procedure zwp_text_input_manager_v3_destroy(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3);
function  zwp_text_input_manager_v3_get_text_input(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; seat: Pwl_seat): Pzwp_text_input_v3;
function  zwp_text_input_manager_v3_add_listener(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; listener: Pzwp_text_input_manager_v3_listener; data: Pointer): cint;
procedure  zwp_text_input_manager_v3_add_listener(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; AIntf: Izwp_text_input_manager_v3Listener);
procedure zwp_text_input_manager_v3_set_user_data(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; user_data: Pointer);
function  zwp_text_input_manager_v3_get_user_data(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3): Pointer;
function  zwp_text_input_manager_v3_get_version(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3): cuint32;



var
  zwp_text_input_v3_interface: Twl_interface;
  zwp_text_input_manager_v3_interface: Twl_interface;



implementation

const
_ZWP_TEXT_INPUT_V3_DESTROY = 0;
_ZWP_TEXT_INPUT_V3_ENABLE = 1;
_ZWP_TEXT_INPUT_V3_DISABLE = 2;
_ZWP_TEXT_INPUT_V3_SET_SURROUNDING_TEXT = 3;
_ZWP_TEXT_INPUT_V3_SET_TEXT_CHANGE_CAUSE = 4;
_ZWP_TEXT_INPUT_V3_SET_CONTENT_TYPE = 5;
_ZWP_TEXT_INPUT_V3_SET_CURSOR_RECTANGLE = 6;
_ZWP_TEXT_INPUT_V3_COMMIT = 7;
_ZWP_TEXT_INPUT_MANAGER_V3_DESTROY = 0;
_ZWP_TEXT_INPUT_MANAGER_V3_GET_TEXT_INPUT = 1;


var
  vIntf_zwp_text_input_v3_Listener: Tzwp_text_input_v3_listener;
  vIntf_zwp_text_input_manager_v3_Listener: Tzwp_text_input_manager_v3_listener;



procedure zwp_text_input_v3_destroy(zwp_text_input_v3: Pzwp_text_input_v3);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3), _ZWP_TEXT_INPUT_V3_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_text_input_v3));
end;

procedure zwp_text_input_v3_enable(zwp_text_input_v3: Pzwp_text_input_v3);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3),
      _ZWP_TEXT_INPUT_V3_ENABLE);
end;

procedure zwp_text_input_v3_disable(zwp_text_input_v3: Pzwp_text_input_v3);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3),
      _ZWP_TEXT_INPUT_V3_DISABLE);
end;

procedure zwp_text_input_v3_set_surrounding_text(zwp_text_input_v3: Pzwp_text_input_v3; text: pchar; cursor: cint; anchor: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3),
      _ZWP_TEXT_INPUT_V3_SET_SURROUNDING_TEXT, text, cursor, anchor);
end;

procedure zwp_text_input_v3_set_text_change_cause(zwp_text_input_v3: Pzwp_text_input_v3; cause: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3),
      _ZWP_TEXT_INPUT_V3_SET_TEXT_CHANGE_CAUSE, cause);
end;

procedure zwp_text_input_v3_set_content_type(zwp_text_input_v3: Pzwp_text_input_v3; hint: cuint; purpose: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3),
      _ZWP_TEXT_INPUT_V3_SET_CONTENT_TYPE, hint, purpose);
end;

procedure zwp_text_input_v3_set_cursor_rectangle(zwp_text_input_v3: Pzwp_text_input_v3; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3),
      _ZWP_TEXT_INPUT_V3_SET_CURSOR_RECTANGLE, x, y, width, height);
end;

procedure zwp_text_input_v3_commit(zwp_text_input_v3: Pzwp_text_input_v3);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v3),
      _ZWP_TEXT_INPUT_V3_COMMIT);
end;

function  zwp_text_input_v3_add_listener(zwp_text_input_v3: Pzwp_text_input_v3; listener: Pzwp_text_input_v3_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_text_input_v3), listener, data);
end;

procedure  zwp_text_input_v3_add_listener(zwp_text_input_v3: Pzwp_text_input_v3; AIntf: Izwp_text_input_v3Listener);
begin
  zwp_text_input_v3_add_listener(zwp_text_input_v3, @vIntf_zwp_text_input_v3_Listener, AIntf);
end;

procedure zwp_text_input_v3_set_user_data(zwp_text_input_v3: Pzwp_text_input_v3; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_text_input_v3), user_data);
end;

function  zwp_text_input_v3_get_user_data(zwp_text_input_v3: Pzwp_text_input_v3): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_text_input_v3));
end;

function  zwp_text_input_v3_get_version(zwp_text_input_v3: Pzwp_text_input_v3): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_text_input_v3));
end;

procedure zwp_text_input_manager_v3_destroy(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_manager_v3), _ZWP_TEXT_INPUT_MANAGER_V3_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_text_input_manager_v3));
end;

function  zwp_text_input_manager_v3_get_text_input(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; seat: Pwl_seat): Pzwp_text_input_v3;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_text_input_manager_v3),
      _ZWP_TEXT_INPUT_MANAGER_V3_GET_TEXT_INPUT, @zwp_text_input_v3_interface, nil, seat);
  Result := Pzwp_text_input_v3(id);
end;

function  zwp_text_input_manager_v3_add_listener(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; listener: Pzwp_text_input_manager_v3_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_text_input_manager_v3), listener, data);
end;

procedure  zwp_text_input_manager_v3_add_listener(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; AIntf: Izwp_text_input_manager_v3Listener);
begin
  zwp_text_input_manager_v3_add_listener(zwp_text_input_manager_v3, @vIntf_zwp_text_input_manager_v3_Listener, AIntf);
end;

procedure zwp_text_input_manager_v3_set_user_data(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_text_input_manager_v3), user_data);
end;

function  zwp_text_input_manager_v3_get_user_data(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_text_input_manager_v3));
end;

function  zwp_text_input_manager_v3_get_version(zwp_text_input_manager_v3: Pzwp_text_input_manager_v3): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_text_input_manager_v3));
end;


procedure zwp_text_input_v3_enter_Intf(AIntf: Izwp_text_input_v3Listener; zwp_text_input_v3: Pzwp_text_input_v3; surface: Pwl_surface); cdecl;
begin
  WriteLn('zwp_text_input_v3.enter');
  AIntf.zwp_text_input_v3_enter(zwp_text_input_v3, surface);
end;

procedure zwp_text_input_v3_leave_Intf(AIntf: Izwp_text_input_v3Listener; zwp_text_input_v3: Pzwp_text_input_v3; surface: Pwl_surface); cdecl;
begin
  WriteLn('zwp_text_input_v3.leave');
  AIntf.zwp_text_input_v3_leave(zwp_text_input_v3, surface);
end;

procedure zwp_text_input_v3_preedit_string_Intf(AIntf: Izwp_text_input_v3Listener; zwp_text_input_v3: Pzwp_text_input_v3; text: pchar; cursor_begin: cint; cursor_end: cint); cdecl;
begin
  WriteLn('zwp_text_input_v3.preedit_string');
  AIntf.zwp_text_input_v3_preedit_string(zwp_text_input_v3, text, cursor_begin, cursor_end);
end;

procedure zwp_text_input_v3_commit_string_Intf(AIntf: Izwp_text_input_v3Listener; zwp_text_input_v3: Pzwp_text_input_v3; text: pchar); cdecl;
begin
  WriteLn('zwp_text_input_v3.commit_string');
  AIntf.zwp_text_input_v3_commit_string(zwp_text_input_v3, text);
end;

procedure zwp_text_input_v3_delete_surrounding_text_Intf(AIntf: Izwp_text_input_v3Listener; zwp_text_input_v3: Pzwp_text_input_v3; before_length: cuint; after_length: cuint); cdecl;
begin
  WriteLn('zwp_text_input_v3.delete_surrounding_text');
  AIntf.zwp_text_input_v3_delete_surrounding_text(zwp_text_input_v3, before_length, after_length);
end;

procedure zwp_text_input_v3_done_Intf(AIntf: Izwp_text_input_v3Listener; zwp_text_input_v3: Pzwp_text_input_v3; serial: cuint); cdecl;
begin
  WriteLn('zwp_text_input_v3.done');
  AIntf.zwp_text_input_v3_done(zwp_text_input_v3, serial);
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
