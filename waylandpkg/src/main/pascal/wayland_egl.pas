{*
 * Copyright © 2011 Kristian Høgsberg
 * Copyright © 2011 Benjamin Franzke
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


unit wayland_egl;

{$mode objfpc}{$H+}

{$linklib wayland-egl}

interface

uses
  Classes, SysUtils, wayland_protocol, ctypes;

type
  Pwl_egl_window = ^Twl_egl_window;
  Twl_egl_window = record end;

function  wl_egl_window_create(surface: Pwl_surface; width, height: cint) : Pwl_egl_window; cdecl; external;
procedure wl_egl_window_destroy(egl_window: Pwl_egl_window); cdecl; external;
procedure wl_egl_window_resize(egl_window: Pwl_egl_window; width, height, dx, dy: cint); cdecl; external;
procedure wl_egl_window_get_attached_size(egl_window: Pwl_egl_window; width, height: Pcint); cdecl; external;




implementation

end.

