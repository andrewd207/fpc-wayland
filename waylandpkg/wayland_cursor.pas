{/*
 * Copyright © 2012 Intel Corporation
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
 */
 }
unit wayland_cursor;

{$mode objfpc}{$H+}
{$packrecords c}
{$linklib wayland-cursor}

interface

uses
  Classes, ctypes, wayland_util, wayland_protocol;

type
  Pwl_cursor_theme = ^Twl_cursor_theme;
  Twl_cursor_theme = record end;

  PPwl_cursor_image = ^Pwl_cursor_image;
  Pwl_cursor_image = ^Twl_cursor_image;
  Twl_cursor_image = record
    width,
    height,
    hotspot_x,
    hotspot_y: cuint32;
  end;

  Pwl_cursor = ^Twl_cursor;
  Twl_cursor = record
    image_count: cuint;
    images: PPwl_cursor_image;
    name: pchar;
  end;


function  wl_cursor_theme_load(name: pchar; size: cint; shm: Pwl_shm): Pwl_cursor_theme; cdecl; external;
procedure wl_cursor_theme_destroy(theme: Pwl_cursor_theme); cdecl; external;
function  wl_cursor_theme_get_cursor(theme: Pwl_cursor_theme; name: pchar): Pwl_cursor; cdecl; external;
function  wl_cursor_image_get_buffer(image: Pwl_cursor_image): Pwl_buffer; cdecl; external;
function  wl_cursor_frame(cursor: Pwl_cursor; time : cuint32): cint; cdecl; external;
function  wl_cursor_frame_and_duration(cursor: Pwl_cursor; time: cuint32;  duration: pcuint32): cint; cdecl; external;

implementation

end.

