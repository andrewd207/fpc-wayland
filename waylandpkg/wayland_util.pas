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

{** \file wayland-util.pas
 *
 * \brief Utility classes, functions, and macros.
 *}
unit wayland_util;

{$mode objfpc}{$H+}
{$packrecords c}
{$linklib wayland-client}

interface

uses
  Classes, SysUtils, ctypes;

type
  PPwl_interface = ^Pwl_interface;
  Pwl_interface = ^Twl_interface;
  Pwl_message = ^ Twl_message;
  Twl_message = record
    name: PChar;
    signature: PChar;
    types: PPwl_interface;
  end;


  Twl_interface = record
    name: PChar;
    version: cint;
    method_count: cint;
    methods: Pwl_message;
    event_count: cint;
    events: Pwl_message;
  end;

  Pwl_list = ^Twl_list;

  { Twl_list }

  Twl_list = object
    prev,
    next: Pwl_list;
    procedure Init;
    procedure Insert(element: Pwl_list);
    procedure Remove(element: Pwl_list); static;
    function  Length: cint;
    function  Empty: Boolean;
    procedure InsertList(other: Pwl_list);
  end;

  Pwl_argument = ^Twl_argument;
  Twl_argument = record
    case integer of
      0: (i: cint32);
      1: (u: cuint32);
      2: (f: cint32);
      3: (s: PChar);
      4: (o : Pointer {wl_object});
      5: (n: cuint32);
      6: (a: Pointer {wl_array});
      7: (h: cuint32);
  end;

  Pwl_array = ^Twl_array;
  Twl_array = object
    size: csize_t;
    alloc: csize_t;
    data: Pointer;
    function GetAsDWord(var AIndex: Integer; var AValue: DWord; AIncIndex: Boolean): Boolean;
  end;

  wl_dispatcher_func_t = function (arg0: Pointer; arg1: Pointer; arg2: cuint32;
				    {const} message: Pwl_message;
				    argument: Pwl_argument): cint; cdecl;


  wl_log_func_t = procedure (char :pchar; va_list: Pointer); cdecl; // not sure how to use va_list, it's a record type afaik.

  Twl_iterator_result = (
	//** Stop the iteration */
	WL_ITERATOR_STOP = 0,
	//** Continue the iteration */
	WL_ITERATOR_CONTINUE = 1);

procedure wl_list_init(list: Pwl_list); cdecl; external;
procedure wl_list_insert(list: Pwl_list; elm: Pwl_list); cdecl; external;
procedure wl_list_remove(element: Pwl_list); cdecl; external;
function  wl_list_length(list: Pwl_list): cint; cdecl; external;
function  wl_list_empty(list: Pwl_list):cint; cdecl; external;
procedure wl_list_insert_list(list: Pwl_list; other: Pwl_list); cdecl; external;

procedure wl_array_init(&array: Pwl_array); cdecl; external;
procedure wl_array_release(&array: Pwl_array); cdecl; external;
function  wl_array_add(&array: Pwl_array; size: csize_t): Pointer; cdecl; external;
function  wl_array_copy(&array: Pwl_array; source: Pwl_array): Integer; cdecl; external;


implementation

{ Twl_array }

function Twl_array.GetAsDWord(var AIndex: Integer; var AValue: DWord;
  AIncIndex: Boolean): Boolean;
var
  lCount: csize_t;
begin
  Result := False;
  lCount := size div sizeof(DWord);
  if AIndex>= lCount then
    Exit;
  Result := True;
  AValue := PDword(data)[AIndex];

  if AIncIndex then
    Inc(AIndex);
end;


{ Twl_list }

procedure Twl_list.Init;
begin
  wl_list_init(@Self);
end;

procedure Twl_list.Insert(element: Pwl_list);
begin
  wl_list_insert(@Self, element);

end;

procedure Twl_list.Remove(element: Pwl_list);
begin
  wl_list_remove(element);
end;

function Twl_list.Length: cint;
begin
  Result := wl_list_length(@Self);
end;

function Twl_list.Empty: Boolean;
begin
  Result := wl_list_empty(@Self) <> 0;
end;

procedure Twl_list.InsertList(other: Pwl_list);
begin
  wl_list_insert_list(@Self, other);

end;

end.

