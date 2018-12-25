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
unit wayland_client;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, wayland_client_core, wayland_util, ctypes;

type

  Pwl_display = ^Twl_display;
  Pwl_event_queue = ^Twl_event_queue;
  Pwl_proxy = ^Twl_proxy;
  Pwl_proxy_wrapper = ^Twl_proxy_wrapper;
  { Twl_proxy }

  Twl_proxy = object
    procedure MarshalArray(opcode: cint32; args: Pwl_argument);
    function  Create(factory: Pwl_proxy; &interface: Pwl_interface): Pwl_proxy; static;
    function  CreateWrapper: Pwl_proxy_wrapper;
    procedure Destroy;
    function  MarshalArrayConstructor(opcode: cint32; args: Pwl_argument; &interface: Pwl_interface): Pwl_proxy;
    function  MarshalArrayConstructorVersioned(opcode: cint32; args: Pwl_argument; &interface: Pwl_interface; version: cint32): Pwl_proxy;
    function  AddListener(impl: PPointer; data: Pointer): cint;
    function  GetListener: Pointer;
    function  AddDispatcher(dispatcher: wl_dispatcher_func_t; dispatcher_data: pointer; data: pointer): cint;
    procedure SetUserData(Data: Pointer);
    function  GetUserData: Pointer;
    function  GetVersion: cuint32;
    function  GetID: cuint32;
    function  GetClass: PChar;
    procedure SetQueue(queue: Pwl_event_queue);
  end;
  Twl_event_queue = object
    procedure Destroy;
  end;

  { Twl_proxy_wrapper }

  Twl_proxy_wrapper = object(Twl_proxy)
    procedure WrapperDestroy;
  end;

  { Twl_display }

  Twl_display = object
    function  Connect(Name: Pchar): Pwl_display; static;
    function  ConnectTo(fd: cint): Pwl_display; static;
    procedure Disconnect;
    function  GetFD: cint;
    function  Dispatch: cint;
    function  DispatchQueue(Queue: Pwl_event_queue): cint;
    function  DispatchQueuePending: cint;
    function  GetError: cint;
    function  GetProtocolError(&interface: PPwl_interface; id: pcuint32): cuint32;
    function  Flush: cint;
    function  RoundtripQueue(Queue: Pwl_event_queue): cint;
    function  Roundtrip: cint;
    function  CreateQueue: Pwl_event_queue;
    function  PrepareReadQueue(Queue: Pwl_event_queue): cint;
    function  PrepareRead: cint;
    procedure CancelRead;
    function  ReadEvents: cint;
  end;

implementation

{ Twl_display }

function Twl_display.Connect(Name: Pchar): Pwl_display;
begin
  Result := wl_display_connect(Name);
end;

function Twl_display.ConnectTo(fd: cint): Pwl_display;
begin
  Result := wl_display_connect_to_fd(fd);
end;

procedure Twl_display.Disconnect;
begin
  wl_display_disconnect(@self);
end;

function Twl_display.GetFD: cint;
begin
  Result := wl_display_get_fd(@self);
end;

function Twl_display.Dispatch: cint;
begin
  Result := wl_display_dispatch(@self);
end;

function Twl_display.DispatchQueue(Queue: Pwl_event_queue): cint;
begin
  Result := wl_display_dispatch_queue(@self, Queue);
end;

function Twl_display.DispatchQueuePending: cint;
begin
  Result := wl_display_dispatch_pending(@self);
end;

function Twl_display.GetError: cint;
begin
  Result := wl_display_get_error(@self);
end;

function Twl_display.GetProtocolError(&interface: PPwl_interface; id: pcuint32): cuint32;
begin
  Result := wl_display_get_protocol_error(@self, &interface, id);
end;

function Twl_display.Flush: cint;
begin
  Result := wl_display_flush(@self);
end;

function Twl_display.RoundtripQueue(Queue: Pwl_event_queue): cint;
begin
  Result := wl_display_roundtrip_queue(@self, Queue);
end;

function Twl_display.Roundtrip: cint;
begin
  Result := wl_display_roundtrip(@self);
end;

function Twl_display.CreateQueue: Pwl_event_queue;
begin
  Result := wl_display_create_queue(@self);
end;

function Twl_display.PrepareReadQueue(Queue: Pwl_event_queue): cint;
begin
  Result := wl_display_prepare_read_queue(@self, Queue);
end;

function Twl_display.PrepareRead: cint;
begin
  Result := wl_display_prepare_read(@self);
end;

procedure Twl_display.CancelRead;
begin
  wl_display_cancel_read(@self);
end;

function Twl_display.ReadEvents: cint;
begin
  Result := wl_display_read_events(@self);
end;

{ Twl_proxy_wrapper }

procedure Twl_proxy_wrapper.WrapperDestroy;
begin
  wl_proxy_wrapper_destroy(@Self);
end;


{ Twl_proxy }

procedure Twl_proxy.MarshalArray(opcode: cint32; args: Pwl_argument);
begin
  wl_proxy_marshal_array(@Self, opcode, args);
end;

function Twl_proxy.Create(factory: Pwl_proxy; &interface: Pwl_interface): Pwl_proxy;
begin
  Result := wl_proxy_create(factory, &interface);
end;

function Twl_proxy.CreateWrapper: Pwl_proxy_wrapper;
begin
  Result := wl_proxy_create_wrapper(@Self);
end;

procedure Twl_proxy.Destroy;
begin
  wl_proxy_destroy(@Self);
end;

function Twl_proxy.MarshalArrayConstructor(opcode: cint32; args: Pwl_argument;
  &interface: Pwl_interface): Pwl_proxy;
begin
  Result := wl_proxy_marshal_array_constructor(@Self, opcode, args, &interface);
end;

function Twl_proxy.MarshalArrayConstructorVersioned(opcode: cint32; args: Pwl_argument;
  &interface: Pwl_interface; version: cint32): Pwl_proxy;
begin
  Result := wl_proxy_marshal_array_constructor_versioned(@Self, opcode, args, &interface, version);
end;

function Twl_proxy.AddListener(impl: PPointer; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(@Self, impl, data);
end;

function Twl_proxy.GetListener: Pointer;
begin
  Result := wl_proxy_get_listener(@Self);
end;

function Twl_proxy.AddDispatcher(dispatcher: wl_dispatcher_func_t;
  dispatcher_data: pointer; data: pointer): cint;
begin
  Result := wl_proxy_add_dispatcher(@Self, dispatcher,dispatcher_data, data);
end;

procedure Twl_proxy.SetUserData(Data: Pointer);
begin
  wl_proxy_set_user_data(@Self, Data);
end;

function Twl_proxy.GetUserData: Pointer;
begin
  Result := wl_proxy_get_user_data(@Self);
end;

function Twl_proxy.GetVersion: cuint32;
begin
  Result := wl_proxy_get_version(@Self);
end;

function Twl_proxy.GetID: cuint32;
begin
  Result := wl_proxy_get_id(@Self);
end;

function Twl_proxy.GetClass: PChar;
begin
  Result := wl_proxy_get_class(@Self);
end;

procedure Twl_proxy.SetQueue(queue: Pwl_event_queue);
begin
  wl_proxy_set_queue(@Self, queue);

end;

{ Twl_event_queue }

procedure Twl_event_queue.Destroy;
begin
  wl_event_queue_destroy(@self);
end;


end.

