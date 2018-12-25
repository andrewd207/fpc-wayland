{*
 * Copyright © 2008 Kristian Høgsberg
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice (including the
 * next paragraph) shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *}

unit wayland_client_core;

{$mode objfpc}{$H+}
{$packrecords c}
{$linklib wayland-client}


interface

uses
  Classes, SysUtils, wayland_util, ctypes;

type
  Pwl_display = pointer; //^Twl_display;
  Pwl_event_queue = pointer ;//^Twl_event_queue;
  Pwl_proxy = pointer; //^Twl_proxy;
  Pwl_proxy_wrapper = pointer;//^Twl_proxy_wrapper;

  { Twl_event_queue }




procedure wl_event_queue_destroy(queue: Pwl_event_queue); cdecl; external;

procedure wl_proxy_marshal(p: Pwl_proxy; opcode: cint32); cdecl; external; varargs;
procedure wl_proxy_marshal_array(p: Pwl_proxy; opcode: cint32; args: Pwl_argument); cdecl; external;
function  wl_proxy_create(factory: Pwl_proxy; &interface: Pwl_interface): Pwl_proxy; cdecl; external;
function  wl_proxy_create_wrapper(proxy: pointer): Pwl_proxy_wrapper; cdecl; external;
procedure wl_proxy_wrapper_destroy(proxy_wrapper: Pointer); cdecl; external;
function  wl_proxy_marshal_constructor(p: Pwl_proxy; opcode: cint32; &interface: Pwl_interface): Pwl_proxy; cdecl; external; varargs;
function  wl_proxy_marshal_constructor_versioned(p: Pwl_proxy; opcode: cint32; &interface: Pwl_interface; version: cuint32): Pwl_proxy; cdecl; external; varargs;
function  wl_proxy_marshal_array_constructor(p: Pwl_proxy; opcode: cint32; args: Pwl_argument; &interface: Pwl_interface): Pwl_proxy; cdecl; external;
function  wl_proxy_marshal_array_constructor_versioned(p: Pwl_proxy; opcode: cint32; args: Pwl_argument; &interface: Pwl_interface; version: cuint32): Pwl_proxy; cdecl; external;
procedure wl_proxy_destroy(proxy: Pwl_proxy); cdecl; external;
function  wl_proxy_add_listener(proxy: Pwl_proxy; impl: pointer; data: pointer): cint; cdecl; external;
function  wl_proxy_get_listener(proxy: Pwl_proxy): Pointer; cdecl; external;
function  wl_proxy_add_dispatcher(proxy: Pwl_proxy; dispatcher_func: wl_dispatcher_func_t; dispatcher_data: pointer; data: pointer): cint; cdecl; external;
procedure wl_proxy_set_user_data(proxy: Pwl_proxy; user_data: pointer); cdecl; external;
function  wl_proxy_get_user_data(proxy: Pwl_proxy): Pointer; cdecl; external;
function  wl_proxy_get_version(proxy: Pwl_proxy): cuint32; cdecl; external;
function  wl_proxy_get_id(proxy: Pwl_proxy): cint; cdecl; external;
function  wl_proxy_get_class(proxy: Pwl_proxy): PChar; cdecl; external;
procedure wl_proxy_set_queue(proxy: Pwl_proxy; queue: Pwl_event_queue); cdecl; external;

function  wl_display_connect(name: PChar): Pwl_display; cdecl; external;
function  wl_display_connect_to_fd(fd: cint): Pwl_display; cdecl; external;
procedure wl_display_disconnect(display :Pwl_display); cdecl; external;
function  wl_display_get_fd(display :Pwl_display): cint; cdecl; external;
function  wl_display_dispatch(display :Pwl_display): cint; cdecl; external;
function  wl_display_dispatch_queue(display :Pwl_display; queue: Pwl_event_queue): cint; cdecl; external;
function  wl_display_dispatch_queue_pending(display :Pwl_display; queue: Pwl_event_queue): cint; cdecl; external;
function  wl_display_dispatch_pending(display :Pwl_display): cint; cdecl; external;
function  wl_display_get_error(display :Pwl_display): cint; cdecl; external;
function  wl_display_get_protocol_error(display :Pwl_display; &interface: PPwl_interface; id: Pcuint32): cuint32; cdecl; external;
function  wl_display_flush(display :Pwl_display): cint; cdecl; external;
function  wl_display_roundtrip_queue(display :Pwl_display; queue: Pwl_event_queue): cint; cdecl; external;
function  wl_display_roundtrip(display :Pwl_display): cint; cdecl; external;
function  wl_display_create_queue(display :Pwl_display): Pwl_event_queue; cdecl; external;
function  wl_display_prepare_read_queue(display :Pwl_display; queue: Pwl_event_queue): cint; cdecl; external;
function  wl_display_prepare_read(display :Pwl_display): cint; cdecl; external;
procedure wl_display_cancel_read(display :Pwl_display); cdecl; external;
function  wl_display_read_events(display :Pwl_display): cint; cdecl; external;

procedure wl_log_set_handler_client(handler: wl_log_func_t); cdecl; external;

implementation



end.

