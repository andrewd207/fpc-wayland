{
   * Copyright 1985, 1987, 1990, 1998  The Open Group
   * Copyright 2008  Dan Nicholson
   *
   * Permission is hereby granted, free of charge, to any person obtaining a
   * copy of this software and associated documentation files (the "Software"),
   * to deal in the Software without restriction, including without limitation
   * the rights to use, copy, modify, merge, publish, distribute, sublicense,
   * and/or sell copies of the Software, and to permit persons to whom the
   * Software is furnished to do so, subject to the following conditions:
   *
   * The above copyright notice and this permission notice shall be included in
   * all copies or substantial portions of the Software.
   *
   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
   * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   *
   * Except as contained in this notice, the names of the authors or their
   * institutions shall not be used in advertising or otherwise to promote the
   * sale, use or other dealings in this Software without prior written
   * authorization from the authors.
    }
  {***********************************************************
   * Copyright (c) 1993 by Silicon Graphics Computer Systems, Inc.
   *
   * Permission to use, copy, modify, and distribute this
   * software and its documentation for any purpose and without
   * fee is hereby granted, provided that the above copyright
   * notice appear in all copies and that both that copyright
   * notice and this permission notice appear in supporting
   * documentation, and that the name of Silicon Graphics not be
   * used in advertising or publicity pertaining to distribution
   * of the software without specific prior written permission.
   * Silicon Graphics makes no representation about the suitability
   * of this software for any purpose. It is provided "as is"
   * without any express or implied warranty.
   *
   * SILICON GRAPHICS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
   * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
   * AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL SILICON
   * GRAPHICS BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL
   * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
   * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
   * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION  WITH
   * THE USE OR PERFORMANCE OF THIS SOFTWARE.
   *
   ******************************************************* }
  {
   * Copyright © 2009-2012 Daniel Stone
   * Copyright © 2012 Intel Corporation
   * Copyright © 2012 Ran Benita
   *
   * Permission is hereby granted, free of charge, to any person obtaining a
   * copy of this software and associated documentation files (the "Software"),
   * to deal in the Software without restriction, including without limitation
   * the rights to use, copy, modify, merge, publish, distribute, sublicense,
   * and/or sell copies of the Software, and to permit persons to whom the
   * Software is furnished to do so, subject to the following conditions:
   *
   * The above copyright notice and this permission notice (including the next
   * paragraph) shall be included in all copies or substantial portions of the
   * Software.
   *
   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
   * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
   * DEALINGS IN THE SOFTWARE.
   *
   * Author: Daniel Stone <daniel@fooishbar.org>
    }
unit libxkbcommon;
{$MODE objfpc}{$h+}
{$packrecords c}
{$calling c}


interface

uses ctypes, dynlibs;

const
  cLibxkbcommon = 'libxkbcommon.so';

{$i libxkbcommon-keys.inc}

type
    Pxkb_context = ^xkb_context;
    xkb_context = record
        {undefined structure}
      end;

    Pxkb_keymap = ^xkb_keymap;
    xkb_keymap = record
        {undefined structure}
      end;

    Pxkb_state = ^xkb_state;
    xkb_state = record
        {undefined structure}
      end;


    Pxkb_keycode_t = ^xkb_keycode_t;
    xkb_keycode_t = cuint32;

    PPxkb_keysym_t = ^Pxkb_keysym_t;
    Pxkb_keysym_t = ^xkb_keysym_t;
    xkb_keysym_t = cuint32;

    Pxkb_layout_index_t = ^xkb_layout_index_t;
    xkb_layout_index_t = cuint32;
  {* A mask of layout indices.  }

    Pxkb_layout_mask_t = ^xkb_layout_mask_t;
    xkb_layout_mask_t = cuint32;

    Pxkb_level_index_t = ^xkb_level_index_t;
    xkb_level_index_t = cuint32;

    Pxkb_mod_index_t = ^xkb_mod_index_t;
    xkb_mod_index_t = cuint32;
  {* A mask of modifier indices.  }

    Pxkb_mod_mask_t = ^xkb_mod_mask_t;
    xkb_mod_mask_t = cuint32;

    Pxkb_led_index_t = ^xkb_led_index_t;
    xkb_led_index_t = cuint32;
  {* A mask of LED indices.  }

    Pxkb_led_mask_t = ^xkb_led_mask_t;
    xkb_led_mask_t = cuint32;

  function xkb_keycode_is_legal_ext(key : longint) : Boolean;
  function xkb_keycode_is_legal_x11(key : longint) : Boolean;

  const
    XKB_KEYCODE_INVALID = $ffffffff;
    XKB_LAYOUT_INVALID = $ffffffff;
    XKB_LEVEL_INVALID = $ffffffff;
    XKB_MOD_INVALID = $ffffffff;
    XKB_LED_INVALID = $ffffffff;
    XKB_KEYCODE_MAX = $ffffffff-1;
     type
    Pxkb_rule_names = ^xkb_rule_names;
    xkb_rule_names = record
        rules : pchar;
        model : pchar;
        layout : pchar;
        variant : pchar;
        options : pchar;
      end;


  var
    xkb_keysym_get_name : function(keysym:xkb_keysym_t; buffer:pchar; size:csize_t):cint;
  {* Flags for xkb_keysym_from_name().  }
  {* Do not apply any flags.  }
  {* Find keysym by case-insensitive search.  }

  type
    xkb_keysym_flags = (XKB_KEYSYM_NO_FLAGS := 0,XKB_KEYSYM_CASE_INSENSITIVE := 1 shl 0
      );



  var
    xkb_keysym_from_name : function(name:pchar; flags:xkb_keysym_flags):xkb_keysym_t;
    xkb_keysym_to_utf8 : function(keysym:xkb_keysym_t; buffer:pchar; size:csize_t):cint;
    xkb_keysym_to_utf32 : function(keysym:xkb_keysym_t):cuint32;
  {* Flags for context creation.  }
  {* Do not apply any context flags.  }
  {* Create this context with an empty include path.  }
  {*
       * Don't take RMLVO names from the environment.
       * @since 0.3.0
        }

  type
    xkb_context_flags = (XKB_CONTEXT_NO_FLAGS := 0,XKB_CONTEXT_NO_DEFAULT_INCLUDES := 1 shl 0,
      XKB_CONTEXT_NO_ENVIRONMENT_NAMES := 1 shl 1
      );


  var
    xkb_context_new : function(flags:xkb_context_flags):Pxkb_context;
    xkb_context_ref : function(context:Pxkb_context):Pxkb_context;
    xkb_context_unref : procedure(context:Pxkb_context);
    xkb_context_set_user_data : procedure(context:Pxkb_context; user_data:pointer);
    xkb_context_get_user_data : function(context:Pxkb_context):pointer;

    xkb_context_include_path_append : function(context:Pxkb_context; path:pchar):cint;
    xkb_context_include_path_append_default : function(context:Pxkb_context):cint;
    xkb_context_include_path_reset_defaults : function(context:Pxkb_context):cint;
    xkb_context_include_path_clear : procedure(context:Pxkb_context);
    xkb_context_num_include_paths : function(context:Pxkb_context):cuint;

    xkb_context_include_path_get : function(context:Pxkb_context; index:cuint):pchar;
  {* Specifies a logging level.  }
  {*< Log critical internal errors only.  }
  {*< Log all errors.  }
  {*< Log warnings and errors.  }
  {*< Log information, warnings, and errors.  }
  {*< Log everything.  }

  type
    xkb_log_level = (XKB_LOG_LEVEL_CRITICAL := 10,XKB_LOG_LEVEL_ERROR := 20,
      XKB_LOG_LEVEL_WARNING := 30,XKB_LOG_LEVEL_INFO := 40,
      XKB_LOG_LEVEL_DEBUG := 50);


  var
    xkb_context_set_log_level : procedure(context:Pxkb_context; level:xkb_log_level);
    xkb_context_get_log_level : function(context:Pxkb_context):xkb_log_level;
    xkb_context_set_log_verbosity : procedure(context:Pxkb_context; verbosity:cint);
    xkb_context_get_log_verbosity : function(context:Pxkb_context):cint;

  type
    xkb_context_set_log_fn_param_proc = procedure (context:Pxkb_context; level:xkb_log_level; format:pchar; args:Pointer{va_list});
  var
    xkb_context_set_log_fn : procedure(context:Pxkb_context; log_fn: xkb_context_set_log_fn_param_proc);
  {* Flags for keymap compilation.  }
  {* Do not apply any flags.  }

  type
    xkb_keymap_compile_flags = (XKB_KEYMAP_COMPILE_NO_FLAGS := 0);



  var
    xkb_keymap_new_from_names : function(context:Pxkb_context; names:Pxkb_rule_names; flags:xkb_keymap_compile_flags):Pxkb_keymap;
  {* The possible keymap formats.  }
  {* The current/classic XKB text format, as generated by xkbcomp -xkb.  }

  type
    xkb_keymap_format = (XKB_KEYMAP_FORMAT_TEXT_V1 := 1);


  var
    xkb_keymap_new_from_file : function(context:Pxkb_context; &file: cint; format:xkb_keymap_format; flags:xkb_keymap_compile_flags):Pxkb_keymap;

    xkb_keymap_new_from_string : function(context:Pxkb_context; _string:pchar; format:xkb_keymap_format; flags:xkb_keymap_compile_flags):Pxkb_keymap;

    xkb_keymap_new_from_buffer : function(context:Pxkb_context; buffer:pchar; length:csize_t; format:xkb_keymap_format; flags:xkb_keymap_compile_flags):Pxkb_keymap;
    xkb_keymap_ref : function(keymap:Pxkb_keymap):Pxkb_keymap;
    xkb_keymap_unref : procedure(keymap:Pxkb_keymap);

  { was #define dname def_expr }
  function XKB_KEYMAP_USE_ORIGINAL_FORMAT : xkb_keymap_format;


  var
    xkb_keymap_get_as_string : function(keymap:Pxkb_keymap; format:xkb_keymap_format):pchar;
    xkb_keymap_min_keycode : function(keymap:Pxkb_keymap):xkb_keycode_t;
    xkb_keymap_max_keycode : function(keymap:Pxkb_keymap):xkb_keycode_t;

  type

    xkb_keymap_key_iter_t = procedure (keymap:Pxkb_keymap; key:xkb_keycode_t; data:pointer);cdecl;

  var
    xkb_keymap_key_for_each : procedure(keymap:Pxkb_keymap; iter:xkb_keymap_key_iter_t; data:pointer);

    xkb_keymap_key_get_name : function(keymap:Pxkb_keymap; key:xkb_keycode_t):pchar;

    xkb_keymap_key_by_name : function(keymap:Pxkb_keymap; name:pchar):xkb_keycode_t;
    xkb_keymap_num_mods : function(keymap:Pxkb_keymap):xkb_mod_index_t;

    xkb_keymap_mod_get_name : function(keymap:Pxkb_keymap; idx:xkb_mod_index_t):pchar;

    xkb_keymap_mod_get_index : function(keymap:Pxkb_keymap; name:pchar):xkb_mod_index_t;
    xkb_keymap_num_layouts : function(keymap:Pxkb_keymap):xkb_layout_index_t;

    xkb_keymap_layout_get_name : function(keymap:Pxkb_keymap; idx:xkb_layout_index_t):pchar;

    xkb_keymap_layout_get_index : function(keymap:Pxkb_keymap; name:pchar):xkb_layout_index_t;
    xkb_keymap_num_leds : function(keymap:Pxkb_keymap):xkb_led_index_t;

    xkb_keymap_led_get_name : function(keymap:Pxkb_keymap; idx:xkb_led_index_t):pchar;

    xkb_keymap_led_get_index : function(keymap:Pxkb_keymap; name:pchar):xkb_led_index_t;
    xkb_keymap_num_layouts_for_key : function(keymap:Pxkb_keymap; key:xkb_keycode_t):xkb_layout_index_t;
    xkb_keymap_num_levels_for_key : function(keymap:Pxkb_keymap; key:xkb_keycode_t; layout:xkb_layout_index_t):xkb_level_index_t;

    xkb_keymap_key_get_syms_by_level : function(keymap:Pxkb_keymap; key:xkb_keycode_t; layout:xkb_layout_index_t; level:xkb_level_index_t; syms_out:PPxkb_keysym_t):cint;
    xkb_keymap_key_repeats : function(keymap:Pxkb_keymap; key:xkb_keycode_t):cint;
    xkb_state_new : function(keymap:Pxkb_keymap):Pxkb_state;
    xkb_state_ref : function(state:Pxkb_state):Pxkb_state;
    xkb_state_unref : procedure(state:Pxkb_state);
    xkb_state_get_keymap : function(state:Pxkb_state):Pxkb_keymap;
  {* Specifies the direction of the key (press / release).  }
  {*< The key was released.  }
  {*< The key was pressed.  }

  type
    xkb_key_direction = (XKB_KEY_UP_,XKB_KEY_DOWN_);


    xkb_state_component = (XKB_STATE_MODS_DEPRESSED := 1 shl 0,XKB_STATE_MODS_LATCHED := 1 shl 1,
      XKB_STATE_MODS_LOCKED := 1 shl 2,XKB_STATE_MODS_EFFECTIVE := 1 shl 3,
      XKB_STATE_LAYOUT_DEPRESSED := 1 shl 4,XKB_STATE_LAYOUT_LATCHED := 1 shl 5,
      XKB_STATE_LAYOUT_LOCKED := 1 shl 6,XKB_STATE_LAYOUT_EFFECTIVE := 1 shl 7,
      XKB_STATE_LEDS := 1 shl 8);


  var
    xkb_state_update_key : function(state:Pxkb_state; key:xkb_keycode_t; direction:xkb_key_direction):xkb_state_component;
    xkb_state_update_mask : function(state:Pxkb_state; depressed_mods:xkb_mod_mask_t; latched_mods:xkb_mod_mask_t; locked_mods:xkb_mod_mask_t; depressed_layout:xkb_layout_index_t;
      latched_layout:xkb_layout_index_t; locked_layout:xkb_layout_index_t):xkb_state_component;

    xkb_state_key_get_syms : function(state:Pxkb_state; key:xkb_keycode_t; syms_out:PPxkb_keysym_t):cint;
    xkb_state_key_get_utf8 : function(state:Pxkb_state; key:xkb_keycode_t; buffer:pchar; size:csize_t):cint;
    xkb_state_key_get_utf32 : function(state:Pxkb_state; key:xkb_keycode_t):cuint32;
    xkb_state_key_get_one_sym : function(state:Pxkb_state; key:xkb_keycode_t):xkb_keysym_t;
    xkb_state_key_get_layout : function(state:Pxkb_state; key:xkb_keycode_t):xkb_layout_index_t;
    xkb_state_key_get_level : function(state:Pxkb_state; key:xkb_keycode_t; layout:xkb_layout_index_t):xkb_level_index_t;

  type
    xkb_state_match = (XKB_STATE_MATCH_ANY := 1 shl 0,XKB_STATE_MATCH_ALL := 1 shl 1,
      XKB_STATE_MATCH_NON_EXCLUSIVE := 1 shl 16
      );


  var
    xkb_state_serialize_mods : function(state:Pxkb_state; components:xkb_state_component):xkb_mod_mask_t;
    xkb_state_serialize_layout : function(state:Pxkb_state; components:xkb_state_component):xkb_layout_index_t;

    xkb_state_mod_name_is_active : function(state:Pxkb_state; name:pchar; _type:xkb_state_component):cint;
    xkb_state_mod_names_are_active : function(state:Pxkb_state; _type:xkb_state_component; match:xkb_state_match):cint; varargs;
    xkb_state_mod_index_is_active : function(state:Pxkb_state; idx:xkb_mod_index_t; _type:xkb_state_component):cint;
    xkb_state_mod_indices_are_active : function(state:Pxkb_state; _type:xkb_state_component; match:xkb_state_match):cint; varargs;

  type
    xkb_consumed_mode = (XKB_CONSUMED_MODE_XKB,XKB_CONSUMED_MODE_GTK
      );


  var
    xkb_state_key_get_consumed_mods2 : function(state:Pxkb_state; key:xkb_keycode_t; mode:xkb_consumed_mode):xkb_mod_mask_t;
    xkb_state_key_get_consumed_mods : function(state:Pxkb_state; key:xkb_keycode_t):xkb_mod_mask_t;
    xkb_state_mod_index_is_consumed2 : function(state:Pxkb_state; key:xkb_keycode_t; idx:xkb_mod_index_t; mode:xkb_consumed_mode):cint;
    xkb_state_mod_index_is_consumed : function(state:Pxkb_state; key:xkb_keycode_t; idx:xkb_mod_index_t):cint;
    xkb_state_mod_mask_remove_consumed : function(state:Pxkb_state; key:xkb_keycode_t; mask:xkb_mod_mask_t):xkb_mod_mask_t;

    xkb_state_layout_name_is_active : function(state:Pxkb_state; name:pchar; _type:xkb_state_component):cint;
    xkb_state_layout_index_is_active : function(state:Pxkb_state; idx:xkb_layout_index_t; _type:xkb_state_component):cint;

    xkb_state_led_name_is_active : function(state:Pxkb_state; name:pchar):cint;
    xkb_state_led_index_is_active : function(state:Pxkb_state; idx:xkb_led_index_t):cint;
 type
        Pxkb_compose_state = ^xkb_compose_state;
    xkb_compose_state = record
        {undefined structure}
      end;

  {* Flags affecting Compose file compilation.  }
  {* Do not apply any flags.  }
    xkb_compose_compile_flags = (XKB_COMPOSE_COMPILE_NO_FLAGS := 0);

  {* The recognized Compose file formats.  }
  {* The classic libX11 Compose text format, described in Compose(5).  }
    xkb_compose_format = (XKB_COMPOSE_FORMAT_TEXT_V1 := 1);

(* Const before type ignored *)

  Pxkb_compose_table = pointer;

  var
    xkb_compose_table_new_from_locale : function(context:Pxkb_context; locale:pchar; flags:xkb_compose_compile_flags):Pxkb_compose_table;
(* Const before type ignored *)
    xkb_compose_table_new_from_file : function(context:Pxkb_context; &file: cint; locale:pchar; format:xkb_compose_format; flags:xkb_compose_compile_flags):Pxkb_compose_table;
(* Const before type ignored *)
(* Const before type ignored *)
    xkb_compose_table_new_from_buffer : function(context:Pxkb_context; buffer:pchar; length:csize_t; locale:pchar; format:xkb_compose_format;
      flags:xkb_compose_compile_flags):Pxkb_compose_table;
    xkb_compose_table_ref : function(table:Pxkb_compose_table):Pxkb_compose_table;
    xkb_compose_table_unref : procedure(table:Pxkb_compose_table);
  {* Flags for compose state creation.  }
  {* Do not apply any flags.  }

  type
    xkb_compose_state_flags = (XKB_COMPOSE_STATE_NO_FLAGS := 0);


  var
    xkb_compose_state_new : function(table:Pxkb_compose_table; flags:xkb_compose_state_flags):Pxkb_compose_state;
    xkb_compose_state_ref : function(state:Pxkb_compose_state):Pxkb_compose_state;
    xkb_compose_state_unref : procedure(state:Pxkb_compose_state);
    xkb_compose_state_get_compose_table : function(state:Pxkb_compose_state):Pxkb_compose_table;
  {* Status of the Compose sequence state machine.  }
  {* The initial state; no sequence has started yet.  }
  {* In the middle of a sequence.  }
  {* A complete sequence has been matched.  }
  {* The last sequence was cancelled due to an unmatched keysym.  }

  type
    xkb_compose_status = (XKB_COMPOSE_NOTHING,XKB_COMPOSE_COMPOSING,
      XKB_COMPOSE_COMPOSED,XKB_COMPOSE_CANCELLED
      );

  {* The effect of a keysym fed to xkb_compose_state_feed().  }
  {* The keysym had no effect - it did not affect the status.  }
  {* The keysym started, advanced or cancelled a sequence.  }
    xkb_compose_feed_result = (XKB_COMPOSE_FEED_IGNORED,XKB_COMPOSE_FEED_ACCEPTED
      );


  var
    xkb_compose_state_feed : function(state:Pxkb_compose_state; keysym:xkb_keysym_t):xkb_compose_feed_result;
    xkb_compose_state_reset : procedure(state:Pxkb_compose_state);
    xkb_compose_state_get_status : function(state:Pxkb_compose_state):xkb_compose_status;
    xkb_compose_state_get_utf8 : function(state:Pxkb_compose_state; buffer:pchar; size:csize_t):cint;
    xkb_compose_state_get_one_sym : function(state:Pxkb_compose_state):xkb_keysym_t;

implementation
  uses
     SysUtils;


  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function xkb_keycode_is_legal_ext(key : longint) : Boolean;
  begin
    xkb_keycode_is_legal_ext:=key<=XKB_KEYCODE_MAX;
  end;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function xkb_keycode_is_legal_x11(key : longint) : Boolean;
  begin
    xkb_keycode_is_legal_x11:=(key>=8) and (key<=255);
  end;

                                                                                                          { was #define dname def_expr }
  function XKB_KEYMAP_USE_ORIGINAL_FORMAT : xkb_keymap_format;
    begin
      XKB_KEYMAP_USE_ORIGINAL_FORMAT:=xkb_keymap_format(-(1));
    end;



   var
     hlib : tlibhandle;


   procedure Freexkbcommon;
     begin
       if hlib <> 0 then
         FreeLibrary(hlib);
       xkb_keysym_get_name:=nil;
       xkb_keysym_from_name:=nil;
       xkb_keysym_to_utf8:=nil;
       xkb_keysym_to_utf32:=nil;
       xkb_context_new:=nil;
       xkb_context_ref:=nil;
       xkb_context_unref:=nil;
       xkb_context_set_user_data:=nil;
       xkb_context_get_user_data:=nil;
       xkb_context_include_path_append:=nil;
       xkb_context_include_path_append_default:=nil;
       xkb_context_include_path_reset_defaults:=nil;
       xkb_context_include_path_clear:=nil;
       xkb_context_num_include_paths:=nil;
       xkb_context_include_path_get:=nil;
       xkb_context_set_log_level:=nil;
       xkb_context_get_log_level:=nil;
       xkb_context_set_log_verbosity:=nil;
       xkb_context_get_log_verbosity:=nil;
       xkb_context_set_log_fn:=nil;
       xkb_keymap_new_from_names:=nil;
       xkb_keymap_new_from_file:=nil;
       xkb_keymap_new_from_string:=nil;
       xkb_keymap_new_from_buffer:=nil;
       xkb_keymap_ref:=nil;
       xkb_keymap_unref:=nil;
       xkb_keymap_get_as_string:=nil;
       xkb_keymap_min_keycode:=nil;
       xkb_keymap_max_keycode:=nil;
       xkb_keymap_key_for_each:=nil;
       xkb_keymap_key_get_name:=nil;
       xkb_keymap_key_by_name:=nil;
       xkb_keymap_num_mods:=nil;
       xkb_keymap_mod_get_name:=nil;
       xkb_keymap_mod_get_index:=nil;
       xkb_keymap_num_layouts:=nil;
       xkb_keymap_layout_get_name:=nil;
       xkb_keymap_layout_get_index:=nil;
       xkb_keymap_num_leds:=nil;
       xkb_keymap_led_get_name:=nil;
       xkb_keymap_led_get_index:=nil;
       xkb_keymap_num_layouts_for_key:=nil;
       xkb_keymap_num_levels_for_key:=nil;
       xkb_keymap_key_get_syms_by_level:=nil;
       xkb_keymap_key_repeats:=nil;
       xkb_state_new:=nil;
       xkb_state_ref:=nil;
       xkb_state_unref:=nil;
       xkb_state_get_keymap:=nil;
       xkb_state_update_key:=nil;
       xkb_state_update_mask:=nil;
       xkb_state_key_get_syms:=nil;
       xkb_state_key_get_utf8:=nil;
       xkb_state_key_get_utf32:=nil;
       xkb_state_key_get_one_sym:=nil;
       xkb_state_key_get_layout:=nil;
       xkb_state_key_get_level:=nil;
       xkb_state_serialize_mods:=nil;
       xkb_state_serialize_layout:=nil;
       xkb_state_mod_name_is_active:=nil;
       xkb_state_mod_names_are_active:=nil;
       xkb_state_mod_names_are_active:=nil;
       xkb_state_mod_index_is_active:=nil;
       xkb_state_mod_indices_are_active:=nil;
       xkb_state_mod_indices_are_active:=nil;
       xkb_state_key_get_consumed_mods2:=nil;
       xkb_state_key_get_consumed_mods:=nil;
       xkb_state_mod_index_is_consumed2:=nil;
       xkb_state_mod_index_is_consumed:=nil;
       xkb_state_mod_mask_remove_consumed:=nil;
       xkb_state_layout_name_is_active:=nil;
       xkb_state_layout_index_is_active:=nil;
       xkb_state_led_name_is_active:=nil;
       xkb_state_led_index_is_active:=nil;
       xkb_compose_table_new_from_locale:=nil;
      xkb_compose_table_new_from_file:=nil;
      xkb_compose_table_new_from_buffer:=nil;
      xkb_compose_table_ref:=nil;
      xkb_compose_table_unref:=nil;
      xkb_compose_state_new:=nil;
      xkb_compose_state_ref:=nil;
      xkb_compose_state_unref:=nil;
      xkb_compose_state_get_compose_table:=nil;
      xkb_compose_state_feed:=nil;
      xkb_compose_state_reset:=nil;
      xkb_compose_state_get_status:=nil;
      xkb_compose_state_get_utf8:=nil;
      xkb_compose_state_get_one_sym:=nil;
     end;


   procedure Loadxkbcommon(lib : pchar);
     begin
       Freexkbcommon;
       hlib:=LoadLibrary(lib);
       if hlib=0 then
         raise Exception.Create(format('Could not load library: %s',[lib]));

       pointer(xkb_keysym_get_name):=GetProcAddress(hlib,'xkb_keysym_get_name');
       pointer(xkb_keysym_from_name):=GetProcAddress(hlib,'xkb_keysym_from_name');
       pointer(xkb_keysym_to_utf8):=GetProcAddress(hlib,'xkb_keysym_to_utf8');
       pointer(xkb_keysym_to_utf32):=GetProcAddress(hlib,'xkb_keysym_to_utf32');
       pointer(xkb_context_new):=GetProcAddress(hlib,'xkb_context_new');
       pointer(xkb_context_ref):=GetProcAddress(hlib,'xkb_context_ref');
       pointer(xkb_context_unref):=GetProcAddress(hlib,'xkb_context_unref');
       pointer(xkb_context_set_user_data):=GetProcAddress(hlib,'xkb_context_set_user_data');
       pointer(xkb_context_get_user_data):=GetProcAddress(hlib,'xkb_context_get_user_data');
       pointer(xkb_context_include_path_append):=GetProcAddress(hlib,'xkb_context_include_path_append');
       pointer(xkb_context_include_path_append_default):=GetProcAddress(hlib,'xkb_context_include_path_append_default');
       pointer(xkb_context_include_path_reset_defaults):=GetProcAddress(hlib,'xkb_context_include_path_reset_defaults');
       pointer(xkb_context_include_path_clear):=GetProcAddress(hlib,'xkb_context_include_path_clear');
       pointer(xkb_context_num_include_paths):=GetProcAddress(hlib,'xkb_context_num_include_paths');
       pointer(xkb_context_include_path_get):=GetProcAddress(hlib,'xkb_context_include_path_get');
       pointer(xkb_context_set_log_level):=GetProcAddress(hlib,'xkb_context_set_log_level');
       pointer(xkb_context_get_log_level):=GetProcAddress(hlib,'xkb_context_get_log_level');
       pointer(xkb_context_set_log_verbosity):=GetProcAddress(hlib,'xkb_context_set_log_verbosity');
       pointer(xkb_context_get_log_verbosity):=GetProcAddress(hlib,'xkb_context_get_log_verbosity');
       pointer(xkb_context_set_log_fn):=GetProcAddress(hlib,'xkb_context_set_log_fn');
       pointer(xkb_keymap_new_from_names):=GetProcAddress(hlib,'xkb_keymap_new_from_names');
       pointer(xkb_keymap_new_from_file):=GetProcAddress(hlib,'xkb_keymap_new_from_file');
       pointer(xkb_keymap_new_from_string):=GetProcAddress(hlib,'xkb_keymap_new_from_string');
       pointer(xkb_keymap_new_from_buffer):=GetProcAddress(hlib,'xkb_keymap_new_from_buffer');
       pointer(xkb_keymap_ref):=GetProcAddress(hlib,'xkb_keymap_ref');
       pointer(xkb_keymap_unref):=GetProcAddress(hlib,'xkb_keymap_unref');
       pointer(xkb_keymap_get_as_string):=GetProcAddress(hlib,'xkb_keymap_get_as_string');
       pointer(xkb_keymap_min_keycode):=GetProcAddress(hlib,'xkb_keymap_min_keycode');
       pointer(xkb_keymap_max_keycode):=GetProcAddress(hlib,'xkb_keymap_max_keycode');
       pointer(xkb_keymap_key_for_each):=GetProcAddress(hlib,'xkb_keymap_key_for_each');
       pointer(xkb_keymap_key_get_name):=GetProcAddress(hlib,'xkb_keymap_key_get_name');
       pointer(xkb_keymap_key_by_name):=GetProcAddress(hlib,'xkb_keymap_key_by_name');
       pointer(xkb_keymap_num_mods):=GetProcAddress(hlib,'xkb_keymap_num_mods');
       pointer(xkb_keymap_mod_get_name):=GetProcAddress(hlib,'xkb_keymap_mod_get_name');
       pointer(xkb_keymap_mod_get_index):=GetProcAddress(hlib,'xkb_keymap_mod_get_index');
       pointer(xkb_keymap_num_layouts):=GetProcAddress(hlib,'xkb_keymap_num_layouts');
       pointer(xkb_keymap_layout_get_name):=GetProcAddress(hlib,'xkb_keymap_layout_get_name');
       pointer(xkb_keymap_layout_get_index):=GetProcAddress(hlib,'xkb_keymap_layout_get_index');
       pointer(xkb_keymap_num_leds):=GetProcAddress(hlib,'xkb_keymap_num_leds');
       pointer(xkb_keymap_led_get_name):=GetProcAddress(hlib,'xkb_keymap_led_get_name');
       pointer(xkb_keymap_led_get_index):=GetProcAddress(hlib,'xkb_keymap_led_get_index');
       pointer(xkb_keymap_num_layouts_for_key):=GetProcAddress(hlib,'xkb_keymap_num_layouts_for_key');
       pointer(xkb_keymap_num_levels_for_key):=GetProcAddress(hlib,'xkb_keymap_num_levels_for_key');
       pointer(xkb_keymap_key_get_syms_by_level):=GetProcAddress(hlib,'xkb_keymap_key_get_syms_by_level');
       pointer(xkb_keymap_key_repeats):=GetProcAddress(hlib,'xkb_keymap_key_repeats');
       pointer(xkb_state_new):=GetProcAddress(hlib,'xkb_state_new');
       pointer(xkb_state_ref):=GetProcAddress(hlib,'xkb_state_ref');
       pointer(xkb_state_unref):=GetProcAddress(hlib,'xkb_state_unref');
       pointer(xkb_state_get_keymap):=GetProcAddress(hlib,'xkb_state_get_keymap');
       pointer(xkb_state_update_key):=GetProcAddress(hlib,'xkb_state_update_key');
       pointer(xkb_state_update_mask):=GetProcAddress(hlib,'xkb_state_update_mask');
       pointer(xkb_state_key_get_syms):=GetProcAddress(hlib,'xkb_state_key_get_syms');
       pointer(xkb_state_key_get_utf8):=GetProcAddress(hlib,'xkb_state_key_get_utf8');
       pointer(xkb_state_key_get_utf32):=GetProcAddress(hlib,'xkb_state_key_get_utf32');
       pointer(xkb_state_key_get_one_sym):=GetProcAddress(hlib,'xkb_state_key_get_one_sym');
       pointer(xkb_state_key_get_layout):=GetProcAddress(hlib,'xkb_state_key_get_layout');
       pointer(xkb_state_key_get_level):=GetProcAddress(hlib,'xkb_state_key_get_level');
       pointer(xkb_state_serialize_mods):=GetProcAddress(hlib,'xkb_state_serialize_mods');
       pointer(xkb_state_serialize_layout):=GetProcAddress(hlib,'xkb_state_serialize_layout');
       pointer(xkb_state_mod_name_is_active):=GetProcAddress(hlib,'xkb_state_mod_name_is_active');
       pointer(xkb_state_mod_names_are_active):=GetProcAddress(hlib,'xkb_state_mod_names_are_active');
       pointer(xkb_state_mod_names_are_active):=GetProcAddress(hlib,'xkb_state_mod_names_are_active');
       pointer(xkb_state_mod_index_is_active):=GetProcAddress(hlib,'xkb_state_mod_index_is_active');
       pointer(xkb_state_mod_indices_are_active):=GetProcAddress(hlib,'xkb_state_mod_indices_are_active');
       pointer(xkb_state_mod_indices_are_active):=GetProcAddress(hlib,'xkb_state_mod_indices_are_active');
       pointer(xkb_state_key_get_consumed_mods2):=GetProcAddress(hlib,'xkb_state_key_get_consumed_mods2');
       pointer(xkb_state_key_get_consumed_mods):=GetProcAddress(hlib,'xkb_state_key_get_consumed_mods');
       pointer(xkb_state_mod_index_is_consumed2):=GetProcAddress(hlib,'xkb_state_mod_index_is_consumed2');
       pointer(xkb_state_mod_index_is_consumed):=GetProcAddress(hlib,'xkb_state_mod_index_is_consumed');
       pointer(xkb_state_mod_mask_remove_consumed):=GetProcAddress(hlib,'xkb_state_mod_mask_remove_consumed');
       pointer(xkb_state_layout_name_is_active):=GetProcAddress(hlib,'xkb_state_layout_name_is_active');
       pointer(xkb_state_layout_index_is_active):=GetProcAddress(hlib,'xkb_state_layout_index_is_active');
       pointer(xkb_state_led_name_is_active):=GetProcAddress(hlib,'xkb_state_led_name_is_active');
       pointer(xkb_state_led_index_is_active):=GetProcAddress(hlib,'xkb_state_led_index_is_active');
       pointer(xkb_compose_table_new_from_locale):=GetProcAddress(hlib,'xkb_compose_table_new_from_locale');
      pointer(xkb_compose_table_new_from_file):=GetProcAddress(hlib,'xkb_compose_table_new_from_file');
      pointer(xkb_compose_table_new_from_buffer):=GetProcAddress(hlib,'xkb_compose_table_new_from_buffer');
      pointer(xkb_compose_table_ref):=GetProcAddress(hlib,'xkb_compose_table_ref');
      pointer(xkb_compose_table_unref):=GetProcAddress(hlib,'xkb_compose_table_unref');
      pointer(xkb_compose_state_new):=GetProcAddress(hlib,'xkb_compose_state_new');
      pointer(xkb_compose_state_ref):=GetProcAddress(hlib,'xkb_compose_state_ref');
      pointer(xkb_compose_state_unref):=GetProcAddress(hlib,'xkb_compose_state_unref');
      pointer(xkb_compose_state_get_compose_table):=GetProcAddress(hlib,'xkb_compose_state_get_compose_table');
      pointer(xkb_compose_state_feed):=GetProcAddress(hlib,'xkb_compose_state_feed');
      pointer(xkb_compose_state_reset):=GetProcAddress(hlib,'xkb_compose_state_reset');
      pointer(xkb_compose_state_get_status):=GetProcAddress(hlib,'xkb_compose_state_get_status');
      pointer(xkb_compose_state_get_utf8):=GetProcAddress(hlib,'xkb_compose_state_get_utf8');
      pointer(xkb_compose_state_get_one_sym):=GetProcAddress(hlib,'xkb_compose_state_get_one_sym');
     end;


 initialization
   Loadxkbcommon(cLibxkbcommon);
 finalization
   Freexkbcommon;

 end.

