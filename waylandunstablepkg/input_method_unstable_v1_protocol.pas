unit input_method_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_input_method_context_v1 = ^Tzwp_input_method_context_v1;
  Tzwp_input_method_context_v1 = record end;
  Pzwp_input_method_v1 = ^Tzwp_input_method_v1;
  Tzwp_input_method_v1 = record end;
  Pzwp_input_panel_v1 = ^Tzwp_input_panel_v1;
  Tzwp_input_panel_v1 = record end;
  Pzwp_input_panel_surface_v1 = ^Tzwp_input_panel_surface_v1;
  Tzwp_input_panel_surface_v1 = record end;
  Pzwp_input_method_context_v1_listener = ^Tzwp_input_method_context_v1_listener;
  Tzwp_input_method_context_v1_listener = record
    surrounding_text : procedure(data: Pointer; zwp_input_method_context_v1: Pzwp_input_method_context_v1; text: pchar; cursor: cuint; anchor: cuint); cdecl;
    reset : procedure(data: Pointer; zwp_input_method_context_v1: Pzwp_input_method_context_v1); cdecl;
    content_type : procedure(data: Pointer; zwp_input_method_context_v1: Pzwp_input_method_context_v1; hint: cuint; purpose: cuint); cdecl;
    invoke_action : procedure(data: Pointer; zwp_input_method_context_v1: Pzwp_input_method_context_v1; button: cuint; index: cuint); cdecl;
    commit_state : procedure(data: Pointer; zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint); cdecl;
    preferred_language : procedure(data: Pointer; zwp_input_method_context_v1: Pzwp_input_method_context_v1; language: pchar); cdecl;
  end;

  Pzwp_input_method_v1_listener = ^Tzwp_input_method_v1_listener;
  Tzwp_input_method_v1_listener = record
    activate : procedure(data: Pointer; zwp_input_method_v1: Pzwp_input_method_v1; id: Pzwp_input_method_context_v1); cdecl;
    deactivate : procedure(data: Pointer; zwp_input_method_v1: Pzwp_input_method_v1; context: Pzwp_input_method_context_v1); cdecl;
  end;

  Pzwp_input_panel_v1_listener = ^Tzwp_input_panel_v1_listener;
  Tzwp_input_panel_v1_listener = record
  end;

const
  ZWP_INPUT_PANEL_SURFACE_V1_POSITION_CENTER_BOTTOM = 0; // 

type
  Pzwp_input_panel_surface_v1_listener = ^Tzwp_input_panel_surface_v1_listener;
  Tzwp_input_panel_surface_v1_listener = record
  end;



  Izwp_input_method_context_v1Listener = interface
  ['Izwp_input_method_context_v1Listener']
    procedure zwp_input_method_context_v1_surrounding_text(zwp_input_method_context_v1: Pzwp_input_method_context_v1; text: pchar; cursor: cuint; anchor: cuint);
    procedure zwp_input_method_context_v1_reset(zwp_input_method_context_v1: Pzwp_input_method_context_v1);
    procedure zwp_input_method_context_v1_content_type(zwp_input_method_context_v1: Pzwp_input_method_context_v1; hint: cuint; purpose: cuint);
    procedure zwp_input_method_context_v1_invoke_action(zwp_input_method_context_v1: Pzwp_input_method_context_v1; button: cuint; index: cuint);
    procedure zwp_input_method_context_v1_commit_state(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint);
    procedure zwp_input_method_context_v1_preferred_language(zwp_input_method_context_v1: Pzwp_input_method_context_v1; language: pchar);
  end;

  Izwp_input_method_v1Listener = interface
  ['Izwp_input_method_v1Listener']
    procedure zwp_input_method_v1_activate(zwp_input_method_v1: Pzwp_input_method_v1; id: Pzwp_input_method_context_v1);
    procedure zwp_input_method_v1_deactivate(zwp_input_method_v1: Pzwp_input_method_v1; context: Pzwp_input_method_context_v1);
  end;

  Izwp_input_panel_v1Listener = interface
  ['Izwp_input_panel_v1Listener']
  end;

  Izwp_input_panel_surface_v1Listener = interface
  ['Izwp_input_panel_surface_v1Listener']
  end;



procedure zwp_input_method_context_v1_destroy(zwp_input_method_context_v1: Pzwp_input_method_context_v1);
procedure zwp_input_method_context_v1_commit_string(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; text: pchar);
procedure zwp_input_method_context_v1_preedit_string(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; text: pchar; commit: pchar);
procedure zwp_input_method_context_v1_preedit_styling(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cuint; length: cuint; style: cuint);
procedure zwp_input_method_context_v1_preedit_cursor(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cint);
procedure zwp_input_method_context_v1_delete_surrounding_text(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cint; length: cuint);
procedure zwp_input_method_context_v1_cursor_position(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cint; anchor: cint);
procedure zwp_input_method_context_v1_modifiers_map(zwp_input_method_context_v1: Pzwp_input_method_context_v1; map: Pwl_array);
procedure zwp_input_method_context_v1_keysym(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; time: cuint; sym: cuint; state: cuint; modifiers: cuint);
function  zwp_input_method_context_v1_grab_keyboard(zwp_input_method_context_v1: Pzwp_input_method_context_v1): Pwl_keyboard;
procedure zwp_input_method_context_v1_key(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; time: cuint; key: cuint; state: cuint);
procedure zwp_input_method_context_v1_modifiers(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; mods_depressed: cuint; mods_latched: cuint; mods_locked: cuint; group: cuint);
procedure zwp_input_method_context_v1_language(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; language: pchar);
procedure zwp_input_method_context_v1_text_direction(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; direction: cuint);
function  zwp_input_method_context_v1_add_listener(zwp_input_method_context_v1: Pzwp_input_method_context_v1; listener: Pzwp_input_method_context_v1_listener; data: Pointer): cint;
procedure  zwp_input_method_context_v1_add_listener(zwp_input_method_context_v1: Pzwp_input_method_context_v1; AIntf: Izwp_input_method_context_v1Listener);
procedure zwp_input_method_context_v1_set_user_data(zwp_input_method_context_v1: Pzwp_input_method_context_v1; user_data: Pointer);
function  zwp_input_method_context_v1_get_user_data(zwp_input_method_context_v1: Pzwp_input_method_context_v1): Pointer;
function  zwp_input_method_context_v1_get_version(zwp_input_method_context_v1: Pzwp_input_method_context_v1): cuint32;
function  zwp_input_method_v1_add_listener(zwp_input_method_v1: Pzwp_input_method_v1; listener: Pzwp_input_method_v1_listener; data: Pointer): cint;
procedure  zwp_input_method_v1_add_listener(zwp_input_method_v1: Pzwp_input_method_v1; AIntf: Izwp_input_method_v1Listener);
procedure zwp_input_method_v1_set_user_data(zwp_input_method_v1: Pzwp_input_method_v1; user_data: Pointer);
function  zwp_input_method_v1_get_user_data(zwp_input_method_v1: Pzwp_input_method_v1): Pointer;
function  zwp_input_method_v1_get_version(zwp_input_method_v1: Pzwp_input_method_v1): cuint32;
procedure zwp_input_method_v1_destroy(zwp_input_method_v1: Pzwp_input_method_v1);
function  zwp_input_panel_v1_get_input_panel_surface(zwp_input_panel_v1: Pzwp_input_panel_v1; surface: Pwl_surface): Pzwp_input_panel_surface_v1;
function  zwp_input_panel_v1_add_listener(zwp_input_panel_v1: Pzwp_input_panel_v1; listener: Pzwp_input_panel_v1_listener; data: Pointer): cint;
procedure  zwp_input_panel_v1_add_listener(zwp_input_panel_v1: Pzwp_input_panel_v1; AIntf: Izwp_input_panel_v1Listener);
procedure zwp_input_panel_v1_set_user_data(zwp_input_panel_v1: Pzwp_input_panel_v1; user_data: Pointer);
function  zwp_input_panel_v1_get_user_data(zwp_input_panel_v1: Pzwp_input_panel_v1): Pointer;
function  zwp_input_panel_v1_get_version(zwp_input_panel_v1: Pzwp_input_panel_v1): cuint32;
procedure zwp_input_panel_v1_destroy(zwp_input_panel_v1: Pzwp_input_panel_v1);
procedure zwp_input_panel_surface_v1_set_toplevel(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; output: Pwl_output; position: cuint);
procedure zwp_input_panel_surface_v1_set_overlay_panel(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1);
function  zwp_input_panel_surface_v1_add_listener(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; listener: Pzwp_input_panel_surface_v1_listener; data: Pointer): cint;
procedure  zwp_input_panel_surface_v1_add_listener(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; AIntf: Izwp_input_panel_surface_v1Listener);
procedure zwp_input_panel_surface_v1_set_user_data(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; user_data: Pointer);
function  zwp_input_panel_surface_v1_get_user_data(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1): Pointer;
function  zwp_input_panel_surface_v1_get_version(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1): cuint32;
procedure zwp_input_panel_surface_v1_destroy(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1);



var
  zwp_input_method_context_v1_interface: Twl_interface;
  zwp_input_method_v1_interface: Twl_interface;
  zwp_input_panel_v1_interface: Twl_interface;
  zwp_input_panel_surface_v1_interface: Twl_interface;



implementation

const
_ZWP_INPUT_METHOD_CONTEXT_V1_DESTROY = 0;
_ZWP_INPUT_METHOD_CONTEXT_V1_COMMIT_STRING = 1;
_ZWP_INPUT_METHOD_CONTEXT_V1_PREEDIT_STRING = 2;
_ZWP_INPUT_METHOD_CONTEXT_V1_PREEDIT_STYLING = 3;
_ZWP_INPUT_METHOD_CONTEXT_V1_PREEDIT_CURSOR = 4;
_ZWP_INPUT_METHOD_CONTEXT_V1_DELETE_SURROUNDING_TEXT = 5;
_ZWP_INPUT_METHOD_CONTEXT_V1_CURSOR_POSITION = 6;
_ZWP_INPUT_METHOD_CONTEXT_V1_MODIFIERS_MAP = 7;
_ZWP_INPUT_METHOD_CONTEXT_V1_KEYSYM = 8;
_ZWP_INPUT_METHOD_CONTEXT_V1_GRAB_KEYBOARD = 9;
_ZWP_INPUT_METHOD_CONTEXT_V1_KEY = 10;
_ZWP_INPUT_METHOD_CONTEXT_V1_MODIFIERS = 11;
_ZWP_INPUT_METHOD_CONTEXT_V1_LANGUAGE = 12;
_ZWP_INPUT_METHOD_CONTEXT_V1_TEXT_DIRECTION = 13;
_ZWP_INPUT_PANEL_V1_GET_INPUT_PANEL_SURFACE = 0;
_ZWP_INPUT_PANEL_SURFACE_V1_SET_TOPLEVEL = 0;
_ZWP_INPUT_PANEL_SURFACE_V1_SET_OVERLAY_PANEL = 1;


var
  vIntf_zwp_input_method_context_v1_Listener: Tzwp_input_method_context_v1_listener;
  vIntf_zwp_input_method_v1_Listener: Tzwp_input_method_v1_listener;
  vIntf_zwp_input_panel_v1_Listener: Tzwp_input_panel_v1_listener;
  vIntf_zwp_input_panel_surface_v1_Listener: Tzwp_input_panel_surface_v1_listener;



procedure zwp_input_method_context_v1_destroy(zwp_input_method_context_v1: Pzwp_input_method_context_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1), _ZWP_INPUT_METHOD_CONTEXT_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_input_method_context_v1));
end;

procedure zwp_input_method_context_v1_commit_string(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; text: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_COMMIT_STRING, serial, text);
end;

procedure zwp_input_method_context_v1_preedit_string(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; text: pchar; commit: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_PREEDIT_STRING, serial, text, commit);
end;

procedure zwp_input_method_context_v1_preedit_styling(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cuint; length: cuint; style: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_PREEDIT_STYLING, index, length, style);
end;

procedure zwp_input_method_context_v1_preedit_cursor(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_PREEDIT_CURSOR, index);
end;

procedure zwp_input_method_context_v1_delete_surrounding_text(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cint; length: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_DELETE_SURROUNDING_TEXT, index, length);
end;

procedure zwp_input_method_context_v1_cursor_position(zwp_input_method_context_v1: Pzwp_input_method_context_v1; index: cint; anchor: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_CURSOR_POSITION, index, anchor);
end;

procedure zwp_input_method_context_v1_modifiers_map(zwp_input_method_context_v1: Pzwp_input_method_context_v1; map: Pwl_array);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_MODIFIERS_MAP, map);
end;

procedure zwp_input_method_context_v1_keysym(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; time: cuint; sym: cuint; state: cuint; modifiers: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_KEYSYM, serial, time, sym, state, modifiers);
end;

function  zwp_input_method_context_v1_grab_keyboard(zwp_input_method_context_v1: Pzwp_input_method_context_v1): Pwl_keyboard;
var
  keyboard: Pwl_proxy;
begin
  keyboard := wl_proxy_marshal_constructor(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_GRAB_KEYBOARD, @wl_keyboard_interface, nil);
  Result := Pwl_keyboard(keyboard);
end;

procedure zwp_input_method_context_v1_key(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; time: cuint; key: cuint; state: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_KEY, serial, time, key, state);
end;

procedure zwp_input_method_context_v1_modifiers(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; mods_depressed: cuint; mods_latched: cuint; mods_locked: cuint; group: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_MODIFIERS, serial, mods_depressed, mods_latched, mods_locked, group);
end;

procedure zwp_input_method_context_v1_language(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; language: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_LANGUAGE, serial, language);
end;

procedure zwp_input_method_context_v1_text_direction(zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint; direction: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_method_context_v1),
      _ZWP_INPUT_METHOD_CONTEXT_V1_TEXT_DIRECTION, serial, direction);
end;

function  zwp_input_method_context_v1_add_listener(zwp_input_method_context_v1: Pzwp_input_method_context_v1; listener: Pzwp_input_method_context_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_input_method_context_v1), listener, data);
end;

procedure  zwp_input_method_context_v1_add_listener(zwp_input_method_context_v1: Pzwp_input_method_context_v1; AIntf: Izwp_input_method_context_v1Listener);
begin
  zwp_input_method_context_v1_add_listener(zwp_input_method_context_v1, @vIntf_zwp_input_method_context_v1_Listener, AIntf);
end;

procedure zwp_input_method_context_v1_set_user_data(zwp_input_method_context_v1: Pzwp_input_method_context_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_input_method_context_v1), user_data);
end;

function  zwp_input_method_context_v1_get_user_data(zwp_input_method_context_v1: Pzwp_input_method_context_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_input_method_context_v1));
end;

function  zwp_input_method_context_v1_get_version(zwp_input_method_context_v1: Pzwp_input_method_context_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_input_method_context_v1));
end;

function  zwp_input_method_v1_add_listener(zwp_input_method_v1: Pzwp_input_method_v1; listener: Pzwp_input_method_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_input_method_v1), listener, data);
end;

procedure  zwp_input_method_v1_add_listener(zwp_input_method_v1: Pzwp_input_method_v1; AIntf: Izwp_input_method_v1Listener);
begin
  zwp_input_method_v1_add_listener(zwp_input_method_v1, @vIntf_zwp_input_method_v1_Listener, AIntf);
end;

procedure zwp_input_method_v1_set_user_data(zwp_input_method_v1: Pzwp_input_method_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_input_method_v1), user_data);
end;

function  zwp_input_method_v1_get_user_data(zwp_input_method_v1: Pzwp_input_method_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_input_method_v1));
end;

function  zwp_input_method_v1_get_version(zwp_input_method_v1: Pzwp_input_method_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_input_method_v1));
end;

procedure zwp_input_method_v1_destroy(zwp_input_method_v1: Pzwp_input_method_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_input_method_v1));
end;

function  zwp_input_panel_v1_get_input_panel_surface(zwp_input_panel_v1: Pzwp_input_panel_v1; surface: Pwl_surface): Pzwp_input_panel_surface_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_input_panel_v1),
      _ZWP_INPUT_PANEL_V1_GET_INPUT_PANEL_SURFACE, @zwp_input_panel_surface_v1_interface, nil, surface);
  Result := Pzwp_input_panel_surface_v1(id);
end;

function  zwp_input_panel_v1_add_listener(zwp_input_panel_v1: Pzwp_input_panel_v1; listener: Pzwp_input_panel_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_input_panel_v1), listener, data);
end;

procedure  zwp_input_panel_v1_add_listener(zwp_input_panel_v1: Pzwp_input_panel_v1; AIntf: Izwp_input_panel_v1Listener);
begin
  zwp_input_panel_v1_add_listener(zwp_input_panel_v1, @vIntf_zwp_input_panel_v1_Listener, AIntf);
end;

procedure zwp_input_panel_v1_set_user_data(zwp_input_panel_v1: Pzwp_input_panel_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_input_panel_v1), user_data);
end;

function  zwp_input_panel_v1_get_user_data(zwp_input_panel_v1: Pzwp_input_panel_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_input_panel_v1));
end;

function  zwp_input_panel_v1_get_version(zwp_input_panel_v1: Pzwp_input_panel_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_input_panel_v1));
end;

procedure zwp_input_panel_v1_destroy(zwp_input_panel_v1: Pzwp_input_panel_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_input_panel_v1));
end;

procedure zwp_input_panel_surface_v1_set_toplevel(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; output: Pwl_output; position: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_panel_surface_v1),
      _ZWP_INPUT_PANEL_SURFACE_V1_SET_TOPLEVEL, output, position);
end;

procedure zwp_input_panel_surface_v1_set_overlay_panel(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_panel_surface_v1),
      _ZWP_INPUT_PANEL_SURFACE_V1_SET_OVERLAY_PANEL);
end;

function  zwp_input_panel_surface_v1_add_listener(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; listener: Pzwp_input_panel_surface_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_input_panel_surface_v1), listener, data);
end;

procedure  zwp_input_panel_surface_v1_add_listener(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; AIntf: Izwp_input_panel_surface_v1Listener);
begin
  zwp_input_panel_surface_v1_add_listener(zwp_input_panel_surface_v1, @vIntf_zwp_input_panel_surface_v1_Listener, AIntf);
end;

procedure zwp_input_panel_surface_v1_set_user_data(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_input_panel_surface_v1), user_data);
end;

function  zwp_input_panel_surface_v1_get_user_data(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_input_panel_surface_v1));
end;

function  zwp_input_panel_surface_v1_get_version(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_input_panel_surface_v1));
end;

procedure zwp_input_panel_surface_v1_destroy(zwp_input_panel_surface_v1: Pzwp_input_panel_surface_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_input_panel_surface_v1));
end;


procedure zwp_input_method_context_v1_surrounding_text_Intf(AIntf: Izwp_input_method_context_v1Listener; zwp_input_method_context_v1: Pzwp_input_method_context_v1; text: pchar; cursor: cuint; anchor: cuint); cdecl;
begin
  WriteLn('zwp_input_method_context_v1.surrounding_text');
  AIntf.zwp_input_method_context_v1_surrounding_text(zwp_input_method_context_v1, text, cursor, anchor);
end;

procedure zwp_input_method_context_v1_reset_Intf(AIntf: Izwp_input_method_context_v1Listener; zwp_input_method_context_v1: Pzwp_input_method_context_v1); cdecl;
begin
  WriteLn('zwp_input_method_context_v1.reset');
  AIntf.zwp_input_method_context_v1_reset(zwp_input_method_context_v1);
end;

procedure zwp_input_method_context_v1_content_type_Intf(AIntf: Izwp_input_method_context_v1Listener; zwp_input_method_context_v1: Pzwp_input_method_context_v1; hint: cuint; purpose: cuint); cdecl;
begin
  WriteLn('zwp_input_method_context_v1.content_type');
  AIntf.zwp_input_method_context_v1_content_type(zwp_input_method_context_v1, hint, purpose);
end;

procedure zwp_input_method_context_v1_invoke_action_Intf(AIntf: Izwp_input_method_context_v1Listener; zwp_input_method_context_v1: Pzwp_input_method_context_v1; button: cuint; index: cuint); cdecl;
begin
  WriteLn('zwp_input_method_context_v1.invoke_action');
  AIntf.zwp_input_method_context_v1_invoke_action(zwp_input_method_context_v1, button, index);
end;

procedure zwp_input_method_context_v1_commit_state_Intf(AIntf: Izwp_input_method_context_v1Listener; zwp_input_method_context_v1: Pzwp_input_method_context_v1; serial: cuint); cdecl;
begin
  WriteLn('zwp_input_method_context_v1.commit_state');
  AIntf.zwp_input_method_context_v1_commit_state(zwp_input_method_context_v1, serial);
end;

procedure zwp_input_method_context_v1_preferred_language_Intf(AIntf: Izwp_input_method_context_v1Listener; zwp_input_method_context_v1: Pzwp_input_method_context_v1; language: pchar); cdecl;
begin
  WriteLn('zwp_input_method_context_v1.preferred_language');
  AIntf.zwp_input_method_context_v1_preferred_language(zwp_input_method_context_v1, language);
end;

procedure zwp_input_method_v1_activate_Intf(AIntf: Izwp_input_method_v1Listener; zwp_input_method_v1: Pzwp_input_method_v1; id: Pzwp_input_method_context_v1); cdecl;
begin
  WriteLn('zwp_input_method_v1.activate');
  AIntf.zwp_input_method_v1_activate(zwp_input_method_v1, id);
end;

procedure zwp_input_method_v1_deactivate_Intf(AIntf: Izwp_input_method_v1Listener; zwp_input_method_v1: Pzwp_input_method_v1; context: Pzwp_input_method_context_v1); cdecl;
begin
  WriteLn('zwp_input_method_v1.deactivate');
  AIntf.zwp_input_method_v1_deactivate(zwp_input_method_v1, context);
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
