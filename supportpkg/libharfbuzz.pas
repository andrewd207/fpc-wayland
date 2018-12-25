{
   * Copyright © 2009  Red Hat, Inc.
   * Copyright © 2011  Codethink Limited
   * Copyright © 2011,2012  Google, Inc.
   *
   *  This is part of HarfBuzz, a text shaping library.
   *
   * Permission is hereby granted, without written agreement and without
   * license or royalty fees, to use, copy, modify, and distribute this
   * software and its documentation for any purpose, provided that the
   * above copyright notice and the following two paragraphs appear in
   * all copies of this software.
   *
   * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
   * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
   * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
   * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
   * DAMAGE.
   *
   * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
   * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
   * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
   * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
   * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
   *
   * Red Hat Author(s): Behdad Esfahbod
   * Codethink Author(s): Ryan Lortie
   * Google Author(s): Behdad Esfahbod
    }
unit libharfbuzz;

{$MODE objfpc}{$H+}
{$PACKRECORDS C}

interface

uses ctypes, dynlibs;

const
  cHarfBuzzLibName = 'libharfbuzz.so';

type
  hb_bool_t = cint;

  hb_codepoint_t = cuint32;
  hb_position_t = cint32;
  hb_mask_t = cuint32;

  Phb_var_int_t = ^hb_var_int_t;
  hb_var_int_t = record
  case i: integer of
    0: (u32: cuint32) ;
    1: (i32: cint32);
    2: (u16: array [0..1] of cuint16);
    3: (i16: array [0..1] of cint16);
    4: (u8: array [0..3] of cuint8);
    5: (i8: array [0..3] of cint8);
  end;

 hb_direction_t = (
   HB_DIRECTION_INVALID = 0,
   HB_DIRECTION_LTR = 4,
   HB_DIRECTION_RTL,
   HB_DIRECTION_TTB,
   HB_DIRECTION_BTT
 );

 hb_language_t = PChar; // opaque type
 hb_tag_t = DWord;

 hb_script_t = hb_tag_t; // see hb-common.h for values
 //HB_SCRIPT_COMMON = HB_TAG ('Z','y','y','y'),
 //#define HB_TAG(c1,c2,c3,c4) ((hb_tag_t)((((uint8_t)(c1))<<24)|(((uint8_t)(c2))<<16)|(((uint8_t)(c3))<<8)|((uint8_t)(c4))))
 const
   HB_SCRIPT_COMMON = (Ord('Z') shl 24) or (Ord('y') shl 16) or (Ord('y') shl 8) or Ord('y');

   HB_TAG_NONE = $00000000;
   HB_TAG_MAX  = $FFFFFFFF;
   HB_TAG_MAX_SIGNED = $7FFFFFFF;

 type
   Phb_user_data_key_t = ^hb_user_data_key_t;
   hb_user_data_key_t = record
  // <private>
     unused: Pchar;
   end;
   hb_destroy_func_t = procedure (user_data: pointer); cdecl;

   Phb_feature_t = ^hb_feature_t;
   hb_feature_t = record
     tag: hb_tag_t;
     value: cuint32;
     start: cuint;
     end_: cuint;
   end;

   Phb_variation_t = ^hb_variation_t;
   hb_variation_t = record
     tag: hb_tag_t ;
     value: cfloat;
   end;

   hb_memory_mode_t = (
     HB_MEMORY_MODE_DUPLICATE = 0,
     HB_MEMORY_MODE_READONLY = 1,
     HB_MEMORY_MODE_WRITABLE = 2,
     HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE = 3
   );

   Phb_blob_t = ^hb_blob_t;
   hb_blob_t = record end; //opaque type

   hb_unicode_general_category_t = (HB_UNICODE_GENERAL_CATEGORY_CONTROL,
      HB_UNICODE_GENERAL_CATEGORY_FORMAT,HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED,
      HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE,
      HB_UNICODE_GENERAL_CATEGORY_SURROGATE,
      HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER,
      HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER,
      HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER,
      HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER,
      HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER,
      HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK,
      HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK,
      HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK,
      HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER,
      HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER,
      HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER,
      HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION,
      HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION,
      HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION,
      HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION,
      HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION,
      HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION,
      HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION,
      HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL,
      HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL,
      HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL,
      HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL,
      HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR,
      HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR,
      HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR
      );
  hb_unicode_combining_class_t = (HB_UNICODE_COMBINING_CLASS_NOT_REORDERED := 0,
      HB_UNICODE_COMBINING_CLASS_OVERLAY := 1,
      HB_UNICODE_COMBINING_CLASS_NUKTA := 7,
      HB_UNICODE_COMBINING_CLASS_KANA_VOICING := 8,
      HB_UNICODE_COMBINING_CLASS_VIRAMA := 9,
      HB_UNICODE_COMBINING_CLASS_CCC10 := 10,
      HB_UNICODE_COMBINING_CLASS_CCC11 := 11,
      HB_UNICODE_COMBINING_CLASS_CCC12 := 12,
      HB_UNICODE_COMBINING_CLASS_CCC13 := 13,
      HB_UNICODE_COMBINING_CLASS_CCC14 := 14,
      HB_UNICODE_COMBINING_CLASS_CCC15 := 15,
      HB_UNICODE_COMBINING_CLASS_CCC16 := 16,
      HB_UNICODE_COMBINING_CLASS_CCC17 := 17,
      HB_UNICODE_COMBINING_CLASS_CCC18 := 18,
      HB_UNICODE_COMBINING_CLASS_CCC19 := 19,
      HB_UNICODE_COMBINING_CLASS_CCC20 := 20,
      HB_UNICODE_COMBINING_CLASS_CCC21 := 21,
      HB_UNICODE_COMBINING_CLASS_CCC22 := 22,
      HB_UNICODE_COMBINING_CLASS_CCC23 := 23,
      HB_UNICODE_COMBINING_CLASS_CCC24 := 24,
      HB_UNICODE_COMBINING_CLASS_CCC25 := 25,
      HB_UNICODE_COMBINING_CLASS_CCC26 := 26,
      HB_UNICODE_COMBINING_CLASS_CCC27 := 27,
      HB_UNICODE_COMBINING_CLASS_CCC28 := 28,
      HB_UNICODE_COMBINING_CLASS_CCC29 := 29,
      HB_UNICODE_COMBINING_CLASS_CCC30 := 30,
      HB_UNICODE_COMBINING_CLASS_CCC31 := 31,
      HB_UNICODE_COMBINING_CLASS_CCC32 := 32,
      HB_UNICODE_COMBINING_CLASS_CCC33 := 33,
      HB_UNICODE_COMBINING_CLASS_CCC34 := 34,
      HB_UNICODE_COMBINING_CLASS_CCC35 := 35,
      HB_UNICODE_COMBINING_CLASS_CCC36 := 36,
      HB_UNICODE_COMBINING_CLASS_CCC84 := 84,
      HB_UNICODE_COMBINING_CLASS_CCC91 := 91,
      HB_UNICODE_COMBINING_CLASS_CCC103 := 103,
      HB_UNICODE_COMBINING_CLASS_CCC107 := 107,
      HB_UNICODE_COMBINING_CLASS_CCC118 := 118,
      HB_UNICODE_COMBINING_CLASS_CCC122 := 122,
      HB_UNICODE_COMBINING_CLASS_CCC129 := 129,
      HB_UNICODE_COMBINING_CLASS_CCC130 := 130,
      HB_UNICODE_COMBINING_CLASS_CCC133 := 132,
      HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT := 200,
      HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW := 202,
      HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE := 214,
      HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT := 216,
      HB_UNICODE_COMBINING_CLASS_BELOW_LEFT := 218,
      HB_UNICODE_COMBINING_CLASS_BELOW := 220,
      HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT := 222,
      HB_UNICODE_COMBINING_CLASS_LEFT := 224,
      HB_UNICODE_COMBINING_CLASS_RIGHT := 226,
      HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT := 228,
      HB_UNICODE_COMBINING_CLASS_ABOVE := 230,
      HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT := 232,
      HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW := 233,
      HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE := 234,
      HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT := 240,
      HB_UNICODE_COMBINING_CLASS_INVALID := 255
      );

      Phb_unicode_funcs_t  = ^hb_unicode_funcs_t;
      hb_unicode_funcs_t = record end;
      Phb_codepoint_t  = ^hb_codepoint_t;


      hb_unicode_combining_class_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t; user_data:pointer):hb_unicode_combining_class_t;cdecl;
      hb_unicode_eastasian_width_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t; user_data:pointer):cuint;cdecl;
      hb_unicode_general_category_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t; user_data:pointer):hb_unicode_general_category_t;cdecl;
      hb_unicode_mirroring_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t; user_data:pointer):hb_codepoint_t;cdecl;
      hb_unicode_script_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t; user_data:pointer):hb_script_t;cdecl;
      hb_unicode_compose_func_t = function (ufuncs:Phb_unicode_funcs_t; a:hb_codepoint_t; b:hb_codepoint_t; ab:Phb_codepoint_t; user_data:pointer):hb_bool_t;cdecl;
      hb_unicode_decompose_func_t = function (ufuncs:Phb_unicode_funcs_t; ab:hb_codepoint_t; a:Phb_codepoint_t; b:Phb_codepoint_t; user_data:pointer):hb_bool_t;cdecl;
      hb_unicode_decompose_compatibility_func_t = function (ufuncs:Phb_unicode_funcs_t; u:hb_codepoint_t; decomposed:Phb_codepoint_t; user_data:pointer):cuint;cdecl;
  const
    HB_UNICODE_MAX_DECOMPOSITION_LEN = 18+1;

  type
   Phb_buffer_t  = ^hb_buffer_t;
   hb_buffer_t = record end;


   Phb_font_t  = ^hb_font_t;

   Phb_glyph_info_t = ^hb_glyph_info_t;
   hb_glyph_info_t = record
     codepoint : hb_codepoint_t;
     mask : hb_mask_t;
     cluster : cuint32;
     var1 : hb_var_int_t;
     var2 : hb_var_int_t;
   end;

   Phb_glyph_position_t = ^hb_glyph_position_t;
   hb_glyph_position_t = record
     x_advance : hb_position_t;
     y_advance : hb_position_t;
     x_offset : hb_position_t;
     y_offset : hb_position_t;
     var_ : hb_var_int_t;
   end;

   Phb_segment_properties_t = ^hb_segment_properties_t;
   hb_segment_properties_t = record
     direction : hb_direction_t;
     script : hb_script_t;
     language : hb_language_t;
     reserved1 : pointer;
     reserved2 : pointer;
   end;

   hb_font_t = pointer;

   hb_buffer_content_type_t = (
     HB_BUFFER_CONTENT_TYPE_INVALID := 0,
     HB_BUFFER_CONTENT_TYPE_UNICODE,
     HB_BUFFER_CONTENT_TYPE_GLYPHS
   );

   hb_buffer_flags_t = (
     HB_BUFFER_FLAG_DEFAULT := $00000000,
     HB_BUFFER_FLAG_BOT := $00000001,
     HB_BUFFER_FLAG_EOT := $00000002,
     HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES := $00000004
   );

   hb_buffer_cluster_level_t = (
     HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES := 0,
     HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS := 1,
     HB_BUFFER_CLUSTER_LEVEL_CHARACTERS := 2
     //HB_BUFFER_CLUSTER_LEVEL_DEFAULT = HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES;
   );

 const
   HB_BUFFER_CLUSTER_LEVEL_DEFAULT = HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES;
   HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = $FFFD;

 type
   hb_buffer_serialize_flags_t = (HB_BUFFER_SERIALIZE_FLAG_DEFAULT := $00000000,
     HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS := $00000001,
     HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS := $00000002,
     HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES := $00000004,
     HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS := $00000008
   );


   hb_buffer_serialize_format_t = (
     HB_BUFFER_SERIALIZE_FORMAT_INVALID = HB_TAG_NONE,
     HB_BUFFER_SERIALIZE_FORMAT_JSON =  $4A534F4E, // (Ord('J') shl 24) or (Ord('S') shl 16) or (Ord('O') shl 8) or Ord('N'); //  HB_TAG('J','S','O','N'),
     HB_BUFFER_SERIALIZE_FORMAT_TEXT = $54455854 //(Ord('T') shl 24) or (Ord('E') shl 16) or (Ord('X') shl 8) or Ord('T')); //  HB_TAG('T','E','X','T'),
   );

   hb_buffer_message_func_t = function (buffer:Phb_buffer_t; font:Phb_font_t; message:pchar; user_data:pointer):hb_bool_t;cdecl;

   Phb_face_t = ^hb_face_t;
   hb_face_t = record  end;

   hb_reference_table_func_t = function (face:Phb_face_t; tag:hb_tag_t; user_data:pointer):Phb_blob_t;cdecl;


  Phb_position_t  = ^hb_position_t;
  Phb_font_funcs_t = ^hb_font_funcs_t;
  hb_font_funcs_t = record  end;

  Phb_font_extents_t = ^hb_font_extents_t;
  hb_font_extents_t = record
    ascender : hb_position_t;
    descender : hb_position_t;
    line_gap : hb_position_t;
    reserved9 : hb_position_t;
    reserved8 : hb_position_t;
    reserved7 : hb_position_t;
    reserved6 : hb_position_t;
    reserved5 : hb_position_t;
    reserved4 : hb_position_t;
    reserved3 : hb_position_t;
    reserved2 : hb_position_t;
    reserved1 : hb_position_t;
  end;

  Phb_glyph_extents_t = ^hb_glyph_extents_t;
  hb_glyph_extents_t = record
    x_bearing: hb_position_t; //* left side of glyph from origin. */
    y_bearing: hb_position_t; //* top side of glyph from origin. */
    width: hb_position_t ; //* distance from left to right side. */
    height: hb_position_t; //* distance from top to bottom side. */
  end;

  hb_font_get_font_extents_func_t = function (font:Phb_font_t; font_data:pointer; metrics:Phb_font_extents_t; user_data:pointer):hb_bool_t;cdecl;
  hb_font_get_font_h_extents_func_t = hb_font_get_font_extents_func_t;
  hb_font_get_font_v_extents_func_t = hb_font_get_font_extents_func_t;
  hb_font_get_nominal_glyph_func_t = function (font:Phb_font_t; font_data:pointer; unicode:hb_codepoint_t; glyph:Phb_codepoint_t; user_data:pointer):hb_bool_t;cdecl;
  hb_font_get_variation_glyph_func_t = function (font:Phb_font_t; font_data:pointer; unicode:hb_codepoint_t; variation_selector:hb_codepoint_t; glyph:Phb_codepoint_t; user_data:pointer):hb_bool_t;cdecl;
  hb_font_get_glyph_advance_func_t = function (font:Phb_font_t; font_data:pointer; glyph:hb_codepoint_t; user_data:pointer):hb_position_t;cdecl;
  hb_font_get_glyph_h_advance_func_t = hb_font_get_glyph_advance_func_t;
  hb_font_get_glyph_v_advance_func_t = hb_font_get_glyph_advance_func_t;
  hb_font_get_glyph_origin_func_t = function (font:Phb_font_t; font_data:pointer; glyph:hb_codepoint_t; x:Phb_position_t; y:Phb_position_t; user_data:pointer):hb_bool_t;cdecl;
  hb_font_get_glyph_h_origin_func_t = hb_font_get_glyph_origin_func_t;
  hb_font_get_glyph_v_origin_func_t = hb_font_get_glyph_origin_func_t;
  hb_font_get_glyph_kerning_func_t = function (font:Phb_font_t; font_data:pointer; first_glyph:hb_codepoint_t; second_glyph:hb_codepoint_t; user_data:pointer):hb_position_t;cdecl;
  hb_font_get_glyph_h_kerning_func_t = hb_font_get_glyph_kerning_func_t;
  hb_font_get_glyph_v_kerning_func_t = hb_font_get_glyph_kerning_func_t;
  hb_font_get_glyph_extents_func_t = function (font:Phb_font_t; font_data:pointer; glyph:hb_codepoint_t; extents:Phb_glyph_extents_t; user_data:pointer):hb_bool_t;cdecl;
  hb_font_get_glyph_contour_point_func_t = function (font:Phb_font_t; font_data:pointer; glyph:hb_codepoint_t; point_index:cuint; x:Phb_position_t; y:Phb_position_t; user_data:pointer):hb_bool_t;cdecl;
  hb_font_get_glyph_name_func_t = function (font:Phb_font_t; font_data:pointer; glyph:hb_codepoint_t; name:pchar; size:cuint; user_data:pointer):hb_bool_t;cdecl;
  hb_font_get_glyph_from_name_func_t = function (font:Phb_font_t; font_data:pointer; name:pchar; len:cint; glyph:Phb_codepoint_t; user_data:pointer):hb_bool_t;cdecl;

   Phb_shape_plan_t = ^hb_shape_plan_t;
   hb_shape_plan_t = record end;

const
  HB_VERSION_MAJOR = 1;
  HB_VERSION_MINOR = 4;
  HB_VERSION_MICRO = 2;
  HB_VERSION_STR = '1.4.2';

 var
   // hh-common
   hb_tag_from_string : function (str: PChar; len: cint): hb_tag_t; cdecl;
   hb_tag_to_string   : procedure(tag: hb_tag_t; buf :pchar); cdecl;

   hb_direction_from_string: function (str: pchar; len: cint): hb_direction_t; cdecl;
   hb_direction_to_string: function(direction: hb_direction_t): pchar; cdecl;

   hb_language_from_string: function (str: pchar; len: cint): hb_language_t; cdecl;
   hb_language_to_string: function (language: hb_language_t): pchar; cdecl;
   hb_language_get_default: function: hb_language_t;

   hb_script_from_iso15924_tag: function (tag: hb_tag_t): hb_script_t; cdecl;
   hb_script_from_string: function (str: pchar; len: cint): hb_script_t; cdecl;
   hb_script_to_iso15924_tag: function (script: hb_script_t): hb_tag_t; cdecl;
   hb_script_get_horizontal_direction: function(script: hb_script_t): hb_direction_t; cdecl;


   hb_feature_from_string: function(str: pchar; len: cint; feature: Phb_feature_t): hb_bool_t; cdecl;
   hb_feature_to_string: procedure(feature: Phb_feature_t; buf: pchar; size: cuint); cdecl;

   hb_variation_from_string: function (tr: pchar; len: cint; variation: Phb_variation_t): hb_bool_t; cdecl;
   hb_variation_to_string: procedure(variation: Phb_variation_t; buf: pchar; size: cuint); cdecl;

   // hh-blob
   hb_blob_create:function (data: pchar; length: cuint; mode: hb_memory_mode_t; user_data: pointer; destroy: hb_destroy_func_t): Phb_blob_t; cdecl;
   hb_blob_create_sub_blob: function (parent: Phb_blob_t;	offset: cuint; length: cuint): Phb_blob_t; cdecl;
   hb_blob_get_empty: function: Phb_blob_t; cdecl;
   hb_blob_reference: function(blob: Phb_blob_t): Phb_blob_t; cdecl;
   hb_blob_destroy: procedure (blob: hb_blob_t) cdecl;
   hb_blob_set_user_data: function (blob: Phb_blob_t; key: Phb_user_data_key_t; data: pointer; destroy: hb_destroy_func_t; replace: hb_bool_t): hb_bool_t; cdecl;
   hb_blob_get_user_data: function(blob: Phb_blob_t; key: Phb_user_data_key_t): pointer; cdecl;
   hb_blob_make_immutable: procedure (blob: Phb_blob_t); cdecl;
   hb_blob_is_immutable: function(blob: Phb_blob_t): hb_bool_t; cdecl;
   hb_blob_get_length: function(blob: Phb_blob_t): cuint; cdecl;
   hb_blob_get_data: function(blob: Phb_blob_t; length: pcuint): pchar; cdecl;
   hb_blob_get_data_writable: function (blob: Phb_blob_t; length: pcuint): pchar; cdecl;

   // hh-unicode
   hb_unicode_funcs_get_default : function:Phb_unicode_funcs_t;cdecl;
   hb_unicode_funcs_create : function(parent:Phb_unicode_funcs_t):Phb_unicode_funcs_t;cdecl;
   hb_unicode_funcs_get_empty : function:Phb_unicode_funcs_t;cdecl;
   hb_unicode_funcs_reference : function(ufuncs:Phb_unicode_funcs_t):Phb_unicode_funcs_t;cdecl;
   hb_unicode_funcs_destroy : procedure(ufuncs:Phb_unicode_funcs_t);cdecl;
   hb_unicode_funcs_set_user_data : function(ufuncs:Phb_unicode_funcs_t; key:Phb_user_data_key_t; data:pointer; destroy:hb_destroy_func_t; replace:hb_bool_t):hb_bool_t;cdecl;
   hb_unicode_funcs_get_user_data : function(ufuncs:Phb_unicode_funcs_t; key:Phb_user_data_key_t):pointer;cdecl;
   hb_unicode_funcs_make_immutable : procedure(ufuncs:Phb_unicode_funcs_t);cdecl;
   hb_unicode_funcs_is_immutable : function(ufuncs:Phb_unicode_funcs_t):hb_bool_t;cdecl;
   hb_unicode_funcs_get_parent : function(ufuncs:Phb_unicode_funcs_t):Phb_unicode_funcs_t;cdecl;
   hb_unicode_funcs_set_combining_class_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_combining_class_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_funcs_set_eastasian_width_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_eastasian_width_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_funcs_set_general_category_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_general_category_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_funcs_set_mirroring_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_mirroring_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_funcs_set_script_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_script_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_funcs_set_compose_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_compose_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_funcs_set_decompose_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_decompose_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_funcs_set_decompose_compatibility_func : procedure(ufuncs:Phb_unicode_funcs_t; func:hb_unicode_decompose_compatibility_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_unicode_combining_class : function(ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t):hb_unicode_combining_class_t;cdecl;
   hb_unicode_eastasian_width : function(ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t):cuint;cdecl;
   hb_unicode_general_category : function(ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t):hb_unicode_general_category_t;cdecl;
   hb_unicode_mirroring : function(ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t):hb_codepoint_t;cdecl;
   hb_unicode_script : function(ufuncs:Phb_unicode_funcs_t; unicode:hb_codepoint_t):hb_script_t;cdecl;
   hb_unicode_compose : function(ufuncs:Phb_unicode_funcs_t; a:hb_codepoint_t; b:hb_codepoint_t; ab:Phb_codepoint_t):hb_bool_t;cdecl;
   hb_unicode_decompose : function(ufuncs:Phb_unicode_funcs_t; ab:hb_codepoint_t; a:Phb_codepoint_t; b:Phb_codepoint_t):hb_bool_t;cdecl;
   hb_unicode_decompose_compatibility : function(ufuncs:Phb_unicode_funcs_t; u:hb_codepoint_t; decomposed:Phb_codepoint_t):cuint;cdecl;

   //buffer
   hb_segment_properties_equal: function(a:Phb_segment_properties_t; b:Phb_segment_properties_t):hb_bool_t;cdecl;
   hb_segment_properties_hash: function(p:Phb_segment_properties_t):cuint;cdecl;
   hb_buffer_create : function:Phb_buffer_t;cdecl;
   hb_buffer_get_empty : function:Phb_buffer_t;cdecl;
   hb_buffer_reference : function(buffer:Phb_buffer_t):Phb_buffer_t;cdecl;
   hb_buffer_destroy : procedure(buffer:Phb_buffer_t);cdecl;
   hb_buffer_set_user_data : function(buffer:Phb_buffer_t; key:Phb_user_data_key_t; data:pointer; destroy:hb_destroy_func_t; replace:hb_bool_t):hb_bool_t;cdecl;
   hb_buffer_get_user_data : function(buffer:Phb_buffer_t; key:Phb_user_data_key_t):pointer;cdecl;

   hb_buffer_set_content_type : procedure(buffer:Phb_buffer_t; content_type:hb_buffer_content_type_t);cdecl;
   hb_buffer_get_content_type : function(buffer:Phb_buffer_t):hb_buffer_content_type_t;cdecl;
   hb_buffer_set_unicode_funcs : procedure(buffer:Phb_buffer_t; unicode_funcs:Phb_unicode_funcs_t);cdecl;
   hb_buffer_get_unicode_funcs : function(buffer:Phb_buffer_t):Phb_unicode_funcs_t;cdecl;
   hb_buffer_set_direction : procedure(buffer:Phb_buffer_t; direction:hb_direction_t);cdecl;
   hb_buffer_get_direction : function(buffer:Phb_buffer_t):hb_direction_t;cdecl;
   hb_buffer_set_script : procedure(buffer:Phb_buffer_t; script:hb_script_t);cdecl;
   hb_buffer_get_script : function(buffer:Phb_buffer_t):hb_script_t;cdecl;
   hb_buffer_set_language : procedure(buffer:Phb_buffer_t; language:hb_language_t);cdecl;
   hb_buffer_get_language : function(buffer:Phb_buffer_t):hb_language_t;cdecl;
   hb_buffer_set_segment_properties : procedure(buffer:Phb_buffer_t; props:Phb_segment_properties_t);cdecl;
   hb_buffer_get_segment_properties : procedure(buffer:Phb_buffer_t; props:Phb_segment_properties_t);cdecl;
   hb_buffer_guess_segment_properties : procedure(buffer:Phb_buffer_t);cdecl;
   hb_buffer_set_flags : procedure(buffer:Phb_buffer_t; flags:hb_buffer_flags_t);cdecl;
   hb_buffer_get_flags : function(buffer:Phb_buffer_t):hb_buffer_flags_t;cdecl;
   hb_buffer_set_cluster_level : procedure(buffer:Phb_buffer_t; cluster_level:hb_buffer_cluster_level_t);cdecl;
   hb_buffer_get_cluster_level : function(buffer:Phb_buffer_t):hb_buffer_cluster_level_t;cdecl;
   hb_buffer_set_replacement_codepoint : procedure(buffer:Phb_buffer_t; replacement:hb_codepoint_t);cdecl;
   hb_buffer_get_replacement_codepoint : function(buffer:Phb_buffer_t):hb_codepoint_t;cdecl;
   hb_buffer_reset : procedure(buffer:Phb_buffer_t);cdecl;
   hb_buffer_clear_contents : procedure(buffer:Phb_buffer_t);cdecl;
   hb_buffer_pre_allocate : function(buffer:Phb_buffer_t; size:cuint):hb_bool_t;cdecl;
   hb_buffer_allocation_successful : function(buffer:Phb_buffer_t):hb_bool_t;cdecl;
   hb_buffer_reverse : procedure(buffer:Phb_buffer_t);cdecl;
   hb_buffer_reverse_range : procedure(buffer:Phb_buffer_t; start:cuint; end_:cuint);cdecl;
   hb_buffer_reverse_clusters : procedure(buffer:Phb_buffer_t);cdecl;

   hb_buffer_add : procedure(buffer:Phb_buffer_t; codepoint:hb_codepoint_t; cluster:cuint);cdecl;
   hb_buffer_add_utf8 : procedure(buffer:Phb_buffer_t; text:pchar; text_length:cint; item_offset:cuint; item_length:cint);cdecl;
   hb_buffer_add_utf16 : procedure(buffer:Phb_buffer_t; text:pcuint16; text_length:cint; item_offset:cuint; item_length:cint);cdecl;
   hb_buffer_add_utf32 : procedure(buffer:Phb_buffer_t; text:pcuint32; text_length:cint; item_offset:cuint; item_length:cint);cdecl;
   hb_buffer_add_latin1 : procedure(buffer:Phb_buffer_t; text:PChar; text_length:cint; item_offset:cuint; item_length:cint);cdecl;
   hb_buffer_add_codepoints : procedure(buffer:Phb_buffer_t; text:Phb_codepoint_t; text_length:cint; item_offset:cuint; item_length:cint);cdecl;
   hb_buffer_set_length : function(buffer:Phb_buffer_t; length:cuint):hb_bool_t;cdecl;
   hb_buffer_get_length : function(buffer:Phb_buffer_t):cuint;cdecl;

   hb_buffer_get_glyph_infos : function(buffer:Phb_buffer_t; length:pcuint):Phb_glyph_info_t;cdecl;
   hb_buffer_get_glyph_positions : function(buffer:Phb_buffer_t; length:pcuint):Phb_glyph_position_t;cdecl;
   hb_buffer_normalize_glyphs : procedure(buffer:Phb_buffer_t);cdecl;

   hb_buffer_serialize_format_from_string : function(str:pchar; len:cint):hb_buffer_serialize_format_t;cdecl;
   hb_buffer_serialize_format_to_string : function(format:hb_buffer_serialize_format_t):pchar;cdecl;
   hb_buffer_serialize_list_formats : function:ppchar;cdecl;
   hb_buffer_serialize_glyphs : function(buffer:Phb_buffer_t; start:cuint; end_:cuint; buf:pchar; buf_size:cuint; buf_consumed:pcuint; font:Phb_font_t; format:hb_buffer_serialize_format_t; flags:hb_buffer_serialize_flags_t):cuint;cdecl;
   hb_buffer_deserialize_glyphs : function(buffer:Phb_buffer_t; buf:pchar; buf_len:cint; end_ptr:Ppchar; font:Phb_font_t; format:hb_buffer_serialize_format_t):hb_bool_t;cdecl;

   hb_buffer_set_message_func : procedure(buffer:Phb_buffer_t; func:hb_buffer_message_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;

   // hb-face
   hb_face_create : function(blob:Phb_blob_t; index:cuint):Phb_face_t;cdecl;
   hb_face_create_for_tables : function(reference_table_func:hb_reference_table_func_t; user_data:pointer; destroy:hb_destroy_func_t):Phb_face_t;cdecl;
   hb_face_get_empty : function:Phb_face_t;cdecl;
   hb_face_reference : function(face:Phb_face_t):hb_face_t;cdecl;
   hb_face_destroy : procedure(face:Phb_face_t);cdecl;
   hb_face_set_user_data : function(face:Phb_face_t; key:Phb_user_data_key_t; data:pointer; destroy:hb_destroy_func_t; replace:hb_bool_t):hb_bool_t;cdecl;
   hb_face_get_user_data : function(face:Phb_face_t; key:Phb_user_data_key_t):pointer;cdecl;
   hb_face_make_immutable : procedure(face:Phb_face_t);cdecl;
   hb_face_is_immutable : function(face:Phb_face_t):hb_bool_t;cdecl;
   hb_face_reference_table : function(face:Phb_face_t; tag:hb_tag_t):Phb_blob_t;cdecl;
   hb_face_reference_blob : function(face:Phb_face_t):Phb_blob_t;cdecl;
   hb_face_set_index : procedure(face:Phb_face_t; index:cuint);cdecl;
   hb_face_get_index : function(face:Phb_face_t):cuint;cdecl;
   hb_face_set_upem : procedure(face:Phb_face_t; upem:cuint);cdecl;
   hb_face_get_upem : function(face:Phb_face_t):cuint;cdecl;
   hb_face_set_glyph_count : procedure(face:Phb_face_t; glyph_count:cuint);cdecl;
   hb_face_get_glyph_count : function(face:Phb_face_t):cuint;cdecl;

   // hb-font
   hb_font_funcs_create : function:Phb_font_funcs_t;cdecl;
   hb_font_funcs_get_empty : function:Phb_font_funcs_t;cdecl;
   hb_font_funcs_reference : function(ffuncs:Phb_font_funcs_t):Phb_font_funcs_t;cdecl;
   hb_font_funcs_destroy : procedure(ffuncs:Phb_font_funcs_t);cdecl;
   hb_font_funcs_set_user_data : function(ffuncs:Phb_font_funcs_t; key:Phb_user_data_key_t; data:pointer; destroy:hb_destroy_func_t; replace:hb_bool_t):hb_bool_t;cdecl;
   hb_font_funcs_get_user_data : function(ffuncs:Phb_font_funcs_t; key:Phb_user_data_key_t):pointer;cdecl;
   hb_font_funcs_make_immutable : procedure(ffuncs:Phb_font_funcs_t);cdecl;
   hb_font_funcs_is_immutable : function(ffuncs:Phb_font_funcs_t):hb_bool_t;cdecl;

   hb_font_funcs_set_font_h_extents_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_font_h_extents_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_font_v_extents_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_font_v_extents_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_nominal_glyph_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_nominal_glyph_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_variation_glyph_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_variation_glyph_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_h_advance_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_h_advance_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_v_advance_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_v_advance_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_h_origin_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_h_origin_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_v_origin_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_v_origin_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_h_kerning_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_h_kerning_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_v_kerning_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_v_kerning_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_extents_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_extents_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_contour_point_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_contour_point_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_name_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_name_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_funcs_set_glyph_from_name_func : procedure(ffuncs:Phb_font_funcs_t; func:hb_font_get_glyph_from_name_func_t; user_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_get_h_extents : function(font:Phb_font_t; extents:Phb_font_extents_t):hb_bool_t;cdecl;
   hb_font_get_v_extents : function(font:Phb_font_t; extents:Phb_font_extents_t):hb_bool_t;cdecl;
   hb_font_get_nominal_glyph : function(font:Phb_font_t; unicode:hb_codepoint_t; glyph:Phb_codepoint_t):hb_bool_t;cdecl;
   hb_font_get_variation_glyph : function(font:Phb_font_t; unicode:hb_codepoint_t; variation_selector:hb_codepoint_t; glyph:Phb_codepoint_t):hb_bool_t;cdecl;
   hb_font_get_glyph_h_advance : function(font:Phb_font_t; glyph:hb_codepoint_t):hb_position_t;cdecl;
   hb_font_get_glyph_v_advance : function(font:Phb_font_t; glyph:hb_codepoint_t):hb_position_t;cdecl;
   hb_font_get_glyph_h_origin : function(font:Phb_font_t; glyph:hb_codepoint_t; x:Phb_position_t; y:Phb_position_t):hb_bool_t;cdecl;
   hb_font_get_glyph_v_origin : function(font:Phb_font_t; glyph:hb_codepoint_t; x:Phb_position_t; y:Phb_position_t):hb_bool_t;cdecl;
   hb_font_get_glyph_h_kerning : function(font:Phb_font_t; left_glyph:hb_codepoint_t; right_glyph:hb_codepoint_t):hb_position_t;cdecl;
   hb_font_get_glyph_v_kerning : function(font:Phb_font_t; top_glyph:hb_codepoint_t; bottom_glyph:hb_codepoint_t):hb_position_t;cdecl;
   hb_font_get_glyph_extents : function(font:Phb_font_t; glyph:hb_codepoint_t; extents:Phb_glyph_extents_t):hb_bool_t;cdecl;
   hb_font_get_glyph_contour_point : function(font:Phb_font_t; glyph:hb_codepoint_t; point_index:cuint; x:Phb_position_t; y:Phb_position_t):hb_bool_t;cdecl;
   hb_font_get_glyph_name : function(font:Phb_font_t; glyph:hb_codepoint_t; name:pchar; size:cuint):hb_bool_t;cdecl;
   { -1 means nul-terminated  }
   hb_font_get_glyph_from_name : function(font:Phb_font_t; name:pchar; len:cint; glyph:Phb_codepoint_t):hb_bool_t;cdecl;
   hb_font_get_glyph : function(font:Phb_font_t; unicode:hb_codepoint_t; variation_selector:hb_codepoint_t; glyph:Phb_codepoint_t):hb_bool_t;cdecl;
   hb_font_get_extents_for_direction : procedure(font:Phb_font_t; direction:hb_direction_t; extents:Phb_font_extents_t);cdecl;
   hb_font_get_glyph_advance_for_direction : procedure(font:Phb_font_t; glyph:hb_codepoint_t; direction:hb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;
   hb_font_get_glyph_origin_for_direction : procedure(font:Phb_font_t; glyph:hb_codepoint_t; direction:hb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;
   hb_font_add_glyph_origin_for_direction : procedure(font:Phb_font_t; glyph:hb_codepoint_t; direction:hb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;
   hb_font_subtract_glyph_origin_for_direction : procedure(font:Phb_font_t; glyph:hb_codepoint_t; direction:hb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;
   hb_font_get_glyph_kerning_for_direction : procedure(font:Phb_font_t; first_glyph:hb_codepoint_t; second_glyph:hb_codepoint_t; direction:hb_direction_t; x:Phb_position_t; y:Phb_position_t);cdecl;
   hb_font_get_glyph_extents_for_origin : function(font:Phb_font_t; glyph:hb_codepoint_t; direction:hb_direction_t; extents:Phb_glyph_extents_t):hb_bool_t;cdecl;
   hb_font_get_glyph_contour_point_for_origin : function(font:Phb_font_t; glyph:hb_codepoint_t; point_index:cuint; direction:hb_direction_t; x:Phb_position_t; y:Phb_position_t):hb_bool_t;cdecl;
   { Generates gidDDD if glyph has no name.  }
   hb_font_glyph_to_string : procedure(font:Phb_font_t; glyph:hb_codepoint_t; s:pchar; size:cuint);cdecl;
   { Parses gidDDD and uniUUUU strings automatically.  }
   { -1 means nul-terminated  }
   hb_font_glyph_from_string : function(font:Phb_font_t; s:pchar; len:cint; glyph:Phb_codepoint_t):hb_bool_t;cdecl;
   { Fonts are very light-weight objects  }
   hb_font_create : function(face:Phb_face_t):Phb_font_t;cdecl;
   hb_font_create_sub_font : function(parent:Phb_font_t):Phb_font_t;cdecl;
   hb_font_get_empty : function:Phb_font_t;cdecl;
   hb_font_reference : function(font:Phb_font_t):Phb_font_t;cdecl;
   hb_font_destroy : procedure(font:Phb_font_t);cdecl;
   hb_font_set_user_data : function(font:Phb_font_t; key:Phb_user_data_key_t; data:pointer; destroy:hb_destroy_func_t; replace:hb_bool_t):hb_bool_t;cdecl;
   hb_font_get_user_data : function(font:Phb_font_t; key:Phb_user_data_key_t):pointer;cdecl;
   hb_font_make_immutable : procedure(font:Phb_font_t);cdecl;
   hb_font_is_immutable : function(font:Phb_font_t):hb_bool_t;cdecl;
   hb_font_set_parent : procedure(font:Phb_font_t; parent:Phb_font_t);cdecl;
   hb_font_get_parent : function(font:Phb_font_t):Phb_font_t;cdecl;
   hb_font_get_face : function(font:Phb_font_t):Phb_face_t;cdecl;
   hb_font_set_funcs : procedure(font:Phb_font_t; klass:Phb_font_funcs_t; font_data:pointer; destroy:hb_destroy_func_t);cdecl;
   { Be *very* careful with this function!  }
   hb_font_set_funcs_data : procedure(font:Phb_font_t; font_data:pointer; destroy:hb_destroy_func_t);cdecl;
   hb_font_set_scale : procedure(font:Phb_font_t; x_scale:cint; y_scale:cint);cdecl;
   hb_font_get_scale : procedure(font:Phb_font_t; x_scale:pcint; y_scale:pcint);cdecl;
   { * A zero value means "no hinting in that direction" }
   hb_font_set_ppem : procedure(font:Phb_font_t; x_ppem:cuint; y_ppem:cuint);cdecl;
   hb_font_get_ppem : procedure(font:Phb_font_t; x_ppem:pcuint; y_ppem:pcuint);cdecl;
   hb_font_set_variations : procedure(font:Phb_font_t; variations:Phb_variation_t; variations_length:cuint);cdecl;
   hb_font_set_var_coords_design : procedure(font:Phb_font_t; coords:Pcfloat; coords_length:cuint);cdecl;
   { 2.14 normalized  }
   hb_font_set_var_coords_normalized : procedure(font:Phb_font_t; coords:pcint; coords_length:cuint);cdecl;
   hb_font_get_var_coords_normalized : function(font:Phb_font_t; length:pcuint):pcint;cdecl;

   // hb-shape
   hb_shape : procedure(font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:cuint);cdecl;
   hb_shape_full : function(font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:cuint; shaper_list:Pchar):hb_bool_t;cdecl;
   hb_shape_list_shapers : function:ppchar;cdecl;

   // hb-shape-plan
   hb_shape_plan_create : function(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:cuint; shaper_list:Ppchar):Phb_shape_plan_t;cdecl;
   hb_shape_plan_create_cached : function(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:cuint; shaper_list:Ppchar):Phb_shape_plan_t;cdecl;
   hb_shape_plan_create2 : function(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:cuint; coords:pcint;
      num_coords:cuint; shaper_list:Ppchar):Phb_shape_plan_t;cdecl;
   hb_shape_plan_create_cached2 : function(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:cuint; coords:pcint;
      num_coords:cuint; shaper_list:Ppchar):Phb_shape_plan_t;cdecl;
   hb_shape_plan_get_empty : function:Phb_shape_plan_t;cdecl;
   hb_shape_plan_reference : function(shape_plan:Phb_shape_plan_t):Phb_shape_plan_t;cdecl;
   hb_shape_plan_destroy : procedure(shape_plan:Phb_shape_plan_t);cdecl;
   hb_shape_plan_set_user_data : function(shape_plan:Phb_shape_plan_t; key:Phb_user_data_key_t; data:pointer; destroy:hb_destroy_func_t; replace:hb_bool_t):hb_bool_t;cdecl;
   hb_shape_plan_get_user_data : function(shape_plan:Phb_shape_plan_t; key:Phb_user_data_key_t):pointer;cdecl;
   hb_shape_plan_execute : function(shape_plan:Phb_shape_plan_t; font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:cuint):hb_bool_t;cdecl;
   hb_shape_plan_get_shaper : function(shape_plan:Phb_shape_plan_t):pchar;cdecl;

   // hb-version
   hb_version : procedure(major:pcuint; minor:pcuint; micro:pcuint);cdecl;
   hb_version_string : function:pchar;cdecl;
   hb_version_atleast : function(major:cuint; minor:cuint; micro:cuint):hb_bool_t;cdecl;
   hb_version_check : function(major:cuint; minor:cuint; micro:cuint):hb_bool_t;

   // hb-ft  (freetype)
   hb_ft_face_create : function(ft_face:pointer; destroy:hb_destroy_func_t):Phb_face_t;cdecl;
   hb_ft_face_create_cached : function(ft_face:pointer):Phb_face_t;cdecl;
   hb_ft_face_create_referenced : function(ft_face:pointer):Phb_face_t;cdecl;
   hb_ft_font_create : function(ft_face:pointer; destroy:hb_destroy_func_t):Phb_font_t;cdecl;
   hb_ft_font_create_referenced : function(ft_face:pointer):Phb_font_t;cdecl;
   hb_ft_font_get_face : function(font:Phb_font_t):pointer;cdecl;
   hb_ft_font_set_load_flags : procedure(font:Phb_font_t; load_flags:cint);cdecl;
   hb_ft_font_get_load_flags : function(font:Phb_font_t):cint;cdecl;
   hb_ft_font_set_funcs : procedure(font:Phb_font_t);cdecl;

   function  LoadHarfBuzzLibrary(ALibname: String = cHarfBuzzLibName): Boolean;
   procedure UnloadHarfBuzzLibrary;

   function LibHarfBuzzLoaded: Boolean;

implementation

var
  libhandle: TLibHandle;

function LoadHarfBuzzLibrary(ALibname: String): Boolean;
begin
  libhandle := LoadLibrary(ALibname);
  Result := False;
  if libhandle = 0 then
    exit;

  Result := True;

  Pointer(hb_tag_from_string) := GetProcAddress(libhandle, 'hb_tag_from_string');
  Pointer(hb_tag_to_string) := GetProcAddress(libhandle, 'hb_tag_to_string');
  Pointer(hb_direction_from_string) := GetProcAddress(libhandle, 'hb_direction_from_string');
  Pointer(hb_language_from_string) := GetProcAddress(libhandle, 'hb_language_from_string');
  Pointer(hb_language_to_string) := GetProcAddress(libhandle, 'hb_language_to_string');
  Pointer(hb_language_get_default) := GetProcAddress(libhandle, 'hb_language_get_default');
  Pointer(hb_script_from_iso15924_tag) := GetProcAddress(libhandle, 'hb_script_from_iso15924_tag');
  Pointer(hb_script_from_string) := GetProcAddress(libhandle, 'hb_script_from_string');
  Pointer(hb_script_to_iso15924_tag) := GetProcAddress(libhandle, 'hb_script_to_iso15924_tag');
  Pointer(hb_script_get_horizontal_direction) := GetProcAddress(libhandle, 'hb_script_get_horizontal_direction');
  Pointer(hb_feature_from_string) := GetProcAddress(libhandle, 'hb_feature_from_string');
  Pointer(hb_feature_to_string) := GetProcAddress(libhandle, 'hb_feature_to_string');
  Pointer(hb_variation_from_string) := GetProcAddress(libhandle, 'hb_variation_from_string');
  Pointer(hb_variation_to_string) := GetProcAddress(libhandle, 'hb_variation_to_string');
  Pointer(hb_blob_create) := GetProcAddress(libhandle, 'hb_blob_create');
  Pointer(hb_blob_create_sub_blob) := GetProcAddress(libhandle, 'hb_blob_create_sub_blob');
  Pointer(hb_blob_get_empty) := GetProcAddress(libhandle, 'hb_blob_get_empty');
  Pointer(hb_blob_reference) := GetProcAddress(libhandle, 'hb_blob_reference');
  Pointer(hb_blob_destroy) := GetProcAddress(libhandle, 'hb_blob_destroy');
  Pointer(hb_blob_set_user_data) := GetProcAddress(libhandle, 'hb_blob_set_user_data');
  Pointer(hb_blob_get_user_data) := GetProcAddress(libhandle, 'hb_blob_get_user_data');
  Pointer(hb_blob_make_immutable) := GetProcAddress(libhandle, 'hb_blob_make_immutable');
  Pointer(hb_blob_is_immutable) := GetProcAddress(libhandle, 'hb_blob_is_immutable');
  Pointer(hb_blob_get_length) := GetProcAddress(libhandle, 'hb_blob_get_length');
  Pointer(hb_blob_get_data) := GetProcAddress(libhandle, 'hb_blob_get_data');
  Pointer(hb_blob_get_data) := GetProcAddress(libhandle, 'hb_blob_get_data');
  Pointer(hb_blob_get_data_writable) := GetProcAddress(libhandle, 'hb_blob_get_data_writable');
  pointer(hb_unicode_funcs_get_default):=GetProcAddress(libhandle,'hb_unicode_funcs_get_default');
  pointer(hb_unicode_funcs_create):=GetProcAddress(libhandle,'hb_unicode_funcs_create');
  pointer(hb_unicode_funcs_get_empty):=GetProcAddress(libhandle,'hb_unicode_funcs_get_empty');
  pointer(hb_unicode_funcs_reference):=GetProcAddress(libhandle,'hb_unicode_funcs_reference');
  pointer(hb_unicode_funcs_destroy):=GetProcAddress(libhandle,'hb_unicode_funcs_destroy');
  pointer(hb_unicode_funcs_set_user_data):=GetProcAddress(libhandle,'hb_unicode_funcs_set_user_data');
  pointer(hb_unicode_funcs_get_user_data):=GetProcAddress(libhandle,'hb_unicode_funcs_get_user_data');
  pointer(hb_unicode_funcs_make_immutable):=GetProcAddress(libhandle,'hb_unicode_funcs_make_immutable');
  pointer(hb_unicode_funcs_is_immutable):=GetProcAddress(libhandle,'hb_unicode_funcs_is_immutable');
  pointer(hb_unicode_funcs_get_parent):=GetProcAddress(libhandle,'hb_unicode_funcs_get_parent');
  pointer(hb_unicode_funcs_set_combining_class_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_combining_class_func');
  pointer(hb_unicode_funcs_set_eastasian_width_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_eastasian_width_func');
  pointer(hb_unicode_funcs_set_general_category_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_general_category_func');
  pointer(hb_unicode_funcs_set_mirroring_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_mirroring_func');
  pointer(hb_unicode_funcs_set_script_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_script_func');
  pointer(hb_unicode_funcs_set_compose_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_compose_func');
  pointer(hb_unicode_funcs_set_decompose_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_decompose_func');
  pointer(hb_unicode_funcs_set_decompose_compatibility_func):=GetProcAddress(libhandle,'hb_unicode_funcs_set_decompose_compatibility_func');
  pointer(hb_unicode_combining_class):=GetProcAddress(libhandle,'hb_unicode_combining_class');
  pointer(hb_unicode_eastasian_width):=GetProcAddress(libhandle,'hb_unicode_eastasian_width');
  pointer(hb_unicode_general_category):=GetProcAddress(libhandle,'hb_unicode_general_category');
  pointer(hb_unicode_mirroring):=GetProcAddress(libhandle,'hb_unicode_mirroring');
  pointer(hb_unicode_script):=GetProcAddress(libhandle,'hb_unicode_script');
  pointer(hb_unicode_compose):=GetProcAddress(libhandle,'hb_unicode_compose');
  pointer(hb_unicode_decompose):=GetProcAddress(libhandle,'hb_unicode_decompose');
  pointer(hb_unicode_decompose_compatibility):=GetProcAddress(libhandle,'hb_unicode_decompose_compatibility');
  pointer(hb_segment_properties_equal):=GetProcAddress(libhandle,'hb_segment_properties_equal');
  pointer(hb_segment_properties_hash):=GetProcAddress(libhandle,'hb_segment_properties_hash');
  pointer(hb_buffer_create):=GetProcAddress(libhandle,'hb_buffer_create');
  pointer(hb_buffer_get_empty):=GetProcAddress(libhandle,'hb_buffer_get_empty');
  pointer(hb_buffer_reference):=GetProcAddress(libhandle,'hb_buffer_reference');
  pointer(hb_buffer_destroy):=GetProcAddress(libhandle,'hb_buffer_destroy');
  pointer(hb_buffer_set_user_data):=GetProcAddress(libhandle,'hb_buffer_set_user_data');
  pointer(hb_buffer_get_user_data):=GetProcAddress(libhandle,'hb_buffer_get_user_data');
  pointer(hb_buffer_set_content_type):=GetProcAddress(libhandle,'hb_buffer_set_content_type');
  pointer(hb_buffer_get_content_type):=GetProcAddress(libhandle,'hb_buffer_get_content_type');
  pointer(hb_buffer_set_unicode_funcs):=GetProcAddress(libhandle,'hb_buffer_set_unicode_funcs');
  pointer(hb_buffer_get_unicode_funcs):=GetProcAddress(libhandle,'hb_buffer_get_unicode_funcs');
  pointer(hb_buffer_set_direction):=GetProcAddress(libhandle,'hb_buffer_set_direction');
  pointer(hb_buffer_get_direction):=GetProcAddress(libhandle,'hb_buffer_get_direction');
  pointer(hb_buffer_set_script):=GetProcAddress(libhandle,'hb_buffer_set_script');
  pointer(hb_buffer_get_script):=GetProcAddress(libhandle,'hb_buffer_get_script');
  pointer(hb_buffer_set_language):=GetProcAddress(libhandle,'hb_buffer_set_language');
  pointer(hb_buffer_get_language):=GetProcAddress(libhandle,'hb_buffer_get_language');
  pointer(hb_buffer_set_segment_properties):=GetProcAddress(libhandle,'hb_buffer_set_segment_properties');
  pointer(hb_buffer_get_segment_properties):=GetProcAddress(libhandle,'hb_buffer_get_segment_properties');
  pointer(hb_buffer_guess_segment_properties):=GetProcAddress(libhandle,'hb_buffer_guess_segment_properties');
  pointer(hb_buffer_set_flags):=GetProcAddress(libhandle,'hb_buffer_set_flags');
  pointer(hb_buffer_get_flags):=GetProcAddress(libhandle,'hb_buffer_get_flags');
  pointer(hb_buffer_set_cluster_level):=GetProcAddress(libhandle,'hb_buffer_set_cluster_level');
  pointer(hb_buffer_get_cluster_level):=GetProcAddress(libhandle,'hb_buffer_get_cluster_level');
  pointer(hb_buffer_set_replacement_codepoint):=GetProcAddress(libhandle,'hb_buffer_set_replacement_codepoint');
  pointer(hb_buffer_get_replacement_codepoint):=GetProcAddress(libhandle,'hb_buffer_get_replacement_codepoint');
  pointer(hb_buffer_reset):=GetProcAddress(libhandle,'hb_buffer_reset');
  pointer(hb_buffer_clear_contents):=GetProcAddress(libhandle,'hb_buffer_clear_contents');
  pointer(hb_buffer_pre_allocate):=GetProcAddress(libhandle,'hb_buffer_pre_allocate');
  pointer(hb_buffer_allocation_successful):=GetProcAddress(libhandle,'hb_buffer_allocation_successful');
  pointer(hb_buffer_reverse):=GetProcAddress(libhandle,'hb_buffer_reverse');
  pointer(hb_buffer_reverse_range):=GetProcAddress(libhandle,'hb_buffer_reverse_range');
  pointer(hb_buffer_reverse_clusters):=GetProcAddress(libhandle,'hb_buffer_reverse_clusters');
  pointer(hb_buffer_add):=GetProcAddress(libhandle,'hb_buffer_add');
  pointer(hb_buffer_add_utf8):=GetProcAddress(libhandle,'hb_buffer_add_utf8');
  pointer(hb_buffer_add_utf16):=GetProcAddress(libhandle,'hb_buffer_add_utf16');
  pointer(hb_buffer_add_utf32):=GetProcAddress(libhandle,'hb_buffer_add_utf32');
  pointer(hb_buffer_add_latin1):=GetProcAddress(libhandle,'hb_buffer_add_latin1');
  pointer(hb_buffer_add_codepoints):=GetProcAddress(libhandle,'hb_buffer_add_codepoints');
  pointer(hb_buffer_set_length):=GetProcAddress(libhandle,'hb_buffer_set_length');
  pointer(hb_buffer_get_length):=GetProcAddress(libhandle,'hb_buffer_get_length');
  pointer(hb_buffer_get_glyph_infos):=GetProcAddress(libhandle,'hb_buffer_get_glyph_infos');
  pointer(hb_buffer_get_glyph_positions):=GetProcAddress(libhandle,'hb_buffer_get_glyph_positions');
  pointer(hb_buffer_normalize_glyphs):=GetProcAddress(libhandle,'hb_buffer_normalize_glyphs');
  pointer(hb_buffer_serialize_format_from_string):=GetProcAddress(libhandle,'hb_buffer_serialize_format_from_string');
  pointer(hb_buffer_serialize_format_to_string):=GetProcAddress(libhandle,'hb_buffer_serialize_format_to_string');
  pointer(hb_buffer_serialize_list_formats):=GetProcAddress(libhandle,'hb_buffer_serialize_list_formats');
  pointer(hb_buffer_serialize_glyphs):=GetProcAddress(libhandle,'hb_buffer_serialize_glyphs');
  pointer(hb_buffer_deserialize_glyphs):=GetProcAddress(libhandle,'hb_buffer_deserialize_glyphs');
  pointer(hb_buffer_set_message_func):=GetProcAddress(libhandle,'hb_buffer_set_message_func');
  pointer(hb_font_funcs_create):=GetProcAddress(libhandle,'hb_font_funcs_create');
  pointer(hb_font_funcs_get_empty):=GetProcAddress(libhandle,'hb_font_funcs_get_empty');
  pointer(hb_font_funcs_reference):=GetProcAddress(libhandle,'hb_font_funcs_reference');
  pointer(hb_font_funcs_destroy):=GetProcAddress(libhandle,'hb_font_funcs_destroy');
  pointer(hb_font_funcs_set_user_data):=GetProcAddress(libhandle,'hb_font_funcs_set_user_data');
  pointer(hb_font_funcs_get_user_data):=GetProcAddress(libhandle,'hb_font_funcs_get_user_data');
  pointer(hb_font_funcs_make_immutable):=GetProcAddress(libhandle,'hb_font_funcs_make_immutable');
  pointer(hb_font_funcs_is_immutable):=GetProcAddress(libhandle,'hb_font_funcs_is_immutable');
  pointer(hb_font_funcs_set_font_h_extents_func):=GetProcAddress(libhandle,'hb_font_funcs_set_font_h_extents_func');
  pointer(hb_font_funcs_set_font_v_extents_func):=GetProcAddress(libhandle,'hb_font_funcs_set_font_v_extents_func');
  pointer(hb_font_funcs_set_nominal_glyph_func):=GetProcAddress(libhandle,'hb_font_funcs_set_nominal_glyph_func');
  pointer(hb_font_funcs_set_variation_glyph_func):=GetProcAddress(libhandle,'hb_font_funcs_set_variation_glyph_func');
  pointer(hb_font_funcs_set_glyph_h_advance_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_h_advance_func');
  pointer(hb_font_funcs_set_glyph_v_advance_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_v_advance_func');
  pointer(hb_font_funcs_set_glyph_h_origin_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_h_origin_func');
  pointer(hb_font_funcs_set_glyph_v_origin_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_v_origin_func');
  pointer(hb_font_funcs_set_glyph_h_kerning_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_h_kerning_func');
  pointer(hb_font_funcs_set_glyph_v_kerning_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_v_kerning_func');
  pointer(hb_font_funcs_set_glyph_extents_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_extents_func');
  pointer(hb_font_funcs_set_glyph_contour_point_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_contour_point_func');
  pointer(hb_font_funcs_set_glyph_name_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_name_func');
  pointer(hb_font_funcs_set_glyph_from_name_func):=GetProcAddress(libhandle,'hb_font_funcs_set_glyph_from_name_func');
  pointer(hb_font_get_h_extents):=GetProcAddress(libhandle,'hb_font_get_h_extents');
  pointer(hb_font_get_v_extents):=GetProcAddress(libhandle,'hb_font_get_v_extents');
  pointer(hb_font_get_nominal_glyph):=GetProcAddress(libhandle,'hb_font_get_nominal_glyph');
  pointer(hb_font_get_variation_glyph):=GetProcAddress(libhandle,'hb_font_get_variation_glyph');
  pointer(hb_font_get_glyph_h_advance):=GetProcAddress(libhandle,'hb_font_get_glyph_h_advance');
  pointer(hb_font_get_glyph_v_advance):=GetProcAddress(libhandle,'hb_font_get_glyph_v_advance');
  pointer(hb_font_get_glyph_h_origin):=GetProcAddress(libhandle,'hb_font_get_glyph_h_origin');
  pointer(hb_font_get_glyph_v_origin):=GetProcAddress(libhandle,'hb_font_get_glyph_v_origin');
  pointer(hb_font_get_glyph_h_kerning):=GetProcAddress(libhandle,'hb_font_get_glyph_h_kerning');
  pointer(hb_font_get_glyph_v_kerning):=GetProcAddress(libhandle,'hb_font_get_glyph_v_kerning');
  pointer(hb_font_get_glyph_extents):=GetProcAddress(libhandle,'hb_font_get_glyph_extents');
  pointer(hb_font_get_glyph_contour_point):=GetProcAddress(libhandle,'hb_font_get_glyph_contour_point');
  pointer(hb_font_get_glyph_name):=GetProcAddress(libhandle,'hb_font_get_glyph_name');
  pointer(hb_font_get_glyph_from_name):=GetProcAddress(libhandle,'hb_font_get_glyph_from_name');
  pointer(hb_font_get_glyph):=GetProcAddress(libhandle,'hb_font_get_glyph');
  pointer(hb_font_get_extents_for_direction):=GetProcAddress(libhandle,'hb_font_get_extents_for_direction');
  pointer(hb_font_get_glyph_advance_for_direction):=GetProcAddress(libhandle,'hb_font_get_glyph_advance_for_direction');
  pointer(hb_font_get_glyph_origin_for_direction):=GetProcAddress(libhandle,'hb_font_get_glyph_origin_for_direction');
  pointer(hb_font_add_glyph_origin_for_direction):=GetProcAddress(libhandle,'hb_font_add_glyph_origin_for_direction');
  pointer(hb_font_subtract_glyph_origin_for_direction):=GetProcAddress(libhandle,'hb_font_subtract_glyph_origin_for_direction');
  pointer(hb_font_get_glyph_kerning_for_direction):=GetProcAddress(libhandle,'hb_font_get_glyph_kerning_for_direction');
  pointer(hb_font_get_glyph_extents_for_origin):=GetProcAddress(libhandle,'hb_font_get_glyph_extents_for_origin');
  pointer(hb_font_get_glyph_contour_point_for_origin):=GetProcAddress(libhandle,'hb_font_get_glyph_contour_point_for_origin');
  pointer(hb_font_glyph_to_string):=GetProcAddress(libhandle,'hb_font_glyph_to_string');
  pointer(hb_font_glyph_from_string):=GetProcAddress(libhandle,'hb_font_glyph_from_string');
  pointer(hb_font_create):=GetProcAddress(libhandle,'hb_font_create');
  pointer(hb_font_create_sub_font):=GetProcAddress(libhandle,'hb_font_create_sub_font');
  pointer(hb_font_get_empty):=GetProcAddress(libhandle,'hb_font_get_empty');
  pointer(hb_font_reference):=GetProcAddress(libhandle,'hb_font_reference');
  pointer(hb_font_destroy):=GetProcAddress(libhandle,'hb_font_destroy');
  pointer(hb_font_set_user_data):=GetProcAddress(libhandle,'hb_font_set_user_data');
  pointer(hb_font_get_user_data):=GetProcAddress(libhandle,'hb_font_get_user_data');
  pointer(hb_font_make_immutable):=GetProcAddress(libhandle,'hb_font_make_immutable');
  pointer(hb_font_is_immutable):=GetProcAddress(libhandle,'hb_font_is_immutable');
  pointer(hb_font_set_parent):=GetProcAddress(libhandle,'hb_font_set_parent');
  pointer(hb_font_get_parent):=GetProcAddress(libhandle,'hb_font_get_parent');
  pointer(hb_font_get_face):=GetProcAddress(libhandle,'hb_font_get_face');
  pointer(hb_font_set_funcs):=GetProcAddress(libhandle,'hb_font_set_funcs');
  pointer(hb_font_set_funcs_data):=GetProcAddress(libhandle,'hb_font_set_funcs_data');
  pointer(hb_font_set_scale):=GetProcAddress(libhandle,'hb_font_set_scale');
  pointer(hb_font_get_scale):=GetProcAddress(libhandle,'hb_font_get_scale');
  pointer(hb_font_set_ppem):=GetProcAddress(libhandle,'hb_font_set_ppem');
  pointer(hb_font_get_ppem):=GetProcAddress(libhandle,'hb_font_get_ppem');
  pointer(hb_font_set_variations):=GetProcAddress(libhandle,'hb_font_set_variations');
  pointer(hb_font_set_var_coords_design):=GetProcAddress(libhandle,'hb_font_set_var_coords_design');
  pointer(hb_font_set_var_coords_normalized):=GetProcAddress(libhandle,'hb_font_set_var_coords_normalized');
  pointer(hb_font_get_var_coords_normalized):=GetProcAddress(libhandle,'hb_font_get_var_coords_normalized');
  pointer(hb_shape):=GetProcAddress(libhandle,'hb_shape');
  pointer(hb_shape_full):=GetProcAddress(libhandle,'hb_shape_full');
  pointer(hb_shape_list_shapers):=GetProcAddress(libhandle,'hb_shape_list_shapers');
  pointer(hb_shape_plan_create):=GetProcAddress(libhandle,'hb_shape_plan_create');
  pointer(hb_shape_plan_create_cached):=GetProcAddress(libhandle,'hb_shape_plan_create_cached');
  pointer(hb_shape_plan_create2):=GetProcAddress(libhandle,'hb_shape_plan_create2');
  pointer(hb_shape_plan_create_cached2):=GetProcAddress(libhandle,'hb_shape_plan_create_cached2');
  pointer(hb_shape_plan_get_empty):=GetProcAddress(libhandle,'hb_shape_plan_get_empty');
  pointer(hb_shape_plan_reference):=GetProcAddress(libhandle,'hb_shape_plan_reference');
  pointer(hb_shape_plan_destroy):=GetProcAddress(libhandle,'hb_shape_plan_destroy');
  pointer(hb_shape_plan_set_user_data):=GetProcAddress(libhandle,'hb_shape_plan_set_user_data');
  pointer(hb_shape_plan_get_user_data):=GetProcAddress(libhandle,'hb_shape_plan_get_user_data');
  pointer(hb_shape_plan_execute):=GetProcAddress(libhandle,'hb_shape_plan_execute');
  pointer(hb_shape_plan_get_shaper):=GetProcAddress(libhandle,'hb_shape_plan_get_shaper');
  pointer(hb_version):=GetProcAddress(libhandle,'hb_version');
  pointer(hb_version_string):=GetProcAddress(libhandle,'hb_version_string');
  pointer(hb_version_atleast):=GetProcAddress(libhandle,'hb_version_atleast');
  pointer(hb_version_check):=GetProcAddress(libhandle,'hb_version_check');

  pointer(hb_ft_face_create):=GetProcAddress(libhandle,'hb_ft_face_create');
  pointer(hb_ft_face_create_cached):=GetProcAddress(libhandle,'hb_ft_face_create_cached');
  pointer(hb_ft_face_create_referenced):=GetProcAddress(libhandle,'hb_ft_face_create_referenced');
  pointer(hb_ft_font_create):=GetProcAddress(libhandle,'hb_ft_font_create');
  pointer(hb_ft_font_create_referenced):=GetProcAddress(libhandle,'hb_ft_font_create_referenced');
  pointer(hb_ft_font_get_face):=GetProcAddress(libhandle,'hb_ft_font_get_face');
  pointer(hb_ft_font_set_load_flags):=GetProcAddress(libhandle,'hb_ft_font_set_load_flags');
  pointer(hb_ft_font_get_load_flags):=GetProcAddress(libhandle,'hb_ft_font_get_load_flags');
  pointer(hb_ft_font_set_funcs):=GetProcAddress(libhandle,'hb_ft_font_set_funcs');
end;

procedure UnloadHarfBuzzLibrary;
begin
  if libhandle = 0 then
    Exit;
  UnloadLibrary(libhandle);
  libhandle:=0;
end;

function LibHarfBuzzLoaded: Boolean;
begin
  Result := libhandle <> 0;
end;

initialization
  LoadHarfBuzzLibrary(cHarfBuzzLibName);
finalization
  if LibHarfBuzzLoaded then
    UnloadHarfBuzzLibrary;
end.
