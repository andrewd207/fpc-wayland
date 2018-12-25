unit text_input_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_text_input_v1 = ^Tzwp_text_input_v1;
  Tzwp_text_input_v1 = record end;
  Pzwp_text_input_manager_v1 = ^Tzwp_text_input_manager_v1;
  Tzwp_text_input_manager_v1 = record end;
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
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_ACTIVE = 2; // 
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_INACTIVE = 3; // 
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_HIGHLIGHT = 4; // 
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_UNDERLINE = 5; // 
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_SELECTION = 6; // 
  ZWP_TEXT_INPUT_V1_PREEDIT_STYLE_INCORRECT = 7; // 
  ZWP_TEXT_INPUT_V1_TEXT_DIRECTION_AUTO = 0; // automatic text direction based on text and language
  ZWP_TEXT_INPUT_V1_TEXT_DIRECTION_LTR = 1; // left-to-right
  ZWP_TEXT_INPUT_V1_TEXT_DIRECTION_RTL = 2; // right-to-left

type
  Pzwp_text_input_v1_listener = ^Tzwp_text_input_v1_listener;
  Tzwp_text_input_v1_listener = record
    enter : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; surface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1); cdecl;
    modifiers_map : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; map: Pwl_array); cdecl;
    input_panel_state : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; state: cuint); cdecl;
    preedit_string : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; text: pchar; commit: pchar); cdecl;
    preedit_styling : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; index: cuint; length: cuint; style: cuint); cdecl;
    preedit_cursor : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; index: cint); cdecl;
    commit_string : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; text: pchar); cdecl;
    cursor_position : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; index: cint; anchor: cint); cdecl;
    delete_surrounding_text : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; index: cint; length: cuint); cdecl;
    keysym : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; time: cuint; sym: cuint; state: cuint; modifiers: cuint); cdecl;
    language : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; language: pchar); cdecl;
    text_direction : procedure(data: Pointer; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; direction: cuint); cdecl;
  end;

  Pzwp_text_input_manager_v1_listener = ^Tzwp_text_input_manager_v1_listener;
  Tzwp_text_input_manager_v1_listener = record
  end;



  Izwp_text_input_v1Listener = interface
  ['Izwp_text_input_v1Listener']
    procedure zwp_text_input_v1_enter(zwp_text_input_v1: Pzwp_text_input_v1; surface: Pwl_surface);
    procedure zwp_text_input_v1_leave(zwp_text_input_v1: Pzwp_text_input_v1);
    procedure zwp_text_input_v1_modifiers_map(zwp_text_input_v1: Pzwp_text_input_v1; map: Pwl_array);
    procedure zwp_text_input_v1_input_panel_state(zwp_text_input_v1: Pzwp_text_input_v1; state: cuint);
    procedure zwp_text_input_v1_preedit_string(zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; text: pchar; commit: pchar);
    procedure zwp_text_input_v1_preedit_styling(zwp_text_input_v1: Pzwp_text_input_v1; index: cuint; length: cuint; style: cuint);
    procedure zwp_text_input_v1_preedit_cursor(zwp_text_input_v1: Pzwp_text_input_v1; index: cint);
    procedure zwp_text_input_v1_commit_string(zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; text: pchar);
    procedure zwp_text_input_v1_cursor_position(zwp_text_input_v1: Pzwp_text_input_v1; index: cint; anchor: cint);
    procedure zwp_text_input_v1_delete_surrounding_text(zwp_text_input_v1: Pzwp_text_input_v1; index: cint; length: cuint);
    procedure zwp_text_input_v1_keysym(zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; time: cuint; sym: cuint; state: cuint; modifiers: cuint);
    procedure zwp_text_input_v1_language(zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; language: pchar);
    procedure zwp_text_input_v1_text_direction(zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; direction: cuint);
  end;

  Izwp_text_input_manager_v1Listener = interface
  ['Izwp_text_input_manager_v1Listener']
  end;



procedure zwp_text_input_v1_activate(zwp_text_input_v1: Pzwp_text_input_v1; seat: Pwl_seat; surface: Pwl_surface);
procedure zwp_text_input_v1_deactivate(zwp_text_input_v1: Pzwp_text_input_v1; seat: Pwl_seat);
procedure zwp_text_input_v1_show_input_panel(zwp_text_input_v1: Pzwp_text_input_v1);
procedure zwp_text_input_v1_hide_input_panel(zwp_text_input_v1: Pzwp_text_input_v1);
procedure zwp_text_input_v1_reset(zwp_text_input_v1: Pzwp_text_input_v1);
procedure zwp_text_input_v1_set_surrounding_text(zwp_text_input_v1: Pzwp_text_input_v1; text: pchar; cursor: cuint; anchor: cuint);
procedure zwp_text_input_v1_set_content_type(zwp_text_input_v1: Pzwp_text_input_v1; hint: cuint; purpose: cuint);
procedure zwp_text_input_v1_set_cursor_rectangle(zwp_text_input_v1: Pzwp_text_input_v1; x: cint; y: cint; width: cint; height: cint);
procedure zwp_text_input_v1_set_preferred_language(zwp_text_input_v1: Pzwp_text_input_v1; language: pchar);
procedure zwp_text_input_v1_commit_state(zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint);
procedure zwp_text_input_v1_invoke_action(zwp_text_input_v1: Pzwp_text_input_v1; button: cuint; index: cuint);
function  zwp_text_input_v1_add_listener(zwp_text_input_v1: Pzwp_text_input_v1; listener: Pzwp_text_input_v1_listener; data: Pointer): cint;
procedure  zwp_text_input_v1_add_listener(zwp_text_input_v1: Pzwp_text_input_v1; AIntf: Izwp_text_input_v1Listener);
procedure zwp_text_input_v1_set_user_data(zwp_text_input_v1: Pzwp_text_input_v1; user_data: Pointer);
function  zwp_text_input_v1_get_user_data(zwp_text_input_v1: Pzwp_text_input_v1): Pointer;
function  zwp_text_input_v1_get_version(zwp_text_input_v1: Pzwp_text_input_v1): cuint32;
procedure zwp_text_input_v1_destroy(zwp_text_input_v1: Pzwp_text_input_v1);
function  zwp_text_input_manager_v1_create_text_input(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1): Pzwp_text_input_v1;
function  zwp_text_input_manager_v1_add_listener(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1; listener: Pzwp_text_input_manager_v1_listener; data: Pointer): cint;
procedure  zwp_text_input_manager_v1_add_listener(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1; AIntf: Izwp_text_input_manager_v1Listener);
procedure zwp_text_input_manager_v1_set_user_data(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1; user_data: Pointer);
function  zwp_text_input_manager_v1_get_user_data(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1): Pointer;
function  zwp_text_input_manager_v1_get_version(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1): cuint32;
procedure zwp_text_input_manager_v1_destroy(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1);



var
  zwp_text_input_v1_interface: Twl_interface;
  zwp_text_input_manager_v1_interface: Twl_interface;



implementation

const
_ZWP_TEXT_INPUT_V1_ACTIVATE = 0;
_ZWP_TEXT_INPUT_V1_DEACTIVATE = 1;
_ZWP_TEXT_INPUT_V1_SHOW_INPUT_PANEL = 2;
_ZWP_TEXT_INPUT_V1_HIDE_INPUT_PANEL = 3;
_ZWP_TEXT_INPUT_V1_RESET = 4;
_ZWP_TEXT_INPUT_V1_SET_SURROUNDING_TEXT = 5;
_ZWP_TEXT_INPUT_V1_SET_CONTENT_TYPE = 6;
_ZWP_TEXT_INPUT_V1_SET_CURSOR_RECTANGLE = 7;
_ZWP_TEXT_INPUT_V1_SET_PREFERRED_LANGUAGE = 8;
_ZWP_TEXT_INPUT_V1_COMMIT_STATE = 9;
_ZWP_TEXT_INPUT_V1_INVOKE_ACTION = 10;
_ZWP_TEXT_INPUT_MANAGER_V1_CREATE_TEXT_INPUT = 0;


var
  vIntf_zwp_text_input_v1_Listener: Tzwp_text_input_v1_listener;
  vIntf_zwp_text_input_manager_v1_Listener: Tzwp_text_input_manager_v1_listener;



procedure zwp_text_input_v1_activate(zwp_text_input_v1: Pzwp_text_input_v1; seat: Pwl_seat; surface: Pwl_surface);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_ACTIVATE, seat, surface);
end;

procedure zwp_text_input_v1_deactivate(zwp_text_input_v1: Pzwp_text_input_v1; seat: Pwl_seat);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_DEACTIVATE, seat);
end;

procedure zwp_text_input_v1_show_input_panel(zwp_text_input_v1: Pzwp_text_input_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_SHOW_INPUT_PANEL);
end;

procedure zwp_text_input_v1_hide_input_panel(zwp_text_input_v1: Pzwp_text_input_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_HIDE_INPUT_PANEL);
end;

procedure zwp_text_input_v1_reset(zwp_text_input_v1: Pzwp_text_input_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_RESET);
end;

procedure zwp_text_input_v1_set_surrounding_text(zwp_text_input_v1: Pzwp_text_input_v1; text: pchar; cursor: cuint; anchor: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_SET_SURROUNDING_TEXT, text, cursor, anchor);
end;

procedure zwp_text_input_v1_set_content_type(zwp_text_input_v1: Pzwp_text_input_v1; hint: cuint; purpose: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_SET_CONTENT_TYPE, hint, purpose);
end;

procedure zwp_text_input_v1_set_cursor_rectangle(zwp_text_input_v1: Pzwp_text_input_v1; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_SET_CURSOR_RECTANGLE, x, y, width, height);
end;

procedure zwp_text_input_v1_set_preferred_language(zwp_text_input_v1: Pzwp_text_input_v1; language: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_SET_PREFERRED_LANGUAGE, language);
end;

procedure zwp_text_input_v1_commit_state(zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_COMMIT_STATE, serial);
end;

procedure zwp_text_input_v1_invoke_action(zwp_text_input_v1: Pzwp_text_input_v1; button: cuint; index: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_text_input_v1),
      _ZWP_TEXT_INPUT_V1_INVOKE_ACTION, button, index);
end;

function  zwp_text_input_v1_add_listener(zwp_text_input_v1: Pzwp_text_input_v1; listener: Pzwp_text_input_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_text_input_v1), listener, data);
end;

procedure  zwp_text_input_v1_add_listener(zwp_text_input_v1: Pzwp_text_input_v1; AIntf: Izwp_text_input_v1Listener);
begin
  zwp_text_input_v1_add_listener(zwp_text_input_v1, @vIntf_zwp_text_input_v1_Listener, AIntf);
end;

procedure zwp_text_input_v1_set_user_data(zwp_text_input_v1: Pzwp_text_input_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_text_input_v1), user_data);
end;

function  zwp_text_input_v1_get_user_data(zwp_text_input_v1: Pzwp_text_input_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_text_input_v1));
end;

function  zwp_text_input_v1_get_version(zwp_text_input_v1: Pzwp_text_input_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_text_input_v1));
end;

procedure zwp_text_input_v1_destroy(zwp_text_input_v1: Pzwp_text_input_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_text_input_v1));
end;

function  zwp_text_input_manager_v1_create_text_input(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1): Pzwp_text_input_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_text_input_manager_v1),
      _ZWP_TEXT_INPUT_MANAGER_V1_CREATE_TEXT_INPUT, @zwp_text_input_v1_interface, nil);
  Result := Pzwp_text_input_v1(id);
end;

function  zwp_text_input_manager_v1_add_listener(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1; listener: Pzwp_text_input_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_text_input_manager_v1), listener, data);
end;

procedure  zwp_text_input_manager_v1_add_listener(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1; AIntf: Izwp_text_input_manager_v1Listener);
begin
  zwp_text_input_manager_v1_add_listener(zwp_text_input_manager_v1, @vIntf_zwp_text_input_manager_v1_Listener, AIntf);
end;

procedure zwp_text_input_manager_v1_set_user_data(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_text_input_manager_v1), user_data);
end;

function  zwp_text_input_manager_v1_get_user_data(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_text_input_manager_v1));
end;

function  zwp_text_input_manager_v1_get_version(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_text_input_manager_v1));
end;

procedure zwp_text_input_manager_v1_destroy(zwp_text_input_manager_v1: Pzwp_text_input_manager_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_text_input_manager_v1));
end;


procedure zwp_text_input_v1_enter_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; surface: Pwl_surface); cdecl;
begin
  WriteLn('zwp_text_input_v1.enter');
  AIntf.zwp_text_input_v1_enter(zwp_text_input_v1, surface);
end;

procedure zwp_text_input_v1_leave_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1); cdecl;
begin
  WriteLn('zwp_text_input_v1.leave');
  AIntf.zwp_text_input_v1_leave(zwp_text_input_v1);
end;

procedure zwp_text_input_v1_modifiers_map_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; map: Pwl_array); cdecl;
begin
  WriteLn('zwp_text_input_v1.modifiers_map');
  AIntf.zwp_text_input_v1_modifiers_map(zwp_text_input_v1, map);
end;

procedure zwp_text_input_v1_input_panel_state_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; state: cuint); cdecl;
begin
  WriteLn('zwp_text_input_v1.input_panel_state');
  AIntf.zwp_text_input_v1_input_panel_state(zwp_text_input_v1, state);
end;

procedure zwp_text_input_v1_preedit_string_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; text: pchar; commit: pchar); cdecl;
begin
  WriteLn('zwp_text_input_v1.preedit_string');
  AIntf.zwp_text_input_v1_preedit_string(zwp_text_input_v1, serial, text, commit);
end;

procedure zwp_text_input_v1_preedit_styling_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; index: cuint; length: cuint; style: cuint); cdecl;
begin
  WriteLn('zwp_text_input_v1.preedit_styling');
  AIntf.zwp_text_input_v1_preedit_styling(zwp_text_input_v1, index, length, style);
end;

procedure zwp_text_input_v1_preedit_cursor_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; index: cint); cdecl;
begin
  WriteLn('zwp_text_input_v1.preedit_cursor');
  AIntf.zwp_text_input_v1_preedit_cursor(zwp_text_input_v1, index);
end;

procedure zwp_text_input_v1_commit_string_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; text: pchar); cdecl;
begin
  WriteLn('zwp_text_input_v1.commit_string');
  AIntf.zwp_text_input_v1_commit_string(zwp_text_input_v1, serial, text);
end;

procedure zwp_text_input_v1_cursor_position_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; index: cint; anchor: cint); cdecl;
begin
  WriteLn('zwp_text_input_v1.cursor_position');
  AIntf.zwp_text_input_v1_cursor_position(zwp_text_input_v1, index, anchor);
end;

procedure zwp_text_input_v1_delete_surrounding_text_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; index: cint; length: cuint); cdecl;
begin
  WriteLn('zwp_text_input_v1.delete_surrounding_text');
  AIntf.zwp_text_input_v1_delete_surrounding_text(zwp_text_input_v1, index, length);
end;

procedure zwp_text_input_v1_keysym_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; time: cuint; sym: cuint; state: cuint; modifiers: cuint); cdecl;
begin
  WriteLn('zwp_text_input_v1.keysym');
  AIntf.zwp_text_input_v1_keysym(zwp_text_input_v1, serial, time, sym, state, modifiers);
end;

procedure zwp_text_input_v1_language_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; language: pchar); cdecl;
begin
  WriteLn('zwp_text_input_v1.language');
  AIntf.zwp_text_input_v1_language(zwp_text_input_v1, serial, language);
end;

procedure zwp_text_input_v1_text_direction_Intf(AIntf: Izwp_text_input_v1Listener; zwp_text_input_v1: Pzwp_text_input_v1; serial: cuint; direction: cuint); cdecl;
begin
  WriteLn('zwp_text_input_v1.text_direction');
  AIntf.zwp_text_input_v1_text_direction(zwp_text_input_v1, serial, direction);
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
