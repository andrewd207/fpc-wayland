{%mainunit libkbcommon.pas}
{ see copyright in mainunit }
const
    XKB_MOD_NAME_SHIFT = 'Shift';
    XKB_MOD_NAME_CAPS = 'Lock';
    XKB_MOD_NAME_CTRL = 'Control';
    XKB_MOD_NAME_ALT = 'Mod1';
    XKB_MOD_NAME_NUM = 'Mod2';
    XKB_MOD_NAME_LOGO = 'Mod4';
    XKB_LED_NAME_CAPS = 'Caps Lock';
    XKB_LED_NAME_NUM = 'Num Lock';
    XKB_LED_NAME_SCROLL = 'Scroll Lock';

    XKB_KEY_NoSymbol = $000000;

    { Void symbol  }
    XKB_KEY_VoidSymbol = $ffffff;
  {
   * TTY function keys, cleverly chosen to map to ASCII, for convenience of
   * programming, but could have been arbitrary (at the cost of lookup
   * tables in client code).
    }
  { Back space, back char  }
    XKB_KEY_BackSpace = $ff08;
    XKB_KEY_Tab = $ff09;
  { Linefeed, LF  }
    XKB_KEY_Linefeed = $ff0a;
    XKB_KEY_Clear = $ff0b;
  { Return, enter  }
    XKB_KEY_Return = $ff0d;
  { Pause, hold  }
    XKB_KEY_Pause = $ff13;
    XKB_KEY_Scroll_Lock = $ff14;
    XKB_KEY_Sys_Req = $ff15;
    XKB_KEY_Escape = $ff1b;
  { Delete, rubout  }
    XKB_KEY_Delete = $ffff;
  { International & multi-key character composition  }
  { Multi-key character compose  }
    XKB_KEY_Multi_key = $ff20;
    XKB_KEY_Codeinput = $ff37;
    XKB_KEY_SingleCandidate = $ff3c;
    XKB_KEY_MultipleCandidate = $ff3d;
    XKB_KEY_PreviousCandidate = $ff3e;
  { Japanese keyboard support  }
  { Kanji, Kanji convert  }
    XKB_KEY_Kanji = $ff21;
  { Cancel Conversion  }
    XKB_KEY_Muhenkan = $ff22;
  { Start/Stop Conversion  }
    XKB_KEY_Henkan_Mode = $ff23;
  { Alias for Henkan_Mode  }
    XKB_KEY_Henkan = $ff23;
  { to Romaji  }
    XKB_KEY_Romaji = $ff24;
  { to Hiragana  }
    XKB_KEY_Hiragana = $ff25;
  { to Katakana  }
    XKB_KEY_Katakana = $ff26;
  { Hiragana/Katakana toggle  }
    XKB_KEY_Hiragana_Katakana = $ff27;
  { to Zenkaku  }
    XKB_KEY_Zenkaku = $ff28;
  { to Hankaku  }
    XKB_KEY_Hankaku = $ff29;
  { Zenkaku/Hankaku toggle  }
    XKB_KEY_Zenkaku_Hankaku = $ff2a;
  { Add to Dictionary  }
    XKB_KEY_Touroku = $ff2b;
  { Delete from Dictionary  }
    XKB_KEY_Massyo = $ff2c;
  { Kana Lock  }
    XKB_KEY_Kana_Lock = $ff2d;
  { Kana Shift  }
    XKB_KEY_Kana_Shift = $ff2e;
  { Alphanumeric Shift  }
    XKB_KEY_Eisu_Shift = $ff2f;
  { Alphanumeric toggle  }
    XKB_KEY_Eisu_toggle = $ff30;
  { Codeinput  }
    XKB_KEY_Kanji_Bangou = $ff37;
  { Multiple/All Candidate(s)  }
    XKB_KEY_Zen_Koho = $ff3d;
  { Previous Candidate  }
    XKB_KEY_Mae_Koho = $ff3e;
  { 0xff31 thru 0xff3f are under XK_KOREAN  }
  { Cursor control & motion  }
    XKB_KEY_Home = $ff50;
  { Move left, left arrow  }
    XKB_KEY_Left = $ff51;
  { Move up, up arrow  }
    XKB_KEY_Up = $ff52;
  { Move right, right arrow  }
    XKB_KEY_Right = $ff53;
  { Move down, down arrow  }
    XKB_KEY_Down = $ff54;
  { Prior, previous  }
    XKB_KEY_Prior = $ff55;
    XKB_KEY_Page_Up = $ff55;
  { Next  }
    XKB_KEY_Next = $ff56;
    XKB_KEY_Page_Down = $ff56;
  { EOL  }
    XKB_KEY_End = $ff57;
  { BOL  }
    XKB_KEY_Begin = $ff58;
  { Misc functions  }
  { Select, mark  }
    XKB_KEY_Select = $ff60;
    XKB_KEY_Print = $ff61;
  { Execute, run, do  }
    XKB_KEY_Execute = $ff62;
  { Insert, insert here  }
    XKB_KEY_Insert = $ff63;
    XKB_KEY_Undo = $ff65;
  { Redo, again  }
    XKB_KEY_Redo = $ff66;
    XKB_KEY_Menu = $ff67;
  { Find, search  }
    XKB_KEY_Find = $ff68;
  { Cancel, stop, abort, exit  }
    XKB_KEY_Cancel = $ff69;
  { Help  }
    XKB_KEY_Help = $ff6a;
    XKB_KEY_Break = $ff6b;
  { Character set switch  }
    XKB_KEY_Mode_switch = $ff7e;
  { Alias for mode_switch  }
    XKB_KEY_script_switch = $ff7e;
    XKB_KEY_Num_Lock = $ff7f;
  { Keypad functions, keypad numbers cleverly chosen to map to ASCII  }
  { Space  }
    XKB_KEY_KP_Space = $ff80;
    XKB_KEY_KP_Tab = $ff89;
  { Enter  }
    XKB_KEY_KP_Enter = $ff8d;
  { PF1, KP_A, ...  }
    XKB_KEY_KP_F1 = $ff91;
    XKB_KEY_KP_F2 = $ff92;
    XKB_KEY_KP_F3 = $ff93;
    XKB_KEY_KP_F4 = $ff94;
    XKB_KEY_KP_Home = $ff95;
    XKB_KEY_KP_Left = $ff96;
    XKB_KEY_KP_Up = $ff97;
    XKB_KEY_KP_Right = $ff98;
    XKB_KEY_KP_Down = $ff99;
    XKB_KEY_KP_Prior = $ff9a;
    XKB_KEY_KP_Page_Up = $ff9a;
    XKB_KEY_KP_Next = $ff9b;
    XKB_KEY_KP_Page_Down = $ff9b;
    XKB_KEY_KP_End = $ff9c;
    XKB_KEY_KP_Begin = $ff9d;
    XKB_KEY_KP_Insert = $ff9e;
    XKB_KEY_KP_Delete = $ff9f;
  { Equals  }
    XKB_KEY_KP_Equal = $ffbd;
    XKB_KEY_KP_Multiply = $ffaa;
    XKB_KEY_KP_Add = $ffab;
  { Separator, often comma  }
    XKB_KEY_KP_Separator = $ffac;
    XKB_KEY_KP_Subtract = $ffad;
    XKB_KEY_KP_Decimal = $ffae;
    XKB_KEY_KP_Divide = $ffaf;
    XKB_KEY_KP_0 = $ffb0;
    XKB_KEY_KP_1 = $ffb1;
    XKB_KEY_KP_2 = $ffb2;
    XKB_KEY_KP_3 = $ffb3;
    XKB_KEY_KP_4 = $ffb4;
    XKB_KEY_KP_5 = $ffb5;
    XKB_KEY_KP_6 = $ffb6;
    XKB_KEY_KP_7 = $ffb7;
    XKB_KEY_KP_8 = $ffb8;
    XKB_KEY_KP_9 = $ffb9;
  {
   * Auxiliary functions; note the duplicate definitions for left and right
   * function keys;  Sun keyboards and a few other manufacturers have such
   * function key groups on the left and/or right sides of the keyboard.
   * We've not found a keyboard with more than 35 function keys total.
    }
    XKB_KEY_F1 = $ffbe;
    XKB_KEY_F2 = $ffbf;
    XKB_KEY_F3 = $ffc0;
    XKB_KEY_F4 = $ffc1;
    XKB_KEY_F5 = $ffc2;
    XKB_KEY_F6 = $ffc3;
    XKB_KEY_F7 = $ffc4;
    XKB_KEY_F8 = $ffc5;
    XKB_KEY_F9 = $ffc6;
    XKB_KEY_F10 = $ffc7;
    XKB_KEY_F11 = $ffc8;
    XKB_KEY_L1 = $ffc8;
    XKB_KEY_F12 = $ffc9;
    XKB_KEY_L2 = $ffc9;
    XKB_KEY_F13 = $ffca;
    XKB_KEY_L3 = $ffca;
    XKB_KEY_F14 = $ffcb;
    XKB_KEY_L4 = $ffcb;
    XKB_KEY_F15 = $ffcc;
    XKB_KEY_L5 = $ffcc;
    XKB_KEY_F16 = $ffcd;
    XKB_KEY_L6 = $ffcd;
    XKB_KEY_F17 = $ffce;
    XKB_KEY_L7 = $ffce;
    XKB_KEY_F18 = $ffcf;
    XKB_KEY_L8 = $ffcf;
    XKB_KEY_F19 = $ffd0;
    XKB_KEY_L9 = $ffd0;
    XKB_KEY_F20 = $ffd1;
    XKB_KEY_L10 = $ffd1;
    XKB_KEY_F21 = $ffd2;
    XKB_KEY_R1 = $ffd2;
    XKB_KEY_F22 = $ffd3;
    XKB_KEY_R2 = $ffd3;
    XKB_KEY_F23 = $ffd4;
    XKB_KEY_R3 = $ffd4;
    XKB_KEY_F24 = $ffd5;
    XKB_KEY_R4 = $ffd5;
    XKB_KEY_F25 = $ffd6;
    XKB_KEY_R5 = $ffd6;
    XKB_KEY_F26 = $ffd7;
    XKB_KEY_R6 = $ffd7;
    XKB_KEY_F27 = $ffd8;
    XKB_KEY_R7 = $ffd8;
    XKB_KEY_F28 = $ffd9;
    XKB_KEY_R8 = $ffd9;
    XKB_KEY_F29 = $ffda;
    XKB_KEY_R9 = $ffda;
    XKB_KEY_F30 = $ffdb;
    XKB_KEY_R10 = $ffdb;
    XKB_KEY_F31 = $ffdc;
    XKB_KEY_R11 = $ffdc;
    XKB_KEY_F32 = $ffdd;
    XKB_KEY_R12 = $ffdd;
    XKB_KEY_F33 = $ffde;
    XKB_KEY_R13 = $ffde;
    XKB_KEY_F34 = $ffdf;
    XKB_KEY_R14 = $ffdf;
    XKB_KEY_F35 = $ffe0;
    XKB_KEY_R15 = $ffe0;
  { Modifiers  }
  { Left shift  }
    XKB_KEY_Shift_L = $ffe1;
  { Right shift  }
    XKB_KEY_Shift_R = $ffe2;
  { Left control  }
    XKB_KEY_Control_L = $ffe3;
  { Right control  }
    XKB_KEY_Control_R = $ffe4;
  { Caps lock  }
    XKB_KEY_Caps_Lock = $ffe5;
  { Shift lock  }
    XKB_KEY_Shift_Lock = $ffe6;
  { Left meta  }
    XKB_KEY_Meta_L = $ffe7;
  { Right meta  }
    XKB_KEY_Meta_R = $ffe8;
  { Left alt  }
    XKB_KEY_Alt_L = $ffe9;
  { Right alt  }
    XKB_KEY_Alt_R = $ffea;
  { Left super  }
    XKB_KEY_Super_L = $ffeb;
  { Right super  }
    XKB_KEY_Super_R = $ffec;
  { Left hyper  }
    XKB_KEY_Hyper_L = $ffed;
  { Right hyper  }
    XKB_KEY_Hyper_R = $ffee;
  {
   * Keyboard (XKB) Extension function and modifier keys
   * (from Appendix C of "The X Keyboard Extension: Protocol Specification")
   * Byte 3 = 0xfe
    }
    XKB_KEY_ISO_Lock = $fe01;
    XKB_KEY_ISO_Level2_Latch = $fe02;
    XKB_KEY_ISO_Level3_Shift = $fe03;
    XKB_KEY_ISO_Level3_Latch = $fe04;
    XKB_KEY_ISO_Level3_Lock = $fe05;
    XKB_KEY_ISO_Level5_Shift = $fe11;
    XKB_KEY_ISO_Level5_Latch = $fe12;
    XKB_KEY_ISO_Level5_Lock = $fe13;
  { Alias for mode_switch  }
    XKB_KEY_ISO_Group_Shift = $ff7e;
    XKB_KEY_ISO_Group_Latch = $fe06;
    XKB_KEY_ISO_Group_Lock = $fe07;
    XKB_KEY_ISO_Next_Group = $fe08;
    XKB_KEY_ISO_Next_Group_Lock = $fe09;
    XKB_KEY_ISO_Prev_Group = $fe0a;
    XKB_KEY_ISO_Prev_Group_Lock = $fe0b;
    XKB_KEY_ISO_First_Group = $fe0c;
    XKB_KEY_ISO_First_Group_Lock = $fe0d;
    XKB_KEY_ISO_Last_Group = $fe0e;
    XKB_KEY_ISO_Last_Group_Lock = $fe0f;
    XKB_KEY_ISO_Left_Tab = $fe20;
    XKB_KEY_ISO_Move_Line_Up = $fe21;
    XKB_KEY_ISO_Move_Line_Down = $fe22;
    XKB_KEY_ISO_Partial_Line_Up = $fe23;
    XKB_KEY_ISO_Partial_Line_Down = $fe24;
    XKB_KEY_ISO_Partial_Space_Left = $fe25;
    XKB_KEY_ISO_Partial_Space_Right = $fe26;
    XKB_KEY_ISO_Set_Margin_Left = $fe27;
    XKB_KEY_ISO_Set_Margin_Right = $fe28;
    XKB_KEY_ISO_Release_Margin_Left = $fe29;
    XKB_KEY_ISO_Release_Margin_Right = $fe2a;
    XKB_KEY_ISO_Release_Both_Margins = $fe2b;
    XKB_KEY_ISO_Fast_Cursor_Left = $fe2c;
    XKB_KEY_ISO_Fast_Cursor_Right = $fe2d;
    XKB_KEY_ISO_Fast_Cursor_Up = $fe2e;
    XKB_KEY_ISO_Fast_Cursor_Down = $fe2f;
    XKB_KEY_ISO_Continuous_Underline = $fe30;
    XKB_KEY_ISO_Discontinuous_Underline = $fe31;
    XKB_KEY_ISO_Emphasize = $fe32;
    XKB_KEY_ISO_Center_Object = $fe33;
    XKB_KEY_ISO_Enter = $fe34;
    XKB_KEY_dead_grave = $fe50;
    XKB_KEY_dead_acute = $fe51;
    XKB_KEY_dead_circumflex = $fe52;
    XKB_KEY_dead_tilde = $fe53;
  { alias for dead_tilde  }
    XKB_KEY_dead_perispomeni = $fe53;
    XKB_KEY_dead_macron = $fe54;
    XKB_KEY_dead_breve = $fe55;
    XKB_KEY_dead_abovedot = $fe56;
    XKB_KEY_dead_diaeresis = $fe57;
    XKB_KEY_dead_abovering = $fe58;
    XKB_KEY_dead_doubleacute = $fe59;
    XKB_KEY_dead_caron = $fe5a;
    XKB_KEY_dead_cedilla = $fe5b;
    XKB_KEY_dead_ogonek = $fe5c;
    XKB_KEY_dead_iota = $fe5d;
    XKB_KEY_dead_voiced_sound = $fe5e;
    XKB_KEY_dead_semivoiced_sound = $fe5f;
    XKB_KEY_dead_belowdot = $fe60;
    XKB_KEY_dead_hook = $fe61;
    XKB_KEY_dead_horn = $fe62;
    XKB_KEY_dead_stroke = $fe63;
    XKB_KEY_dead_abovecomma = $fe64;
  { alias for dead_abovecomma  }
    XKB_KEY_dead_psili = $fe64;
    XKB_KEY_dead_abovereversedcomma = $fe65;
  { alias for dead_abovereversedcomma  }
    XKB_KEY_dead_dasia = $fe65;
    XKB_KEY_dead_doublegrave = $fe66;
    XKB_KEY_dead_belowring = $fe67;
    XKB_KEY_dead_belowmacron = $fe68;
    XKB_KEY_dead_belowcircumflex = $fe69;
    XKB_KEY_dead_belowtilde = $fe6a;
    XKB_KEY_dead_belowbreve = $fe6b;
    XKB_KEY_dead_belowdiaeresis = $fe6c;
    XKB_KEY_dead_invertedbreve = $fe6d;
    XKB_KEY_dead_belowcomma = $fe6e;
    XKB_KEY_dead_currency = $fe6f;
  { extra dead elements for German T3 layout  }
    XKB_KEY_dead_lowline = $fe90;
    XKB_KEY_dead_aboveverticalline = $fe91;
    XKB_KEY_dead_belowverticalline = $fe92;
    XKB_KEY_dead_longsolidusoverlay = $fe93;
  { dead vowels for universal syllable entry  }
    XKB_KEY_dead_a = $fe80;
    XKB_KEY_dead_A_ = $fe81;
    XKB_KEY_dead_e = $fe82;
    XKB_KEY_dead_E_ = $fe83;
    XKB_KEY_dead_i = $fe84;
    XKB_KEY_dead_I_ = $fe85;
    XKB_KEY_dead_o = $fe86;
    XKB_KEY_dead_O_ = $fe87;
    XKB_KEY_dead_u = $fe88;
    XKB_KEY_dead_U_ = $fe89;
    XKB_KEY_dead_small_schwa = $fe8a;
    XKB_KEY_dead_capital_schwa = $fe8b;
    XKB_KEY_dead_greek = $fe8c;
    XKB_KEY_First_Virtual_Screen = $fed0;
    XKB_KEY_Prev_Virtual_Screen = $fed1;
    XKB_KEY_Next_Virtual_Screen = $fed2;
    XKB_KEY_Last_Virtual_Screen = $fed4;
    XKB_KEY_Terminate_Server = $fed5;
    XKB_KEY_AccessX_Enable = $fe70;
    XKB_KEY_AccessX_Feedback_Enable = $fe71;
    XKB_KEY_RepeatKeys_Enable = $fe72;
    XKB_KEY_SlowKeys_Enable = $fe73;
    XKB_KEY_BounceKeys_Enable = $fe74;
    XKB_KEY_StickyKeys_Enable = $fe75;
    XKB_KEY_MouseKeys_Enable = $fe76;
    XKB_KEY_MouseKeys_Accel_Enable = $fe77;
    XKB_KEY_Overlay1_Enable = $fe78;
    XKB_KEY_Overlay2_Enable = $fe79;
    XKB_KEY_AudibleBell_Enable = $fe7a;
    XKB_KEY_Pointer_Left = $fee0;
    XKB_KEY_Pointer_Right = $fee1;
    XKB_KEY_Pointer_Up = $fee2;
    XKB_KEY_Pointer_Down = $fee3;
    XKB_KEY_Pointer_UpLeft = $fee4;
    XKB_KEY_Pointer_UpRight = $fee5;
    XKB_KEY_Pointer_DownLeft = $fee6;
    XKB_KEY_Pointer_DownRight = $fee7;
    XKB_KEY_Pointer_Button_Dflt = $fee8;
    XKB_KEY_Pointer_Button1 = $fee9;
    XKB_KEY_Pointer_Button2 = $feea;
    XKB_KEY_Pointer_Button3 = $feeb;
    XKB_KEY_Pointer_Button4 = $feec;
    XKB_KEY_Pointer_Button5 = $feed;
    XKB_KEY_Pointer_DblClick_Dflt = $feee;
    XKB_KEY_Pointer_DblClick1 = $feef;
    XKB_KEY_Pointer_DblClick2 = $fef0;
    XKB_KEY_Pointer_DblClick3 = $fef1;
    XKB_KEY_Pointer_DblClick4 = $fef2;
    XKB_KEY_Pointer_DblClick5 = $fef3;
    XKB_KEY_Pointer_Drag_Dflt = $fef4;
    XKB_KEY_Pointer_Drag1 = $fef5;
    XKB_KEY_Pointer_Drag2 = $fef6;
    XKB_KEY_Pointer_Drag3 = $fef7;
    XKB_KEY_Pointer_Drag4 = $fef8;
    XKB_KEY_Pointer_Drag5 = $fefd;
    XKB_KEY_Pointer_EnableKeys = $fef9;
    XKB_KEY_Pointer_Accelerate = $fefa;
    XKB_KEY_Pointer_DfltBtnNext = $fefb;
    XKB_KEY_Pointer_DfltBtnPrev = $fefc;
  { Single-Stroke Multiple-Character N-Graph Keysyms For The X Input Method  }
    XKB_KEY_ch = $fea0;
    XKB_KEY_Ch_ = $fea1;
    XKB_KEY_CH__ = $fea2;
    XKB_KEY_c_h = $fea3;
    XKB_KEY_C_h_ = $fea4;
    XKB_KEY_C_H__ = $fea5;
  {
   * 3270 Terminal Keys
   * Byte 3 = 0xfd
    }
    XKB_KEY_3270_Duplicate = $fd01;
    XKB_KEY_3270_FieldMark = $fd02;
    XKB_KEY_3270_Right2 = $fd03;
    XKB_KEY_3270_Left2 = $fd04;
    XKB_KEY_3270_BackTab = $fd05;
    XKB_KEY_3270_EraseEOF = $fd06;
    XKB_KEY_3270_EraseInput = $fd07;
    XKB_KEY_3270_Reset = $fd08;
    XKB_KEY_3270_Quit = $fd09;
    XKB_KEY_3270_PA1 = $fd0a;
    XKB_KEY_3270_PA2 = $fd0b;
    XKB_KEY_3270_PA3 = $fd0c;
    XKB_KEY_3270_Test = $fd0d;
    XKB_KEY_3270_Attn = $fd0e;
    XKB_KEY_3270_CursorBlink = $fd0f;
    XKB_KEY_3270_AltCursor = $fd10;
    XKB_KEY_3270_KeyClick = $fd11;
    XKB_KEY_3270_Jump = $fd12;
    XKB_KEY_3270_Ident = $fd13;
    XKB_KEY_3270_Rule = $fd14;
    XKB_KEY_3270_Copy = $fd15;
    XKB_KEY_3270_Play = $fd16;
    XKB_KEY_3270_Setup = $fd17;
    XKB_KEY_3270_Record = $fd18;
    XKB_KEY_3270_ChangeScreen = $fd19;
    XKB_KEY_3270_DeleteWord = $fd1a;
    XKB_KEY_3270_ExSelect = $fd1b;
    XKB_KEY_3270_CursorSelect = $fd1c;
    XKB_KEY_3270_PrintScreen = $fd1d;
    XKB_KEY_3270_Enter = $fd1e;
  {
   * Latin 1
   * (ISO/IEC 8859-1 = Unicode U+0020..U+00FF)
   * Byte 3 = 0
    }
  { U+0020 SPACE  }
    XKB_KEY_space = $0020;
  { U+0021 EXCLAMATION MARK  }
    XKB_KEY_exclam = $0021;
  { U+0022 QUOTATION MARK  }
    XKB_KEY_quotedbl = $0022;
  { U+0023 NUMBER SIGN  }
    XKB_KEY_numbersign = $0023;
  { U+0024 DOLLAR SIGN  }
    XKB_KEY_dollar = $0024;
  { U+0025 PERCENT SIGN  }
    XKB_KEY_percent = $0025;
  { U+0026 AMPERSAND  }
    XKB_KEY_ampersand = $0026;
  { U+0027 APOSTROPHE  }
    XKB_KEY_apostrophe = $0027;
  { U+0028 LEFT PARENTHESIS  }
    XKB_KEY_parenleft = $0028;
  { U+0029 RIGHT PARENTHESIS  }
    XKB_KEY_parenright = $0029;
  { U+002A ASTERISK  }
    XKB_KEY_asterisk = $002a;
  { U+002B PLUS SIGN  }
    XKB_KEY_plus = $002b;
  { U+002C COMMA  }
    XKB_KEY_comma = $002c;
  { U+002D HYPHEN-MINUS  }
    XKB_KEY_minus = $002d;
  { U+002E FULL STOP  }
    XKB_KEY_period = $002e;
  { U+002F SOLIDUS  }
    XKB_KEY_slash = $002f;
  { U+0030 DIGIT ZERO  }
    XKB_KEY_0 = $0030;
  { U+0031 DIGIT ONE  }
    XKB_KEY_1 = $0031;
  { U+0032 DIGIT TWO  }
    XKB_KEY_2 = $0032;
  { U+0033 DIGIT THREE  }
    XKB_KEY_3 = $0033;
  { U+0034 DIGIT FOUR  }
    XKB_KEY_4 = $0034;
  { U+0035 DIGIT FIVE  }
    XKB_KEY_5 = $0035;
  { U+0036 DIGIT SIX  }
    XKB_KEY_6 = $0036;
  { U+0037 DIGIT SEVEN  }
    XKB_KEY_7 = $0037;
  { U+0038 DIGIT EIGHT  }
    XKB_KEY_8 = $0038;
  { U+0039 DIGIT NINE  }
    XKB_KEY_9 = $0039;
  { U+003A COLON  }
    XKB_KEY_colon = $003a;
  { U+003B SEMICOLON  }
    XKB_KEY_semicolon = $003b;
  { U+003C LESS-THAN SIGN  }
    XKB_KEY_less = $003c;
  { U+003D EQUALS SIGN  }
    XKB_KEY_equal = $003d;
  { U+003E GREATER-THAN SIGN  }
    XKB_KEY_greater = $003e;
  { U+003F QUESTION MARK  }
    XKB_KEY_question = $003f;
  { U+0040 COMMERCIAL AT  }
    XKB_KEY_at = $0040;
  { U+0041 LATIN CAPITAL LETTER A  }
    XKB_KEY_A = $0041;
  { U+0042 LATIN CAPITAL LETTER B  }
    XKB_KEY_B = $0042;
  { U+0043 LATIN CAPITAL LETTER C  }
    XKB_KEY_C = $0043;
  { U+0044 LATIN CAPITAL LETTER D  }
    XKB_KEY_D = $0044;
  { U+0045 LATIN CAPITAL LETTER E  }
    XKB_KEY_E = $0045;
  { U+0046 LATIN CAPITAL LETTER F  }
    XKB_KEY_F = $0046;
  { U+0047 LATIN CAPITAL LETTER G  }
    XKB_KEY_G = $0047;
  { U+0048 LATIN CAPITAL LETTER H  }
    XKB_KEY_H = $0048;
  { U+0049 LATIN CAPITAL LETTER I  }
    XKB_KEY_I = $0049;
  { U+004A LATIN CAPITAL LETTER J  }
    XKB_KEY_J = $004a;
  { U+004B LATIN CAPITAL LETTER K  }
    XKB_KEY_K = $004b;
  { U+004C LATIN CAPITAL LETTER L  }
    XKB_KEY_L = $004c;
  { U+004D LATIN CAPITAL LETTER M  }
    XKB_KEY_M = $004d;
  { U+004E LATIN CAPITAL LETTER N  }
    XKB_KEY_N = $004e;
  { U+004F LATIN CAPITAL LETTER O  }
    XKB_KEY_O = $004f;
  { U+0050 LATIN CAPITAL LETTER P  }
    XKB_KEY_P = $0050;
  { U+0051 LATIN CAPITAL LETTER Q  }
    XKB_KEY_Q = $0051;
  { U+0052 LATIN CAPITAL LETTER R  }
    XKB_KEY_R = $0052;
  { U+0053 LATIN CAPITAL LETTER S  }
    XKB_KEY_S = $0053;
  { U+0054 LATIN CAPITAL LETTER T  }
    XKB_KEY_T = $0054;
  { U+0055 LATIN CAPITAL LETTER U  }
    XKB_KEY_U = $0055;
  { U+0056 LATIN CAPITAL LETTER V  }
    XKB_KEY_V = $0056;
  { U+0057 LATIN CAPITAL LETTER W  }
    XKB_KEY_W = $0057;
  { U+0058 LATIN CAPITAL LETTER X  }
    XKB_KEY_X = $0058;
  { U+0059 LATIN CAPITAL LETTER Y  }
    XKB_KEY_Y = $0059;
  { U+005A LATIN CAPITAL LETTER Z  }
    XKB_KEY_Z = $005a;
  { U+005B LEFT SQUARE BRACKET  }
    XKB_KEY_bracketleft = $005b;
  { U+005C REVERSE SOLIDUS  }
    XKB_KEY_backslash = $005c;
  { U+005D RIGHT SQUARE BRACKET  }
    XKB_KEY_bracketright = $005d;
  { U+005E CIRCUMFLEX ACCENT  }
    XKB_KEY_asciicircum = $005e;
  { U+005F LOW LINE  }
    XKB_KEY_underscore = $005f;
  { U+0060 GRAVE ACCENT  }
    XKB_KEY_grave = $0060;
  { U+0061 LATIN SMALL LETTER A  }
    XKB_KEY_a_= $0061;
  { U+0062 LATIN SMALL LETTER B  }
    XKB_KEY_b_ = $0062;
  { U+0063 LATIN SMALL LETTER C  }
    XKB_KEY_c_ = $0063;
  { U+0064 LATIN SMALL LETTER D  }
    XKB_KEY_d_ = $0064;
  { U+0065 LATIN SMALL LETTER E  }
    XKB_KEY_e_ = $0065;
  { U+0066 LATIN SMALL LETTER F  }
    XKB_KEY_f_ = $0066;
  { U+0067 LATIN SMALL LETTER G  }
    XKB_KEY_g_ = $0067;
  { U+0068 LATIN SMALL LETTER H  }
    XKB_KEY_h_ = $0068;
  { U+0069 LATIN SMALL LETTER I  }
    XKB_KEY_i_ = $0069;
  { U+006A LATIN SMALL LETTER J  }
    XKB_KEY_j_ = $006a;
  { U+006B LATIN SMALL LETTER K  }
    XKB_KEY_k_ = $006b;
  { U+006C LATIN SMALL LETTER L  }
    XKB_KEY_l_ = $006c;
  { U+006D LATIN SMALL LETTER M  }
    XKB_KEY_m_ = $006d;
  { U+006E LATIN SMALL LETTER N  }
    XKB_KEY_n_ = $006e;
  { U+006F LATIN SMALL LETTER O  }
    XKB_KEY_o_ = $006f;
  { U+0070 LATIN SMALL LETTER P  }
    XKB_KEY_p_ = $0070;
  { U+0071 LATIN SMALL LETTER Q  }
    XKB_KEY_q_ = $0071;
  { U+0072 LATIN SMALL LETTER R  }
    XKB_KEY_r_ = $0072;
  { U+0073 LATIN SMALL LETTER S  }
    XKB_KEY_s_ = $0073;
  { U+0074 LATIN SMALL LETTER T  }
    XKB_KEY_t_ = $0074;
  { U+0075 LATIN SMALL LETTER U  }
    XKB_KEY_u_ = $0075;
  { U+0076 LATIN SMALL LETTER V  }
    XKB_KEY_v_ = $0076;
  { U+0077 LATIN SMALL LETTER W  }
    XKB_KEY_w_ = $0077;
  { U+0078 LATIN SMALL LETTER X  }
    XKB_KEY_x_ = $0078;
  { U+0079 LATIN SMALL LETTER Y  }
    XKB_KEY_y_ = $0079;
  { U+007A LATIN SMALL LETTER Z  }
    XKB_KEY_z_ = $007a;
  { U+007B LEFT CURLY BRACKET  }
    XKB_KEY_braceleft = $007b;
  { U+007C VERTICAL LINE  }
    XKB_KEY_bar = $007c;
  { U+007D RIGHT CURLY BRACKET  }
    XKB_KEY_braceright = $007d;
  { U+007E TILDE  }
    XKB_KEY_asciitilde = $007e;
  { U+00A0 NO-BREAK SPACE  }
    XKB_KEY_nobreakspace = $00a0;
  { U+00A1 INVERTED EXCLAMATION MARK  }
    XKB_KEY_exclamdown = $00a1;
  { U+00A2 CENT SIGN  }
    XKB_KEY_cent = $00a2;
  { U+00A3 POUND SIGN  }
    XKB_KEY_sterling = $00a3;
  { U+00A4 CURRENCY SIGN  }
    XKB_KEY_currency = $00a4;
  { U+00A5 YEN SIGN  }
    XKB_KEY_yen = $00a5;
  { U+00A6 BROKEN BAR  }
    XKB_KEY_brokenbar = $00a6;
  { U+00A7 SECTION SIGN  }
    XKB_KEY_section = $00a7;
  { U+00A8 DIAERESIS  }
    XKB_KEY_diaeresis = $00a8;
  { U+00A9 COPYRIGHT SIGN  }
    XKB_KEY_copyright = $00a9;
  { U+00AA FEMININE ORDINAL INDICATOR  }
    XKB_KEY_ordfeminine = $00aa;
  { U+00AB LEFT-POINTING DOUBLE ANGLE QUOTATION MARK  }
    XKB_KEY_guillemotleft = $00ab;
  { U+00AC NOT SIGN  }
    XKB_KEY_notsign = $00ac;
  { U+00AD SOFT HYPHEN  }
    XKB_KEY_hyphen = $00ad;
  { U+00AE REGISTERED SIGN  }
    XKB_KEY_registered = $00ae;
  { U+00AF MACRON  }
    XKB_KEY_macron = $00af;
  { U+00B0 DEGREE SIGN  }
    XKB_KEY_degree = $00b0;
  { U+00B1 PLUS-MINUS SIGN  }
    XKB_KEY_plusminus = $00b1;
  { U+00B2 SUPERSCRIPT TWO  }
    XKB_KEY_twosuperior = $00b2;
  { U+00B3 SUPERSCRIPT THREE  }
    XKB_KEY_threesuperior = $00b3;
  { U+00B4 ACUTE ACCENT  }
    XKB_KEY_acute = $00b4;
  { U+00B5 MICRO SIGN  }
    XKB_KEY_mu = $00b5;
  { U+00B6 PILCROW SIGN  }
    XKB_KEY_paragraph = $00b6;
  { U+00B7 MIDDLE DOT  }
    XKB_KEY_periodcentered = $00b7;
  { U+00B8 CEDILLA  }
    XKB_KEY_cedilla = $00b8;
  { U+00B9 SUPERSCRIPT ONE  }
    XKB_KEY_onesuperior = $00b9;
  { U+00BA MASCULINE ORDINAL INDICATOR  }
    XKB_KEY_masculine = $00ba;
  { U+00BB RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK  }
    XKB_KEY_guillemotright = $00bb;
  { U+00BC VULGAR FRACTION ONE QUARTER  }
    XKB_KEY_onequarter = $00bc;
  { U+00BD VULGAR FRACTION ONE HALF  }
    XKB_KEY_onehalf = $00bd;
  { U+00BE VULGAR FRACTION THREE QUARTERS  }
    XKB_KEY_threequarters = $00be;
  { U+00BF INVERTED QUESTION MARK  }
    XKB_KEY_questiondown = $00bf;
  { U+00C0 LATIN CAPITAL LETTER A WITH GRAVE  }
    XKB_KEY_Agrave = $00c0;
  { U+00C1 LATIN CAPITAL LETTER A WITH ACUTE  }
    XKB_KEY_Aacute = $00c1;
  { U+00C2 LATIN CAPITAL LETTER A WITH CIRCUMFLEX  }
    XKB_KEY_Acircumflex = $00c2;
  { U+00C3 LATIN CAPITAL LETTER A WITH TILDE  }
    XKB_KEY_Atilde = $00c3;
  { U+00C4 LATIN CAPITAL LETTER A WITH DIAERESIS  }
    XKB_KEY_Adiaeresis = $00c4;
  { U+00C5 LATIN CAPITAL LETTER A WITH RING ABOVE  }
    XKB_KEY_Aring = $00c5;
  { U+00C6 LATIN CAPITAL LETTER AE  }
    XKB_KEY_AE = $00c6;
  { U+00C7 LATIN CAPITAL LETTER C WITH CEDILLA  }
    XKB_KEY_Ccedilla = $00c7;
  { U+00C8 LATIN CAPITAL LETTER E WITH GRAVE  }
    XKB_KEY_Egrave = $00c8;
  { U+00C9 LATIN CAPITAL LETTER E WITH ACUTE  }
    XKB_KEY_Eacute = $00c9;
  { U+00CA LATIN CAPITAL LETTER E WITH CIRCUMFLEX  }
    XKB_KEY_Ecircumflex = $00ca;
  { U+00CB LATIN CAPITAL LETTER E WITH DIAERESIS  }
    XKB_KEY_Ediaeresis = $00cb;
  { U+00CC LATIN CAPITAL LETTER I WITH GRAVE  }
    XKB_KEY_Igrave = $00cc;
  { U+00CD LATIN CAPITAL LETTER I WITH ACUTE  }
    XKB_KEY_Iacute = $00cd;
  { U+00CE LATIN CAPITAL LETTER I WITH CIRCUMFLEX  }
    XKB_KEY_Icircumflex = $00ce;
  { U+00CF LATIN CAPITAL LETTER I WITH DIAERESIS  }
    XKB_KEY_Idiaeresis = $00cf;
  { U+00D0 LATIN CAPITAL LETTER ETH  }
    XKB_KEY_ETH = $00d0;
  { U+00D1 LATIN CAPITAL LETTER N WITH TILDE  }
    XKB_KEY_Ntilde = $00d1;
  { U+00D2 LATIN CAPITAL LETTER O WITH GRAVE  }
    XKB_KEY_Ograve = $00d2;
  { U+00D3 LATIN CAPITAL LETTER O WITH ACUTE  }
    XKB_KEY_Oacute = $00d3;
  { U+00D4 LATIN CAPITAL LETTER O WITH CIRCUMFLEX  }
    XKB_KEY_Ocircumflex = $00d4;
  { U+00D5 LATIN CAPITAL LETTER O WITH TILDE  }
    XKB_KEY_Otilde = $00d5;
  { U+00D6 LATIN CAPITAL LETTER O WITH DIAERESIS  }
    XKB_KEY_Odiaeresis = $00d6;
  { U+00D7 MULTIPLICATION SIGN  }
    XKB_KEY_multiply = $00d7;
  { U+00D8 LATIN CAPITAL LETTER O WITH STROKE  }
    XKB_KEY_Oslash = $00d8;
  { U+00D8 LATIN CAPITAL LETTER O WITH STROKE  }
    XKB_KEY_Ooblique = $00d8;
  { U+00D9 LATIN CAPITAL LETTER U WITH GRAVE  }
    XKB_KEY_Ugrave = $00d9;
  { U+00DA LATIN CAPITAL LETTER U WITH ACUTE  }
    XKB_KEY_Uacute = $00da;
  { U+00DB LATIN CAPITAL LETTER U WITH CIRCUMFLEX  }
    XKB_KEY_Ucircumflex = $00db;
  { U+00DC LATIN CAPITAL LETTER U WITH DIAERESIS  }
    XKB_KEY_Udiaeresis = $00dc;
  { U+00DD LATIN CAPITAL LETTER Y WITH ACUTE  }
    XKB_KEY_Yacute = $00dd;
  { U+00DE LATIN CAPITAL LETTER THORN  }
    XKB_KEY_THORN = $00de;
  { U+00DF LATIN SMALL LETTER SHARP S  }
    XKB_KEY_ssharp = $00df;
  { U+00E0 LATIN SMALL LETTER A WITH GRAVE  }
    XKB_KEY_agrave_ = $00e0;
  { U+00E1 LATIN SMALL LETTER A WITH ACUTE  }
    XKB_KEY_aacute_ = $00e1;
  { U+00E2 LATIN SMALL LETTER A WITH CIRCUMFLEX  }
    XKB_KEY_acircumflex_ = $00e2;
  { U+00E3 LATIN SMALL LETTER A WITH TILDE  }
    XKB_KEY_atilde_ = $00e3;
  { U+00E4 LATIN SMALL LETTER A WITH DIAERESIS  }
    XKB_KEY_adiaeresis_ = $00e4;
  { U+00E5 LATIN SMALL LETTER A WITH RING ABOVE  }
    XKB_KEY_aring_ = $00e5;
  { U+00E6 LATIN SMALL LETTER AE  }
    XKB_KEY_ae_ = $00e6;
  { U+00E7 LATIN SMALL LETTER C WITH CEDILLA  }
    XKB_KEY_ccedilla_ = $00e7;
  { U+00E8 LATIN SMALL LETTER E WITH GRAVE  }
    XKB_KEY_egrave_ = $00e8;
  { U+00E9 LATIN SMALL LETTER E WITH ACUTE  }
    XKB_KEY_eacute_ = $00e9;
  { U+00EA LATIN SMALL LETTER E WITH CIRCUMFLEX  }
    XKB_KEY_ecircumflex_ = $00ea;
  { U+00EB LATIN SMALL LETTER E WITH DIAERESIS  }
    XKB_KEY_ediaeresis_ = $00eb;
  { U+00EC LATIN SMALL LETTER I WITH GRAVE  }
    XKB_KEY_igrave_ = $00ec;
  { U+00ED LATIN SMALL LETTER I WITH ACUTE  }
    XKB_KEY_iacute_ = $00ed;
  { U+00EE LATIN SMALL LETTER I WITH CIRCUMFLEX  }
    XKB_KEY_icircumflex_ = $00ee;
  { U+00EF LATIN SMALL LETTER I WITH DIAERESIS  }
    XKB_KEY_idiaeresis_ = $00ef;
  { U+00F0 LATIN SMALL LETTER ETH  }
    XKB_KEY_eth_ = $00f0;
  { U+00F1 LATIN SMALL LETTER N WITH TILDE  }
    XKB_KEY_ntilde_ = $00f1;
  { U+00F2 LATIN SMALL LETTER O WITH GRAVE  }
    XKB_KEY_ograve_ = $00f2;
  { U+00F3 LATIN SMALL LETTER O WITH ACUTE  }
    XKB_KEY_oacute_ = $00f3;
  { U+00F4 LATIN SMALL LETTER O WITH CIRCUMFLEX  }
    XKB_KEY_ocircumflex_ = $00f4;
  { U+00F5 LATIN SMALL LETTER O WITH TILDE  }
    XKB_KEY_otilde_ = $00f5;
  { U+00F6 LATIN SMALL LETTER O WITH DIAERESIS  }
    XKB_KEY_odiaeresis_ = $00f6;
  { U+00F7 DIVISION SIGN  }
    XKB_KEY_division = $00f7;
  { U+00F8 LATIN SMALL LETTER O WITH STROKE  }
    XKB_KEY_oslash_ = $00f8;
  { U+00F8 LATIN SMALL LETTER O WITH STROKE  }
    XKB_KEY_ooblique_ = $00f8;
  { U+00F9 LATIN SMALL LETTER U WITH GRAVE  }
    XKB_KEY_ugrave_ = $00f9;
  { U+00FA LATIN SMALL LETTER U WITH ACUTE  }
    XKB_KEY_uacute_ = $00fa;
  { U+00FB LATIN SMALL LETTER U WITH CIRCUMFLEX  }
    XKB_KEY_ucircumflex_ = $00fb;
  { U+00FC LATIN SMALL LETTER U WITH DIAERESIS  }
    XKB_KEY_udiaeresis_ = $00fc;
  { U+00FD LATIN SMALL LETTER Y WITH ACUTE  }
    XKB_KEY_yacute_ = $00fd;
  { U+00FE LATIN SMALL LETTER THORN  }
    XKB_KEY_thorn_ = $00fe;
  { U+00FF LATIN SMALL LETTER Y WITH DIAERESIS  }
    XKB_KEY_ydiaeresis_ = $00ff;
  {
   * Latin 2
   * Byte 3 = 1
    }
  { U+0104 LATIN CAPITAL LETTER A WITH OGONEK  }
    XKB_KEY_Aogonek = $01a1;
  { U+02D8 BREVE  }
    XKB_KEY_breve = $01a2;
  { U+0141 LATIN CAPITAL LETTER L WITH STROKE  }
    XKB_KEY_Lstroke = $01a3;
  { U+013D LATIN CAPITAL LETTER L WITH CARON  }
    XKB_KEY_Lcaron = $01a5;
  { U+015A LATIN CAPITAL LETTER S WITH ACUTE  }
    XKB_KEY_Sacute = $01a6;
  { U+0160 LATIN CAPITAL LETTER S WITH CARON  }
    XKB_KEY_Scaron = $01a9;
  { U+015E LATIN CAPITAL LETTER S WITH CEDILLA  }
    XKB_KEY_Scedilla = $01aa;
  { U+0164 LATIN CAPITAL LETTER T WITH CARON  }
    XKB_KEY_Tcaron = $01ab;
  { U+0179 LATIN CAPITAL LETTER Z WITH ACUTE  }
    XKB_KEY_Zacute = $01ac;
  { U+017D LATIN CAPITAL LETTER Z WITH CARON  }
    XKB_KEY_Zcaron = $01ae;
  { U+017B LATIN CAPITAL LETTER Z WITH DOT ABOVE  }
    XKB_KEY_Zabovedot = $01af;
  { U+0105 LATIN SMALL LETTER A WITH OGONEK  }
    XKB_KEY_aogonek_ = $01b1;
  { U+02DB OGONEK  }
    XKB_KEY_ogonek = $01b2;
  { U+0142 LATIN SMALL LETTER L WITH STROKE  }
    XKB_KEY_lstroke_ = $01b3;
  { U+013E LATIN SMALL LETTER L WITH CARON  }
    XKB_KEY_lcaron_ = $01b5;
  { U+015B LATIN SMALL LETTER S WITH ACUTE  }
    XKB_KEY_sacute_ = $01b6;
  { U+02C7 CARON  }
    XKB_KEY_caron = $01b7;
  { U+0161 LATIN SMALL LETTER S WITH CARON  }
    XKB_KEY_scaron_ = $01b9;
  { U+015F LATIN SMALL LETTER S WITH CEDILLA  }
    XKB_KEY_scedilla_ = $01ba;
  { U+0165 LATIN SMALL LETTER T WITH CARON  }
    XKB_KEY_tcaron_ = $01bb;
  { U+017A LATIN SMALL LETTER Z WITH ACUTE  }
    XKB_KEY_zacute_ = $01bc;
  { U+02DD DOUBLE ACUTE ACCENT  }
    XKB_KEY_doubleacute = $01bd;
  { U+017E LATIN SMALL LETTER Z WITH CARON  }
    XKB_KEY_zcaron_ = $01be;
  { U+017C LATIN SMALL LETTER Z WITH DOT ABOVE  }
    XKB_KEY_zabovedot_ = $01bf;
  { U+0154 LATIN CAPITAL LETTER R WITH ACUTE  }
    XKB_KEY_Racute = $01c0;
  { U+0102 LATIN CAPITAL LETTER A WITH BREVE  }
    XKB_KEY_Abreve = $01c3;
  { U+0139 LATIN CAPITAL LETTER L WITH ACUTE  }
    XKB_KEY_Lacute = $01c5;
  { U+0106 LATIN CAPITAL LETTER C WITH ACUTE  }
    XKB_KEY_Cacute = $01c6;
  { U+010C LATIN CAPITAL LETTER C WITH CARON  }
    XKB_KEY_Ccaron = $01c8;
  { U+0118 LATIN CAPITAL LETTER E WITH OGONEK  }
    XKB_KEY_Eogonek = $01ca;
  { U+011A LATIN CAPITAL LETTER E WITH CARON  }
    XKB_KEY_Ecaron = $01cc;
  { U+010E LATIN CAPITAL LETTER D WITH CARON  }
    XKB_KEY_Dcaron = $01cf;
  { U+0110 LATIN CAPITAL LETTER D WITH STROKE  }
    XKB_KEY_Dstroke = $01d0;
  { U+0143 LATIN CAPITAL LETTER N WITH ACUTE  }
    XKB_KEY_Nacute = $01d1;
  { U+0147 LATIN CAPITAL LETTER N WITH CARON  }
    XKB_KEY_Ncaron = $01d2;
  { U+0150 LATIN CAPITAL LETTER O WITH DOUBLE ACUTE  }
    XKB_KEY_Odoubleacute = $01d5;
  { U+0158 LATIN CAPITAL LETTER R WITH CARON  }
    XKB_KEY_Rcaron = $01d8;
  { U+016E LATIN CAPITAL LETTER U WITH RING ABOVE  }
    XKB_KEY_Uring = $01d9;
  { U+0170 LATIN CAPITAL LETTER U WITH DOUBLE ACUTE  }
    XKB_KEY_Udoubleacute = $01db;
  { U+0162 LATIN CAPITAL LETTER T WITH CEDILLA  }
    XKB_KEY_Tcedilla = $01de;
  { U+0155 LATIN SMALL LETTER R WITH ACUTE  }
    XKB_KEY_racute_ = $01e0;
  { U+0103 LATIN SMALL LETTER A WITH BREVE  }
    XKB_KEY_abreve_ = $01e3;
  { U+013A LATIN SMALL LETTER L WITH ACUTE  }
    XKB_KEY_lacute_ = $01e5;
  { U+0107 LATIN SMALL LETTER C WITH ACUTE  }
    XKB_KEY_cacute_ = $01e6;
  { U+010D LATIN SMALL LETTER C WITH CARON  }
    XKB_KEY_ccaron_ = $01e8;
  { U+0119 LATIN SMALL LETTER E WITH OGONEK  }
    XKB_KEY_eogonek_ = $01ea;
  { U+011B LATIN SMALL LETTER E WITH CARON  }
    XKB_KEY_ecaron_ = $01ec;
  { U+010F LATIN SMALL LETTER D WITH CARON  }
    XKB_KEY_dcaron_ = $01ef;
  { U+0111 LATIN SMALL LETTER D WITH STROKE  }
    XKB_KEY_dstroke_ = $01f0;
  { U+0144 LATIN SMALL LETTER N WITH ACUTE  }
    XKB_KEY_nacute_ = $01f1;
  { U+0148 LATIN SMALL LETTER N WITH CARON  }
    XKB_KEY_ncaron_ = $01f2;
  { U+0151 LATIN SMALL LETTER O WITH DOUBLE ACUTE  }
    XKB_KEY_odoubleacute_ = $01f5;
  { U+0159 LATIN SMALL LETTER R WITH CARON  }
    XKB_KEY_rcaron_ = $01f8;
  { U+016F LATIN SMALL LETTER U WITH RING ABOVE  }
    XKB_KEY_uring_ = $01f9;
  { U+0171 LATIN SMALL LETTER U WITH DOUBLE ACUTE  }
    XKB_KEY_udoubleacute_ = $01fb;
  { U+0163 LATIN SMALL LETTER T WITH CEDILLA  }
    XKB_KEY_tcedilla_ = $01fe;
  { U+02D9 DOT ABOVE  }
    XKB_KEY_abovedot = $01ff;
  {
   * Latin 3
   * Byte 3 = 2
    }
  { U+0126 LATIN CAPITAL LETTER H WITH STROKE  }
    XKB_KEY_Hstroke = $02a1;
  { U+0124 LATIN CAPITAL LETTER H WITH CIRCUMFLEX  }
    XKB_KEY_Hcircumflex = $02a6;
  { U+0130 LATIN CAPITAL LETTER I WITH DOT ABOVE  }
    XKB_KEY_Iabovedot = $02a9;
  { U+011E LATIN CAPITAL LETTER G WITH BREVE  }
    XKB_KEY_Gbreve = $02ab;
  { U+0134 LATIN CAPITAL LETTER J WITH CIRCUMFLEX  }
    XKB_KEY_Jcircumflex = $02ac;
  { U+0127 LATIN SMALL LETTER H WITH STROKE  }
    XKB_KEY_hstroke_ = $02b1;
  { U+0125 LATIN SMALL LETTER H WITH CIRCUMFLEX  }
    XKB_KEY_hcircumflex_ = $02b6;
  { U+0131 LATIN SMALL LETTER DOTLESS I  }
    XKB_KEY_idotless_ = $02b9;
  { U+011F LATIN SMALL LETTER G WITH BREVE  }
    XKB_KEY_gbreve_ = $02bb;
  { U+0135 LATIN SMALL LETTER J WITH CIRCUMFLEX  }
    XKB_KEY_jcircumflex_ = $02bc;
  { U+010A LATIN CAPITAL LETTER C WITH DOT ABOVE  }
    XKB_KEY_Cabovedot = $02c5;
  { U+0108 LATIN CAPITAL LETTER C WITH CIRCUMFLEX  }
    XKB_KEY_Ccircumflex = $02c6;
  { U+0120 LATIN CAPITAL LETTER G WITH DOT ABOVE  }
    XKB_KEY_Gabovedot = $02d5;
  { U+011C LATIN CAPITAL LETTER G WITH CIRCUMFLEX  }
    XKB_KEY_Gcircumflex = $02d8;
  { U+016C LATIN CAPITAL LETTER U WITH BREVE  }
    XKB_KEY_Ubreve = $02dd;
  { U+015C LATIN CAPITAL LETTER S WITH CIRCUMFLEX  }
    XKB_KEY_Scircumflex = $02de;
  { U+010B LATIN SMALL LETTER C WITH DOT ABOVE  }
    XKB_KEY_cabovedot_ = $02e5;
  { U+0109 LATIN SMALL LETTER C WITH CIRCUMFLEX  }
    XKB_KEY_ccircumflex_ = $02e6;
  { U+0121 LATIN SMALL LETTER G WITH DOT ABOVE  }
    XKB_KEY_gabovedot_ = $02f5;
  { U+011D LATIN SMALL LETTER G WITH CIRCUMFLEX  }
    XKB_KEY_gcircumflex_ = $02f8;
  { U+016D LATIN SMALL LETTER U WITH BREVE  }
    XKB_KEY_ubreve_ = $02fd;
  { U+015D LATIN SMALL LETTER S WITH CIRCUMFLEX  }
    XKB_KEY_scircumflex_ = $02fe;
  {
   * Latin 4
   * Byte 3 = 3
    }
  { U+0138 LATIN SMALL LETTER KRA  }
    XKB_KEY_kra = $03a2;
  { deprecated  }
    XKB_KEY_kappa = $03a2;
  { U+0156 LATIN CAPITAL LETTER R WITH CEDILLA  }
    XKB_KEY_Rcedilla = $03a3;
  { U+0128 LATIN CAPITAL LETTER I WITH TILDE  }
    XKB_KEY_Itilde = $03a5;
  { U+013B LATIN CAPITAL LETTER L WITH CEDILLA  }
    XKB_KEY_Lcedilla = $03a6;
  { U+0112 LATIN CAPITAL LETTER E WITH MACRON  }
    XKB_KEY_Emacron = $03aa;
  { U+0122 LATIN CAPITAL LETTER G WITH CEDILLA  }
    XKB_KEY_Gcedilla = $03ab;
  { U+0166 LATIN CAPITAL LETTER T WITH STROKE  }
    XKB_KEY_Tslash = $03ac;
  { U+0157 LATIN SMALL LETTER R WITH CEDILLA  }
    XKB_KEY_rcedilla_ = $03b3;
  { U+0129 LATIN SMALL LETTER I WITH TILDE  }
    XKB_KEY_itilde_ = $03b5;
  { U+013C LATIN SMALL LETTER L WITH CEDILLA  }
    XKB_KEY_lcedilla_ = $03b6;
  { U+0113 LATIN SMALL LETTER E WITH MACRON  }
    XKB_KEY_emacron_ = $03ba;
  { U+0123 LATIN SMALL LETTER G WITH CEDILLA  }
    XKB_KEY_gcedilla_ = $03bb;
  { U+0167 LATIN SMALL LETTER T WITH STROKE  }
    XKB_KEY_tslash_ = $03bc;
  { U+014A LATIN CAPITAL LETTER ENG  }
    XKB_KEY_ENG = $03bd;
  { U+014B LATIN SMALL LETTER ENG  }
    XKB_KEY_eng_ = $03bf;
  { U+0100 LATIN CAPITAL LETTER A WITH MACRON  }
    XKB_KEY_Amacron = $03c0;
  { U+012E LATIN CAPITAL LETTER I WITH OGONEK  }
    XKB_KEY_Iogonek = $03c7;
  { U+0116 LATIN CAPITAL LETTER E WITH DOT ABOVE  }
    XKB_KEY_Eabovedot = $03cc;
  { U+012A LATIN CAPITAL LETTER I WITH MACRON  }
    XKB_KEY_Imacron = $03cf;
  { U+0145 LATIN CAPITAL LETTER N WITH CEDILLA  }
    XKB_KEY_Ncedilla = $03d1;
  { U+014C LATIN CAPITAL LETTER O WITH MACRON  }
    XKB_KEY_Omacron = $03d2;
  { U+0136 LATIN CAPITAL LETTER K WITH CEDILLA  }
    XKB_KEY_Kcedilla = $03d3;
  { U+0172 LATIN CAPITAL LETTER U WITH OGONEK  }
    XKB_KEY_Uogonek = $03d9;
  { U+0168 LATIN CAPITAL LETTER U WITH TILDE  }
    XKB_KEY_Utilde = $03dd;
  { U+016A LATIN CAPITAL LETTER U WITH MACRON  }
    XKB_KEY_Umacron = $03de;
  { U+0101 LATIN SMALL LETTER A WITH MACRON  }
    XKB_KEY_amacron_ = $03e0;
  { U+012F LATIN SMALL LETTER I WITH OGONEK  }
    XKB_KEY_iogonek_ = $03e7;
  { U+0117 LATIN SMALL LETTER E WITH DOT ABOVE  }
    XKB_KEY_eabovedot_ = $03ec;
  { U+012B LATIN SMALL LETTER I WITH MACRON  }
    XKB_KEY_imacron_ = $03ef;
  { U+0146 LATIN SMALL LETTER N WITH CEDILLA  }
    XKB_KEY_ncedilla_ = $03f1;
  { U+014D LATIN SMALL LETTER O WITH MACRON  }
    XKB_KEY_omacron_ = $03f2;
  { U+0137 LATIN SMALL LETTER K WITH CEDILLA  }
    XKB_KEY_kcedilla_ = $03f3;
  { U+0173 LATIN SMALL LETTER U WITH OGONEK  }
    XKB_KEY_uogonek_ = $03f9;
  { U+0169 LATIN SMALL LETTER U WITH TILDE  }
    XKB_KEY_utilde_ = $03fd;
  { U+016B LATIN SMALL LETTER U WITH MACRON  }
    XKB_KEY_umacron_ = $03fe;
  {
   * Latin 8
    }
  { U+0174 LATIN CAPITAL LETTER W WITH CIRCUMFLEX  }
    XKB_KEY_Wcircumflex = $1000174;
  { U+0175 LATIN SMALL LETTER W WITH CIRCUMFLEX  }
    XKB_KEY_wcircumflex_ = $1000175;
  { U+0176 LATIN CAPITAL LETTER Y WITH CIRCUMFLEX  }
    XKB_KEY_Ycircumflex = $1000176;
  { U+0177 LATIN SMALL LETTER Y WITH CIRCUMFLEX  }
    XKB_KEY_ycircumflex_ = $1000177;
  { U+1E02 LATIN CAPITAL LETTER B WITH DOT ABOVE  }
    XKB_KEY_Babovedot = $1001e02;
  { U+1E03 LATIN SMALL LETTER B WITH DOT ABOVE  }
    XKB_KEY_babovedot_ = $1001e03;
  { U+1E0A LATIN CAPITAL LETTER D WITH DOT ABOVE  }
    XKB_KEY_Dabovedot = $1001e0a;
  { U+1E0B LATIN SMALL LETTER D WITH DOT ABOVE  }
    XKB_KEY_dabovedot_ = $1001e0b;
  { U+1E1E LATIN CAPITAL LETTER F WITH DOT ABOVE  }
    XKB_KEY_Fabovedot = $1001e1e;
  { U+1E1F LATIN SMALL LETTER F WITH DOT ABOVE  }
    XKB_KEY_fabovedot_ = $1001e1f;
  { U+1E40 LATIN CAPITAL LETTER M WITH DOT ABOVE  }
    XKB_KEY_Mabovedot = $1001e40;
  { U+1E41 LATIN SMALL LETTER M WITH DOT ABOVE  }
    XKB_KEY_mabovedot_ = $1001e41;
  { U+1E56 LATIN CAPITAL LETTER P WITH DOT ABOVE  }
    XKB_KEY_Pabovedot = $1001e56;
  { U+1E57 LATIN SMALL LETTER P WITH DOT ABOVE  }
    XKB_KEY_pabovedot_ = $1001e57;
  { U+1E60 LATIN CAPITAL LETTER S WITH DOT ABOVE  }
    XKB_KEY_Sabovedot = $1001e60;
  { U+1E61 LATIN SMALL LETTER S WITH DOT ABOVE  }
    XKB_KEY_sabovedot_ = $1001e61;
  { U+1E6A LATIN CAPITAL LETTER T WITH DOT ABOVE  }
    XKB_KEY_Tabovedot = $1001e6a;
  { U+1E6B LATIN SMALL LETTER T WITH DOT ABOVE  }
    XKB_KEY_tabovedot_ = $1001e6b;
  { U+1E80 LATIN CAPITAL LETTER W WITH GRAVE  }
    XKB_KEY_Wgrave = $1001e80;
  { U+1E81 LATIN SMALL LETTER W WITH GRAVE  }
    XKB_KEY_wgrave_ = $1001e81;
  { U+1E82 LATIN CAPITAL LETTER W WITH ACUTE  }
    XKB_KEY_Wacute = $1001e82;
  { U+1E83 LATIN SMALL LETTER W WITH ACUTE  }
    XKB_KEY_wacute_ = $1001e83;
  { U+1E84 LATIN CAPITAL LETTER W WITH DIAERESIS  }
    XKB_KEY_Wdiaeresis = $1001e84;
  { U+1E85 LATIN SMALL LETTER W WITH DIAERESIS  }
    XKB_KEY_wdiaeresis_ = $1001e85;
  { U+1EF2 LATIN CAPITAL LETTER Y WITH GRAVE  }
    XKB_KEY_Ygrave = $1001ef2;
  { U+1EF3 LATIN SMALL LETTER Y WITH GRAVE  }
    XKB_KEY_ygrave_ = $1001ef3;
  {
   * Latin 9
   * Byte 3 = 0x13
    }
  { U+0152 LATIN CAPITAL LIGATURE OE  }
    XKB_KEY_OE = $13bc;
  { U+0153 LATIN SMALL LIGATURE OE  }
    XKB_KEY_oe_ = $13bd;
  { U+0178 LATIN CAPITAL LETTER Y WITH DIAERESIS  }
    XKB_KEY_Ydiaeresis = $13be;
  {
   * Katakana
   * Byte 3 = 4
    }
  { U+203E OVERLINE  }
    XKB_KEY_overline = $047e;
  { U+3002 IDEOGRAPHIC FULL STOP  }
    XKB_KEY_kana_fullstop = $04a1;
  { U+300C LEFT CORNER BRACKET  }
    XKB_KEY_kana_openingbracket = $04a2;
  { U+300D RIGHT CORNER BRACKET  }
    XKB_KEY_kana_closingbracket = $04a3;
  { U+3001 IDEOGRAPHIC COMMA  }
    XKB_KEY_kana_comma = $04a4;
  { U+30FB KATAKANA MIDDLE DOT  }
    XKB_KEY_kana_conjunctive = $04a5;
  { U+30F2 KATAKANA LETTER WO  }
    XKB_KEY_kana_WO = $04a6;
  { U+30A1 KATAKANA LETTER SMALL A  }
    XKB_KEY_kana_a = $04a7;
  { U+30A3 KATAKANA LETTER SMALL I  }
    XKB_KEY_kana_i = $04a8;
  { U+30A5 KATAKANA LETTER SMALL U  }
    XKB_KEY_kana_u = $04a9;
  { U+30A7 KATAKANA LETTER SMALL E  }
    XKB_KEY_kana_e = $04aa;
  { U+30A9 KATAKANA LETTER SMALL O  }
    XKB_KEY_kana_o = $04ab;
  { U+30E3 KATAKANA LETTER SMALL YA  }
    XKB_KEY_kana_ya = $04ac;
  { U+30E5 KATAKANA LETTER SMALL YU  }
    XKB_KEY_kana_yu = $04ad;
  { U+30E7 KATAKANA LETTER SMALL YO  }
    XKB_KEY_kana_yo = $04ae;
  { U+30C3 KATAKANA LETTER SMALL TU  }
    XKB_KEY_kana_tsu = $04af;
  { U+30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK  }
    XKB_KEY_prolongedsound = $04b0;
  { U+30A2 KATAKANA LETTER A  }
    XKB_KEY_kana_A_ = $04b1;
  { U+30A4 KATAKANA LETTER I  }
    XKB_KEY_kana_I_ = $04b2;
  { U+30A6 KATAKANA LETTER U  }
    XKB_KEY_kana_U_ = $04b3;
  { U+30A8 KATAKANA LETTER E  }
    XKB_KEY_kana_E_ = $04b4;
  { U+30AA KATAKANA LETTER O  }
    XKB_KEY_kana_O_ = $04b5;
  { U+30AB KATAKANA LETTER KA  }
    XKB_KEY_kana_KA = $04b6;
  { U+30AD KATAKANA LETTER KI  }
    XKB_KEY_kana_KI = $04b7;
  { U+30AF KATAKANA LETTER KU  }
    XKB_KEY_kana_KU = $04b8;
  { U+30B1 KATAKANA LETTER KE  }
    XKB_KEY_kana_KE = $04b9;
  { U+30B3 KATAKANA LETTER KO  }
    XKB_KEY_kana_KO = $04ba;
  { U+30B5 KATAKANA LETTER SA  }
    XKB_KEY_kana_SA = $04bb;
  { U+30B7 KATAKANA LETTER SI  }
    XKB_KEY_kana_SHI = $04bc;
  { U+30B9 KATAKANA LETTER SU  }
    XKB_KEY_kana_SU = $04bd;
  { U+30BB KATAKANA LETTER SE  }
    XKB_KEY_kana_SE = $04be;
  { U+30BD KATAKANA LETTER SO  }
    XKB_KEY_kana_SO = $04bf;
  { U+30BF KATAKANA LETTER TA  }
    XKB_KEY_kana_TA = $04c0;
  { U+30C1 KATAKANA LETTER TI  }
    XKB_KEY_kana_CHI = $04c1;
  { U+30C4 KATAKANA LETTER TU  }
    XKB_KEY_kana_TSU_ = $04c2;
  { U+30C6 KATAKANA LETTER TE  }
    XKB_KEY_kana_TE = $04c3;
  { U+30C8 KATAKANA LETTER TO  }
    XKB_KEY_kana_TO = $04c4;
  { U+30CA KATAKANA LETTER NA  }
    XKB_KEY_kana_NA = $04c5;
  { U+30CB KATAKANA LETTER NI  }
    XKB_KEY_kana_NI = $04c6;
  { U+30CC KATAKANA LETTER NU  }
    XKB_KEY_kana_NU = $04c7;
  { U+30CD KATAKANA LETTER NE  }
    XKB_KEY_kana_NE = $04c8;
  { U+30CE KATAKANA LETTER NO  }
    XKB_KEY_kana_NO = $04c9;
  { U+30CF KATAKANA LETTER HA  }
    XKB_KEY_kana_HA = $04ca;
  { U+30D2 KATAKANA LETTER HI  }
    XKB_KEY_kana_HI = $04cb;
  { U+30D5 KATAKANA LETTER HU  }
    XKB_KEY_kana_FU = $04cc;
  { U+30D8 KATAKANA LETTER HE  }
    XKB_KEY_kana_HE = $04cd;
  { U+30DB KATAKANA LETTER HO  }
    XKB_KEY_kana_HO = $04ce;
  { U+30DE KATAKANA LETTER MA  }
    XKB_KEY_kana_MA = $04cf;
  { U+30DF KATAKANA LETTER MI  }
    XKB_KEY_kana_MI = $04d0;
  { U+30E0 KATAKANA LETTER MU  }
    XKB_KEY_kana_MU = $04d1;
  { U+30E1 KATAKANA LETTER ME  }
    XKB_KEY_kana_ME = $04d2;
  { U+30E2 KATAKANA LETTER MO  }
    XKB_KEY_kana_MO = $04d3;
  { U+30E4 KATAKANA LETTER YA  }
    XKB_KEY_kana_YA_ = $04d4;
  { U+30E6 KATAKANA LETTER YU  }
    XKB_KEY_kana_YU_ = $04d5;
  { U+30E8 KATAKANA LETTER YO  }
    XKB_KEY_kana_YO_ = $04d6;
  { U+30E9 KATAKANA LETTER RA  }
    XKB_KEY_kana_RA = $04d7;
  { U+30EA KATAKANA LETTER RI  }
    XKB_KEY_kana_RI = $04d8;
  { U+30EB KATAKANA LETTER RU  }
    XKB_KEY_kana_RU = $04d9;
  { U+30EC KATAKANA LETTER RE  }
    XKB_KEY_kana_RE = $04da;
  { U+30ED KATAKANA LETTER RO  }
    XKB_KEY_kana_RO = $04db;
  { U+30EF KATAKANA LETTER WA  }
    XKB_KEY_kana_WA = $04dc;
  { U+30F3 KATAKANA LETTER N  }
    XKB_KEY_kana_N = $04dd;
  { U+309B KATAKANA-HIRAGANA VOICED SOUND MARK  }
    XKB_KEY_voicedsound = $04de;
  { U+309C KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK  }
    XKB_KEY_semivoicedsound = $04df;
  { Alias for mode_switch  }
    XKB_KEY_kana_switch = $ff7e;
  {
   * Arabic
   * Byte 3 = 5
    }
  { U+06F0 EXTENDED ARABIC-INDIC DIGIT ZERO  }
    XKB_KEY_Farsi_0 = $10006f0;
  { U+06F1 EXTENDED ARABIC-INDIC DIGIT ONE  }
    XKB_KEY_Farsi_1 = $10006f1;
  { U+06F2 EXTENDED ARABIC-INDIC DIGIT TWO  }
    XKB_KEY_Farsi_2 = $10006f2;
  { U+06F3 EXTENDED ARABIC-INDIC DIGIT THREE  }
    XKB_KEY_Farsi_3 = $10006f3;
  { U+06F4 EXTENDED ARABIC-INDIC DIGIT FOUR  }
    XKB_KEY_Farsi_4 = $10006f4;
  { U+06F5 EXTENDED ARABIC-INDIC DIGIT FIVE  }
    XKB_KEY_Farsi_5 = $10006f5;
  { U+06F6 EXTENDED ARABIC-INDIC DIGIT SIX  }
    XKB_KEY_Farsi_6 = $10006f6;
  { U+06F7 EXTENDED ARABIC-INDIC DIGIT SEVEN  }
    XKB_KEY_Farsi_7 = $10006f7;
  { U+06F8 EXTENDED ARABIC-INDIC DIGIT EIGHT  }
    XKB_KEY_Farsi_8 = $10006f8;
  { U+06F9 EXTENDED ARABIC-INDIC DIGIT NINE  }
    XKB_KEY_Farsi_9 = $10006f9;
  { U+066A ARABIC PERCENT SIGN  }
    XKB_KEY_Arabic_percent = $100066a;
  { U+0670 ARABIC LETTER SUPERSCRIPT ALEF  }
    XKB_KEY_Arabic_superscript_alef = $1000670;
  { U+0679 ARABIC LETTER TTEH  }
    XKB_KEY_Arabic_tteh = $1000679;
  { U+067E ARABIC LETTER PEH  }
    XKB_KEY_Arabic_peh = $100067e;
  { U+0686 ARABIC LETTER TCHEH  }
    XKB_KEY_Arabic_tcheh = $1000686;
  { U+0688 ARABIC LETTER DDAL  }
    XKB_KEY_Arabic_ddal = $1000688;
  { U+0691 ARABIC LETTER RREH  }
    XKB_KEY_Arabic_rreh = $1000691;
  { U+060C ARABIC COMMA  }
    XKB_KEY_Arabic_comma = $05ac;
  { U+06D4 ARABIC FULL STOP  }
    XKB_KEY_Arabic_fullstop = $10006d4;
  { U+0660 ARABIC-INDIC DIGIT ZERO  }
    XKB_KEY_Arabic_0 = $1000660;
  { U+0661 ARABIC-INDIC DIGIT ONE  }
    XKB_KEY_Arabic_1 = $1000661;
  { U+0662 ARABIC-INDIC DIGIT TWO  }
    XKB_KEY_Arabic_2 = $1000662;
  { U+0663 ARABIC-INDIC DIGIT THREE  }
    XKB_KEY_Arabic_3 = $1000663;
  { U+0664 ARABIC-INDIC DIGIT FOUR  }
    XKB_KEY_Arabic_4 = $1000664;
  { U+0665 ARABIC-INDIC DIGIT FIVE  }
    XKB_KEY_Arabic_5 = $1000665;
  { U+0666 ARABIC-INDIC DIGIT SIX  }
    XKB_KEY_Arabic_6 = $1000666;
  { U+0667 ARABIC-INDIC DIGIT SEVEN  }
    XKB_KEY_Arabic_7 = $1000667;
  { U+0668 ARABIC-INDIC DIGIT EIGHT  }
    XKB_KEY_Arabic_8 = $1000668;
  { U+0669 ARABIC-INDIC DIGIT NINE  }
    XKB_KEY_Arabic_9 = $1000669;
  { U+061B ARABIC SEMICOLON  }
    XKB_KEY_Arabic_semicolon = $05bb;
  { U+061F ARABIC QUESTION MARK  }
    XKB_KEY_Arabic_question_mark = $05bf;
  { U+0621 ARABIC LETTER HAMZA  }
    XKB_KEY_Arabic_hamza = $05c1;
  { U+0622 ARABIC LETTER ALEF WITH MADDA ABOVE  }
    XKB_KEY_Arabic_maddaonalef = $05c2;
  { U+0623 ARABIC LETTER ALEF WITH HAMZA ABOVE  }
    XKB_KEY_Arabic_hamzaonalef = $05c3;
  { U+0624 ARABIC LETTER WAW WITH HAMZA ABOVE  }
    XKB_KEY_Arabic_hamzaonwaw = $05c4;
  { U+0625 ARABIC LETTER ALEF WITH HAMZA BELOW  }
    XKB_KEY_Arabic_hamzaunderalef = $05c5;
  { U+0626 ARABIC LETTER YEH WITH HAMZA ABOVE  }
    XKB_KEY_Arabic_hamzaonyeh = $05c6;
  { U+0627 ARABIC LETTER ALEF  }
    XKB_KEY_Arabic_alef = $05c7;
  { U+0628 ARABIC LETTER BEH  }
    XKB_KEY_Arabic_beh = $05c8;
  { U+0629 ARABIC LETTER TEH MARBUTA  }
    XKB_KEY_Arabic_tehmarbuta = $05c9;
  { U+062A ARABIC LETTER TEH  }
    XKB_KEY_Arabic_teh = $05ca;
  { U+062B ARABIC LETTER THEH  }
    XKB_KEY_Arabic_theh = $05cb;
  { U+062C ARABIC LETTER JEEM  }
    XKB_KEY_Arabic_jeem = $05cc;
  { U+062D ARABIC LETTER HAH  }
    XKB_KEY_Arabic_hah = $05cd;
  { U+062E ARABIC LETTER KHAH  }
    XKB_KEY_Arabic_khah = $05ce;
  { U+062F ARABIC LETTER DAL  }
    XKB_KEY_Arabic_dal = $05cf;
  { U+0630 ARABIC LETTER THAL  }
    XKB_KEY_Arabic_thal = $05d0;
  { U+0631 ARABIC LETTER REH  }
    XKB_KEY_Arabic_ra = $05d1;
  { U+0632 ARABIC LETTER ZAIN  }
    XKB_KEY_Arabic_zain = $05d2;
  { U+0633 ARABIC LETTER SEEN  }
    XKB_KEY_Arabic_seen = $05d3;
  { U+0634 ARABIC LETTER SHEEN  }
    XKB_KEY_Arabic_sheen = $05d4;
  { U+0635 ARABIC LETTER SAD  }
    XKB_KEY_Arabic_sad = $05d5;
  { U+0636 ARABIC LETTER DAD  }
    XKB_KEY_Arabic_dad = $05d6;
  { U+0637 ARABIC LETTER TAH  }
    XKB_KEY_Arabic_tah = $05d7;
  { U+0638 ARABIC LETTER ZAH  }
    XKB_KEY_Arabic_zah = $05d8;
  { U+0639 ARABIC LETTER AIN  }
    XKB_KEY_Arabic_ain = $05d9;
  { U+063A ARABIC LETTER GHAIN  }
    XKB_KEY_Arabic_ghain = $05da;
  { U+0640 ARABIC TATWEEL  }
    XKB_KEY_Arabic_tatweel = $05e0;
  { U+0641 ARABIC LETTER FEH  }
    XKB_KEY_Arabic_feh = $05e1;
  { U+0642 ARABIC LETTER QAF  }
    XKB_KEY_Arabic_qaf = $05e2;
  { U+0643 ARABIC LETTER KAF  }
    XKB_KEY_Arabic_kaf = $05e3;
  { U+0644 ARABIC LETTER LAM  }
    XKB_KEY_Arabic_lam = $05e4;
  { U+0645 ARABIC LETTER MEEM  }
    XKB_KEY_Arabic_meem = $05e5;
  { U+0646 ARABIC LETTER NOON  }
    XKB_KEY_Arabic_noon = $05e6;
  { U+0647 ARABIC LETTER HEH  }
    XKB_KEY_Arabic_ha = $05e7;
  { U+0648 ARABIC LETTER WAW  }
    XKB_KEY_Arabic_waw = $05e8;
  { U+0649 ARABIC LETTER ALEF MAKSURA  }
    XKB_KEY_Arabic_alefmaksura = $05e9;
  { U+064A ARABIC LETTER YEH  }
    XKB_KEY_Arabic_yeh = $05ea;
  { U+064B ARABIC FATHATAN  }
    XKB_KEY_Arabic_fathatan = $05eb;
  { U+064C ARABIC DAMMATAN  }
    XKB_KEY_Arabic_dammatan = $05ec;
  { U+064D ARABIC KASRATAN  }
    XKB_KEY_Arabic_kasratan = $05ed;
  { U+064E ARABIC FATHA  }
    XKB_KEY_Arabic_fatha = $05ee;
  { U+064F ARABIC DAMMA  }
    XKB_KEY_Arabic_damma = $05ef;
  { U+0650 ARABIC KASRA  }
    XKB_KEY_Arabic_kasra = $05f0;
  { U+0651 ARABIC SHADDA  }
    XKB_KEY_Arabic_shadda = $05f1;
  { U+0652 ARABIC SUKUN  }
    XKB_KEY_Arabic_sukun = $05f2;
  { U+0653 ARABIC MADDAH ABOVE  }
    XKB_KEY_Arabic_madda_above = $1000653;
  { U+0654 ARABIC HAMZA ABOVE  }
    XKB_KEY_Arabic_hamza_above = $1000654;
  { U+0655 ARABIC HAMZA BELOW  }
    XKB_KEY_Arabic_hamza_below = $1000655;
  { U+0698 ARABIC LETTER JEH  }
    XKB_KEY_Arabic_jeh = $1000698;
  { U+06A4 ARABIC LETTER VEH  }
    XKB_KEY_Arabic_veh = $10006a4;
  { U+06A9 ARABIC LETTER KEHEH  }
    XKB_KEY_Arabic_keheh = $10006a9;
  { U+06AF ARABIC LETTER GAF  }
    XKB_KEY_Arabic_gaf = $10006af;
  { U+06BA ARABIC LETTER NOON GHUNNA  }
    XKB_KEY_Arabic_noon_ghunna = $10006ba;
  { U+06BE ARABIC LETTER HEH DOACHASHMEE  }
    XKB_KEY_Arabic_heh_doachashmee = $10006be;
  { U+06CC ARABIC LETTER FARSI YEH  }
    XKB_KEY_Farsi_yeh = $10006cc;
  { U+06CC ARABIC LETTER FARSI YEH  }
    XKB_KEY_Arabic_farsi_yeh = $10006cc;
  { U+06D2 ARABIC LETTER YEH BARREE  }
    XKB_KEY_Arabic_yeh_baree = $10006d2;
  { U+06C1 ARABIC LETTER HEH GOAL  }
    XKB_KEY_Arabic_heh_goal = $10006c1;
  { Alias for mode_switch  }
    XKB_KEY_Arabic_switch = $ff7e;
  {
   * Cyrillic
   * Byte 3 = 6
    }
  { U+0492 CYRILLIC CAPITAL LETTER GHE WITH STROKE  }
    XKB_KEY_Cyrillic_GHE_bar = $1000492;
  { U+0493 CYRILLIC SMALL LETTER GHE WITH STROKE  }
    XKB_KEY_Cyrillic_ghe_bar_ = $1000493;
  { U+0496 CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER  }
    XKB_KEY_Cyrillic_ZHE_descender = $1000496;
  { U+0497 CYRILLIC SMALL LETTER ZHE WITH DESCENDER  }
    XKB_KEY_Cyrillic_zhe_descender_ = $1000497;
  { U+049A CYRILLIC CAPITAL LETTER KA WITH DESCENDER  }
    XKB_KEY_Cyrillic_KA_descender = $100049a;
  { U+049B CYRILLIC SMALL LETTER KA WITH DESCENDER  }
    XKB_KEY_Cyrillic_ka_descender_ = $100049b;
  { U+049C CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE  }
    XKB_KEY_Cyrillic_KA_vertstroke = $100049c;
  { U+049D CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE  }
    XKB_KEY_Cyrillic_ka_vertstroke_ = $100049d;
  { U+04A2 CYRILLIC CAPITAL LETTER EN WITH DESCENDER  }
    XKB_KEY_Cyrillic_EN_descender = $10004a2;
  { U+04A3 CYRILLIC SMALL LETTER EN WITH DESCENDER  }
    XKB_KEY_Cyrillic_en_descender_ = $10004a3;
  { U+04AE CYRILLIC CAPITAL LETTER STRAIGHT U  }
    XKB_KEY_Cyrillic_U_straight = $10004ae;
  { U+04AF CYRILLIC SMALL LETTER STRAIGHT U  }
    XKB_KEY_Cyrillic_u_straight_ = $10004af;
  { U+04B0 CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE  }
    XKB_KEY_Cyrillic_U_straight_bar = $10004b0;
  { U+04B1 CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE  }
    XKB_KEY_Cyrillic_u_straight_bar_ = $10004b1;
  { U+04B2 CYRILLIC CAPITAL LETTER HA WITH DESCENDER  }
    XKB_KEY_Cyrillic_HA_descender = $10004b2;
  { U+04B3 CYRILLIC SMALL LETTER HA WITH DESCENDER  }
    XKB_KEY_Cyrillic_ha_descender_ = $10004b3;
  { U+04B6 CYRILLIC CAPITAL LETTER CHE WITH DESCENDER  }
    XKB_KEY_Cyrillic_CHE_descender = $10004b6;
  { U+04B7 CYRILLIC SMALL LETTER CHE WITH DESCENDER  }
    XKB_KEY_Cyrillic_che_descender_ = $10004b7;
  { U+04B8 CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE  }
    XKB_KEY_Cyrillic_CHE_vertstroke = $10004b8;
  { U+04B9 CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE  }
    XKB_KEY_Cyrillic_che_vertstroke_ = $10004b9;
  { U+04BA CYRILLIC CAPITAL LETTER SHHA  }
    XKB_KEY_Cyrillic_SHHA = $10004ba;
  { U+04BB CYRILLIC SMALL LETTER SHHA  }
    XKB_KEY_Cyrillic_shha_ = $10004bb;
  { U+04D8 CYRILLIC CAPITAL LETTER SCHWA  }
    XKB_KEY_Cyrillic_SCHWA = $10004d8;
  { U+04D9 CYRILLIC SMALL LETTER SCHWA  }
    XKB_KEY_Cyrillic_schwa_ = $10004d9;
  { U+04E2 CYRILLIC CAPITAL LETTER I WITH MACRON  }
    XKB_KEY_Cyrillic_I_macron = $10004e2;
  { U+04E3 CYRILLIC SMALL LETTER I WITH MACRON  }
    XKB_KEY_Cyrillic_i_macron_ = $10004e3;
  { U+04E8 CYRILLIC CAPITAL LETTER BARRED O  }
    XKB_KEY_Cyrillic_O_bar = $10004e8;
  { U+04E9 CYRILLIC SMALL LETTER BARRED O  }
    XKB_KEY_Cyrillic_o_bar_ = $10004e9;
  { U+04EE CYRILLIC CAPITAL LETTER U WITH MACRON  }
    XKB_KEY_Cyrillic_U_macron = $10004ee;
  { U+04EF CYRILLIC SMALL LETTER U WITH MACRON  }
    XKB_KEY_Cyrillic_u_macron_ = $10004ef;
  { U+0452 CYRILLIC SMALL LETTER DJE  }
    XKB_KEY_Serbian_dje = $06a1;
  { U+0453 CYRILLIC SMALL LETTER GJE  }
    XKB_KEY_Macedonia_gje = $06a2;
  { U+0451 CYRILLIC SMALL LETTER IO  }
    XKB_KEY_Cyrillic_io = $06a3;
  { U+0454 CYRILLIC SMALL LETTER UKRAINIAN IE  }
    XKB_KEY_Ukrainian_ie = $06a4;
  { U+0455 CYRILLIC SMALL LETTER DZE  }
    XKB_KEY_Macedonia_dse = $06a5;
  { U+0456 CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I  }
    XKB_KEY_Ukrainian_i = $06a6;
  { U+0457 CYRILLIC SMALL LETTER YI  }
    XKB_KEY_Ukrainian_yi = $06a7;
  { U+0458 CYRILLIC SMALL LETTER JE  }
    XKB_KEY_Cyrillic_je = $06a8;
  { U+0459 CYRILLIC SMALL LETTER LJE  }
    XKB_KEY_Cyrillic_lje = $06a9;
  { U+045A CYRILLIC SMALL LETTER NJE  }
    XKB_KEY_Cyrillic_nje = $06aa;
  { U+045B CYRILLIC SMALL LETTER TSHE  }
    XKB_KEY_Serbian_tshe = $06ab;
  { U+045C CYRILLIC SMALL LETTER KJE  }
    XKB_KEY_Macedonia_kje = $06ac;
  { U+0491 CYRILLIC SMALL LETTER GHE WITH UPTURN  }
    XKB_KEY_Ukrainian_ghe_with_upturn = $06ad;
  { U+045E CYRILLIC SMALL LETTER SHORT U  }
    XKB_KEY_Byelorussian_shortu = $06ae;
  { U+045F CYRILLIC SMALL LETTER DZHE  }
    XKB_KEY_Cyrillic_dzhe = $06af;
  { U+2116 NUMERO SIGN  }
    XKB_KEY_numerosign = $06b0;
  { U+0402 CYRILLIC CAPITAL LETTER DJE  }
    XKB_KEY_Serbian_DJE_ = $06b1;
  { U+0403 CYRILLIC CAPITAL LETTER GJE  }
    XKB_KEY_Macedonia_GJE_ = $06b2;
  { U+0401 CYRILLIC CAPITAL LETTER IO  }
    XKB_KEY_Cyrillic_IO_ = $06b3;
  { U+0404 CYRILLIC CAPITAL LETTER UKRAINIAN IE  }
    XKB_KEY_Ukrainian_IE_ = $06b4;
  { U+0405 CYRILLIC CAPITAL LETTER DZE  }
    XKB_KEY_Macedonia_DSE_ = $06b5;
  { U+0406 CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I  }
    XKB_KEY_Ukrainian_I_ = $06b6;
  { U+0407 CYRILLIC CAPITAL LETTER YI  }
    XKB_KEY_Ukrainian_YI_ = $06b7;
  { U+0408 CYRILLIC CAPITAL LETTER JE  }
    XKB_KEY_Cyrillic_JE_ = $06b8;
  { U+0409 CYRILLIC CAPITAL LETTER LJE  }
    XKB_KEY_Cyrillic_LJE_ = $06b9;
  { U+040A CYRILLIC CAPITAL LETTER NJE  }
    XKB_KEY_Cyrillic_NJE_ = $06ba;
  { U+040B CYRILLIC CAPITAL LETTER TSHE  }
    XKB_KEY_Serbian_TSHE_ = $06bb;
  { U+040C CYRILLIC CAPITAL LETTER KJE  }
    XKB_KEY_Macedonia_KJE_ = $06bc;
  { U+0490 CYRILLIC CAPITAL LETTER GHE WITH UPTURN  }
    XKB_KEY_Ukrainian_GHE_WITH_UPTURN_ = $06bd;
  { U+040E CYRILLIC CAPITAL LETTER SHORT U  }
    XKB_KEY_Byelorussian_SHORTU_ = $06be;
  { U+040F CYRILLIC CAPITAL LETTER DZHE  }
    XKB_KEY_Cyrillic_DZHE_ = $06bf;
  { U+044E CYRILLIC SMALL LETTER YU  }
    XKB_KEY_Cyrillic_yu = $06c0;
  { U+0430 CYRILLIC SMALL LETTER A  }
    XKB_KEY_Cyrillic_a = $06c1;
  { U+0431 CYRILLIC SMALL LETTER BE  }
    XKB_KEY_Cyrillic_be = $06c2;
  { U+0446 CYRILLIC SMALL LETTER TSE  }
    XKB_KEY_Cyrillic_tse = $06c3;
  { U+0434 CYRILLIC SMALL LETTER DE  }
    XKB_KEY_Cyrillic_de = $06c4;
  { U+0435 CYRILLIC SMALL LETTER IE  }
    XKB_KEY_Cyrillic_ie = $06c5;
  { U+0444 CYRILLIC SMALL LETTER EF  }
    XKB_KEY_Cyrillic_ef = $06c6;
  { U+0433 CYRILLIC SMALL LETTER GHE  }
    XKB_KEY_Cyrillic_ghe = $06c7;
  { U+0445 CYRILLIC SMALL LETTER HA  }
    XKB_KEY_Cyrillic_ha = $06c8;
  { U+0438 CYRILLIC SMALL LETTER I  }
    XKB_KEY_Cyrillic_i = $06c9;
  { U+0439 CYRILLIC SMALL LETTER SHORT I  }
    XKB_KEY_Cyrillic_shorti = $06ca;
  { U+043A CYRILLIC SMALL LETTER KA  }
    XKB_KEY_Cyrillic_ka = $06cb;
  { U+043B CYRILLIC SMALL LETTER EL  }
    XKB_KEY_Cyrillic_el = $06cc;
  { U+043C CYRILLIC SMALL LETTER EM  }
    XKB_KEY_Cyrillic_em = $06cd;
  { U+043D CYRILLIC SMALL LETTER EN  }
    XKB_KEY_Cyrillic_en = $06ce;
  { U+043E CYRILLIC SMALL LETTER O  }
    XKB_KEY_Cyrillic_o = $06cf;
  { U+043F CYRILLIC SMALL LETTER PE  }
    XKB_KEY_Cyrillic_pe = $06d0;
  { U+044F CYRILLIC SMALL LETTER YA  }
    XKB_KEY_Cyrillic_ya = $06d1;
  { U+0440 CYRILLIC SMALL LETTER ER  }
    XKB_KEY_Cyrillic_er = $06d2;
  { U+0441 CYRILLIC SMALL LETTER ES  }
    XKB_KEY_Cyrillic_es = $06d3;
  { U+0442 CYRILLIC SMALL LETTER TE  }
    XKB_KEY_Cyrillic_te = $06d4;
  { U+0443 CYRILLIC SMALL LETTER U  }
    XKB_KEY_Cyrillic_u = $06d5;
  { U+0436 CYRILLIC SMALL LETTER ZHE  }
    XKB_KEY_Cyrillic_zhe = $06d6;
  { U+0432 CYRILLIC SMALL LETTER VE  }
    XKB_KEY_Cyrillic_ve = $06d7;
  { U+044C CYRILLIC SMALL LETTER SOFT SIGN  }
    XKB_KEY_Cyrillic_softsign = $06d8;
  { U+044B CYRILLIC SMALL LETTER YERU  }
    XKB_KEY_Cyrillic_yeru = $06d9;
  { U+0437 CYRILLIC SMALL LETTER ZE  }
    XKB_KEY_Cyrillic_ze = $06da;
  { U+0448 CYRILLIC SMALL LETTER SHA  }
    XKB_KEY_Cyrillic_sha = $06db;
  { U+044D CYRILLIC SMALL LETTER E  }
    XKB_KEY_Cyrillic_e = $06dc;
  { U+0449 CYRILLIC SMALL LETTER SHCHA  }
    XKB_KEY_Cyrillic_shcha = $06dd;
  { U+0447 CYRILLIC SMALL LETTER CHE  }
    XKB_KEY_Cyrillic_che = $06de;
  { U+044A CYRILLIC SMALL LETTER HARD SIGN  }
    XKB_KEY_Cyrillic_hardsign = $06df;
  { U+042E CYRILLIC CAPITAL LETTER YU  }
    XKB_KEY_Cyrillic_YU_ = $06e0;
  { U+0410 CYRILLIC CAPITAL LETTER A  }
    XKB_KEY_Cyrillic_A_ = $06e1;
  { U+0411 CYRILLIC CAPITAL LETTER BE  }
    XKB_KEY_Cyrillic_BE_ = $06e2;
  { U+0426 CYRILLIC CAPITAL LETTER TSE  }
    XKB_KEY_Cyrillic_TSE_ = $06e3;
  { U+0414 CYRILLIC CAPITAL LETTER DE  }
    XKB_KEY_Cyrillic_DE_ = $06e4;
  { U+0415 CYRILLIC CAPITAL LETTER IE  }
    XKB_KEY_Cyrillic_IE_ = $06e5;
  { U+0424 CYRILLIC CAPITAL LETTER EF  }
    XKB_KEY_Cyrillic_EF_ = $06e6;
  { U+0413 CYRILLIC CAPITAL LETTER GHE  }
    XKB_KEY_Cyrillic_GHE_ = $06e7;
  { U+0425 CYRILLIC CAPITAL LETTER HA  }
    XKB_KEY_Cyrillic_HA_ = $06e8;
  { U+0418 CYRILLIC CAPITAL LETTER I  }
    XKB_KEY_Cyrillic_I_ = $06e9;
  { U+0419 CYRILLIC CAPITAL LETTER SHORT I  }
    XKB_KEY_Cyrillic_SHORTI_ = $06ea;
  { U+041A CYRILLIC CAPITAL LETTER KA  }
    XKB_KEY_Cyrillic_KA_ = $06eb;
  { U+041B CYRILLIC CAPITAL LETTER EL  }
    XKB_KEY_Cyrillic_EL_ = $06ec;
  { U+041C CYRILLIC CAPITAL LETTER EM  }
    XKB_KEY_Cyrillic_EM_ = $06ed;
  { U+041D CYRILLIC CAPITAL LETTER EN  }
    XKB_KEY_Cyrillic_EN_ = $06ee;
  { U+041E CYRILLIC CAPITAL LETTER O  }
    XKB_KEY_Cyrillic_O_ = $06ef;
  { U+041F CYRILLIC CAPITAL LETTER PE  }
    XKB_KEY_Cyrillic_PE_ = $06f0;
  { U+042F CYRILLIC CAPITAL LETTER YA  }
    XKB_KEY_Cyrillic_YA_ = $06f1;
  { U+0420 CYRILLIC CAPITAL LETTER ER  }
    XKB_KEY_Cyrillic_ER_ = $06f2;
  { U+0421 CYRILLIC CAPITAL LETTER ES  }
    XKB_KEY_Cyrillic_ES_ = $06f3;
  { U+0422 CYRILLIC CAPITAL LETTER TE  }
    XKB_KEY_Cyrillic_TE_ = $06f4;
  { U+0423 CYRILLIC CAPITAL LETTER U  }
    XKB_KEY_Cyrillic_U_ = $06f5;
  { U+0416 CYRILLIC CAPITAL LETTER ZHE  }
    XKB_KEY_Cyrillic_ZHE_ = $06f6;
  { U+0412 CYRILLIC CAPITAL LETTER VE  }
    XKB_KEY_Cyrillic_VE_ = $06f7;
  { U+042C CYRILLIC CAPITAL LETTER SOFT SIGN  }
    XKB_KEY_Cyrillic_SOFTSIGN_ = $06f8;
  { U+042B CYRILLIC CAPITAL LETTER YERU  }
    XKB_KEY_Cyrillic_YERU_ = $06f9;
  { U+0417 CYRILLIC CAPITAL LETTER ZE  }
    XKB_KEY_Cyrillic_ZE_ = $06fa;
  { U+0428 CYRILLIC CAPITAL LETTER SHA  }
    XKB_KEY_Cyrillic_SHA_ = $06fb;
  { U+042D CYRILLIC CAPITAL LETTER E  }
    XKB_KEY_Cyrillic_E_ = $06fc;
  { U+0429 CYRILLIC CAPITAL LETTER SHCHA  }
    XKB_KEY_Cyrillic_SHCHA_ = $06fd;
  { U+0427 CYRILLIC CAPITAL LETTER CHE  }
    XKB_KEY_Cyrillic_CHE_ = $06fe;
  { U+042A CYRILLIC CAPITAL LETTER HARD SIGN  }
    XKB_KEY_Cyrillic_HARDSIGN_ = $06ff;
  {
   * Greek
   * (based on an early draft of, and not quite identical to, ISO/IEC 8859-7)
   * Byte 3 = 7
    }
  { U+0386 GREEK CAPITAL LETTER ALPHA WITH TONOS  }
    XKB_KEY_Greek_ALPHAaccent = $07a1;
  { U+0388 GREEK CAPITAL LETTER EPSILON WITH TONOS  }
    XKB_KEY_Greek_EPSILONaccent = $07a2;
  { U+0389 GREEK CAPITAL LETTER ETA WITH TONOS  }
    XKB_KEY_Greek_ETAaccent = $07a3;
  { U+038A GREEK CAPITAL LETTER IOTA WITH TONOS  }
    XKB_KEY_Greek_IOTAaccent = $07a4;
  { U+03AA GREEK CAPITAL LETTER IOTA WITH DIALYTIKA  }
    XKB_KEY_Greek_IOTAdieresis = $07a5;
  { old typo  }
    XKB_KEY_Greek_IOTAdiaeresis = $07a5;
  { U+038C GREEK CAPITAL LETTER OMICRON WITH TONOS  }
    XKB_KEY_Greek_OMICRONaccent = $07a7;
  { U+038E GREEK CAPITAL LETTER UPSILON WITH TONOS  }
    XKB_KEY_Greek_UPSILONaccent = $07a8;
  { U+03AB GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA  }
    XKB_KEY_Greek_UPSILONdieresis = $07a9;
  { U+038F GREEK CAPITAL LETTER OMEGA WITH TONOS  }
    XKB_KEY_Greek_OMEGAaccent = $07ab;
  { U+0385 GREEK DIALYTIKA TONOS  }
    XKB_KEY_Greek_accentdieresis = $07ae;
  { U+2015 HORIZONTAL BAR  }
    XKB_KEY_Greek_horizbar = $07af;
  { U+03AC GREEK SMALL LETTER ALPHA WITH TONOS  }
    XKB_KEY_Greek_alphaaccent_ = $07b1;
  { U+03AD GREEK SMALL LETTER EPSILON WITH TONOS  }
    XKB_KEY_Greek_epsilonaccent_ = $07b2;
  { U+03AE GREEK SMALL LETTER ETA WITH TONOS  }
    XKB_KEY_Greek_etaaccent_ = $07b3;
  { U+03AF GREEK SMALL LETTER IOTA WITH TONOS  }
    XKB_KEY_Greek_iotaaccent_ = $07b4;
  { U+03CA GREEK SMALL LETTER IOTA WITH DIALYTIKA  }
    XKB_KEY_Greek_iotadieresis_ = $07b5;
  { U+0390 GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS  }
    XKB_KEY_Greek_iotaaccentdieresis_ = $07b6;
  { U+03CC GREEK SMALL LETTER OMICRON WITH TONOS  }
    XKB_KEY_Greek_omicronaccent_ = $07b7;
  { U+03CD GREEK SMALL LETTER UPSILON WITH TONOS  }
    XKB_KEY_Greek_upsilonaccent_ = $07b8;
  { U+03CB GREEK SMALL LETTER UPSILON WITH DIALYTIKA  }
    XKB_KEY_Greek_upsilondieresis_ = $07b9;
  { U+03B0 GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS  }
    XKB_KEY_Greek_upsilonaccentdieresis_ = $07ba;
  { U+03CE GREEK SMALL LETTER OMEGA WITH TONOS  }
    XKB_KEY_Greek_omegaaccent_ = $07bb;
  { U+0391 GREEK CAPITAL LETTER ALPHA  }
    XKB_KEY_Greek_ALPHA = $07c1;
  { U+0392 GREEK CAPITAL LETTER BETA  }
    XKB_KEY_Greek_BETA = $07c2;
  { U+0393 GREEK CAPITAL LETTER GAMMA  }
    XKB_KEY_Greek_GAMMA = $07c3;
  { U+0394 GREEK CAPITAL LETTER DELTA  }
    XKB_KEY_Greek_DELTA = $07c4;
  { U+0395 GREEK CAPITAL LETTER EPSILON  }
    XKB_KEY_Greek_EPSILON = $07c5;
  { U+0396 GREEK CAPITAL LETTER ZETA  }
    XKB_KEY_Greek_ZETA = $07c6;
  { U+0397 GREEK CAPITAL LETTER ETA  }
    XKB_KEY_Greek_ETA = $07c7;
  { U+0398 GREEK CAPITAL LETTER THETA  }
    XKB_KEY_Greek_THETA = $07c8;
  { U+0399 GREEK CAPITAL LETTER IOTA  }
    XKB_KEY_Greek_IOTA = $07c9;
  { U+039A GREEK CAPITAL LETTER KAPPA  }
    XKB_KEY_Greek_KAPPA = $07ca;
  { U+039B GREEK CAPITAL LETTER LAMDA  }
    XKB_KEY_Greek_LAMDA = $07cb;
  { U+039B GREEK CAPITAL LETTER LAMDA  }
    XKB_KEY_Greek_LAMBDA = $07cb;
  { U+039C GREEK CAPITAL LETTER MU  }
    XKB_KEY_Greek_MU = $07cc;
  { U+039D GREEK CAPITAL LETTER NU  }
    XKB_KEY_Greek_NU = $07cd;
  { U+039E GREEK CAPITAL LETTER XI  }
    XKB_KEY_Greek_XI = $07ce;
  { U+039F GREEK CAPITAL LETTER OMICRON  }
    XKB_KEY_Greek_OMICRON = $07cf;
  { U+03A0 GREEK CAPITAL LETTER PI  }
    XKB_KEY_Greek_PI = $07d0;
  { U+03A1 GREEK CAPITAL LETTER RHO  }
    XKB_KEY_Greek_RHO = $07d1;
  { U+03A3 GREEK CAPITAL LETTER SIGMA  }
    XKB_KEY_Greek_SIGMA = $07d2;
  { U+03A4 GREEK CAPITAL LETTER TAU  }
    XKB_KEY_Greek_TAU = $07d4;
  { U+03A5 GREEK CAPITAL LETTER UPSILON  }
    XKB_KEY_Greek_UPSILON = $07d5;
  { U+03A6 GREEK CAPITAL LETTER PHI  }
    XKB_KEY_Greek_PHI = $07d6;
  { U+03A7 GREEK CAPITAL LETTER CHI  }
    XKB_KEY_Greek_CHI = $07d7;
  { U+03A8 GREEK CAPITAL LETTER PSI  }
    XKB_KEY_Greek_PSI = $07d8;
  { U+03A9 GREEK CAPITAL LETTER OMEGA  }
    XKB_KEY_Greek_OMEGA = $07d9;
  { U+03B1 GREEK SMALL LETTER ALPHA  }
    XKB_KEY_Greek_alpha_ = $07e1;
  { U+03B2 GREEK SMALL LETTER BETA  }
    XKB_KEY_Greek_beta_ = $07e2;
  { U+03B3 GREEK SMALL LETTER GAMMA  }
    XKB_KEY_Greek_gamma_ = $07e3;
  { U+03B4 GREEK SMALL LETTER DELTA  }
    XKB_KEY_Greek_delta_ = $07e4;
  { U+03B5 GREEK SMALL LETTER EPSILON  }
    XKB_KEY_Greek_epsilon_ = $07e5;
  { U+03B6 GREEK SMALL LETTER ZETA  }
    XKB_KEY_Greek_zeta_ = $07e6;
  { U+03B7 GREEK SMALL LETTER ETA  }
    XKB_KEY_Greek_eta_ = $07e7;
  { U+03B8 GREEK SMALL LETTER THETA  }
    XKB_KEY_Greek_theta_ = $07e8;
  { U+03B9 GREEK SMALL LETTER IOTA  }
    XKB_KEY_Greek_iota_ = $07e9;
  { U+03BA GREEK SMALL LETTER KAPPA  }
    XKB_KEY_Greek_kappa_ = $07ea;
  { U+03BB GREEK SMALL LETTER LAMDA  }
    XKB_KEY_Greek_lamda_ = $07eb;
  { U+03BB GREEK SMALL LETTER LAMDA  }
    XKB_KEY_Greek_lambda_ = $07eb;
  { U+03BC GREEK SMALL LETTER MU  }
    XKB_KEY_Greek_mu_ = $07ec;
  { U+03BD GREEK SMALL LETTER NU  }
    XKB_KEY_Greek_nu_ = $07ed;
  { U+03BE GREEK SMALL LETTER XI  }
    XKB_KEY_Greek_xi_ = $07ee;
  { U+03BF GREEK SMALL LETTER OMICRON  }
    XKB_KEY_Greek_omicron_ = $07ef;
  { U+03C0 GREEK SMALL LETTER PI  }
    XKB_KEY_Greek_pi_ = $07f0;
  { U+03C1 GREEK SMALL LETTER RHO  }
    XKB_KEY_Greek_rho_ = $07f1;
  { U+03C3 GREEK SMALL LETTER SIGMA  }
    XKB_KEY_Greek_sigma_ = $07f2;
  { U+03C2 GREEK SMALL LETTER FINAL SIGMA  }
    XKB_KEY_Greek_finalsmallsigma_ = $07f3;
  { U+03C4 GREEK SMALL LETTER TAU  }
    XKB_KEY_Greek_tau_ = $07f4;
  { U+03C5 GREEK SMALL LETTER UPSILON  }
    XKB_KEY_Greek_upsilon_ = $07f5;
  { U+03C6 GREEK SMALL LETTER PHI  }
    XKB_KEY_Greek_phi_ = $07f6;
  { U+03C7 GREEK SMALL LETTER CHI  }
    XKB_KEY_Greek_chi_ = $07f7;
  { U+03C8 GREEK SMALL LETTER PSI  }
    XKB_KEY_Greek_psi_ = $07f8;
  { U+03C9 GREEK SMALL LETTER OMEGA  }
    XKB_KEY_Greek_omega_ = $07f9;
  { Alias for mode_switch  }
    XKB_KEY_Greek_switch_ = $ff7e;
  {
   * Technical
   * (from the DEC VT330/VT420 Technical Character Set, http://vt100.net/charsets/technical.html)
   * Byte 3 = 8
    }
  { U+23B7 RADICAL SYMBOL BOTTOM  }
    XKB_KEY_leftradical = $08a1;
  {(U+250C BOX DRAWINGS LIGHT DOWN AND RIGHT) }
    XKB_KEY_topleftradical = $08a2;
  {(U+2500 BOX DRAWINGS LIGHT HORIZONTAL) }
    XKB_KEY_horizconnector = $08a3;
  { U+2320 TOP HALF INTEGRAL  }
    XKB_KEY_topintegral = $08a4;
  { U+2321 BOTTOM HALF INTEGRAL  }
    XKB_KEY_botintegral = $08a5;
  {(U+2502 BOX DRAWINGS LIGHT VERTICAL) }
    XKB_KEY_vertconnector = $08a6;
  { U+23A1 LEFT SQUARE BRACKET UPPER CORNER  }
    XKB_KEY_topleftsqbracket = $08a7;
  { U+23A3 LEFT SQUARE BRACKET LOWER CORNER  }
    XKB_KEY_botleftsqbracket = $08a8;
  { U+23A4 RIGHT SQUARE BRACKET UPPER CORNER  }
    XKB_KEY_toprightsqbracket = $08a9;
  { U+23A6 RIGHT SQUARE BRACKET LOWER CORNER  }
    XKB_KEY_botrightsqbracket = $08aa;
  { U+239B LEFT PARENTHESIS UPPER HOOK  }
    XKB_KEY_topleftparens = $08ab;
  { U+239D LEFT PARENTHESIS LOWER HOOK  }
    XKB_KEY_botleftparens = $08ac;
  { U+239E RIGHT PARENTHESIS UPPER HOOK  }
    XKB_KEY_toprightparens = $08ad;
  { U+23A0 RIGHT PARENTHESIS LOWER HOOK  }
    XKB_KEY_botrightparens = $08ae;
  { U+23A8 LEFT CURLY BRACKET MIDDLE PIECE  }
    XKB_KEY_leftmiddlecurlybrace = $08af;
  { U+23AC RIGHT CURLY BRACKET MIDDLE PIECE  }
    XKB_KEY_rightmiddlecurlybrace = $08b0;
    XKB_KEY_topleftsummation = $08b1;
    XKB_KEY_botleftsummation = $08b2;
    XKB_KEY_topvertsummationconnector = $08b3;
    XKB_KEY_botvertsummationconnector = $08b4;
    XKB_KEY_toprightsummation = $08b5;
    XKB_KEY_botrightsummation = $08b6;
    XKB_KEY_rightmiddlesummation = $08b7;
  { U+2264 LESS-THAN OR EQUAL TO  }
    XKB_KEY_lessthanequal = $08bc;
  { U+2260 NOT EQUAL TO  }
    XKB_KEY_notequal = $08bd;
  { U+2265 GREATER-THAN OR EQUAL TO  }
    XKB_KEY_greaterthanequal = $08be;
  { U+222B INTEGRAL  }
    XKB_KEY_integral = $08bf;
  { U+2234 THEREFORE  }
    XKB_KEY_therefore = $08c0;
  { U+221D PROPORTIONAL TO  }
    XKB_KEY_variation = $08c1;
  { U+221E INFINITY  }
    XKB_KEY_infinity = $08c2;
  { U+2207 NABLA  }
    XKB_KEY_nabla = $08c5;
  { U+223C TILDE OPERATOR  }
    XKB_KEY_approximate = $08c8;
  { U+2243 ASYMPTOTICALLY EQUAL TO  }
    XKB_KEY_similarequal = $08c9;
  { U+21D4 LEFT RIGHT DOUBLE ARROW  }
    XKB_KEY_ifonlyif = $08cd;
  { U+21D2 RIGHTWARDS DOUBLE ARROW  }
    XKB_KEY_implies = $08ce;
  { U+2261 IDENTICAL TO  }
    XKB_KEY_identical = $08cf;
  { U+221A SQUARE ROOT  }
    XKB_KEY_radical = $08d6;
  { U+2282 SUBSET OF  }
    XKB_KEY_includedin = $08da;
  { U+2283 SUPERSET OF  }
    XKB_KEY_includes = $08db;
  { U+2229 INTERSECTION  }
    XKB_KEY_intersection = $08dc;
  { U+222A UNION  }
    XKB_KEY_union = $08dd;
  { U+2227 LOGICAL AND  }
    XKB_KEY_logicaland = $08de;
  { U+2228 LOGICAL OR  }
    XKB_KEY_logicalor = $08df;
  { U+2202 PARTIAL DIFFERENTIAL  }
    XKB_KEY_partialderivative = $08ef;
  { U+0192 LATIN SMALL LETTER F WITH HOOK  }
    XKB_KEY_function = $08f6;
  { U+2190 LEFTWARDS ARROW  }
    XKB_KEY_leftarrow = $08fb;
  { U+2191 UPWARDS ARROW  }
    XKB_KEY_uparrow = $08fc;
  { U+2192 RIGHTWARDS ARROW  }
    XKB_KEY_rightarrow = $08fd;
  { U+2193 DOWNWARDS ARROW  }
    XKB_KEY_downarrow = $08fe;
  {
   * Special
   * (from the DEC VT100 Special Graphics Character Set)
   * Byte 3 = 9
    }
    XKB_KEY_blank = $09df;
  { U+25C6 BLACK DIAMOND  }
    XKB_KEY_soliddiamond = $09e0;
  { U+2592 MEDIUM SHADE  }
    XKB_KEY_checkerboard = $09e1;
  { U+2409 SYMBOL FOR HORIZONTAL TABULATION  }
    XKB_KEY_ht = $09e2;
  { U+240C SYMBOL FOR FORM FEED  }
    XKB_KEY_ff = $09e3;
  { U+240D SYMBOL FOR CARRIAGE RETURN  }
    XKB_KEY_cr = $09e4;
  { U+240A SYMBOL FOR LINE FEED  }
    XKB_KEY_lf = $09e5;
  { U+2424 SYMBOL FOR NEWLINE  }
    XKB_KEY_nl = $09e8;
  { U+240B SYMBOL FOR VERTICAL TABULATION  }
    XKB_KEY_vt = $09e9;
  { U+2518 BOX DRAWINGS LIGHT UP AND LEFT  }
    XKB_KEY_lowrightcorner = $09ea;
  { U+2510 BOX DRAWINGS LIGHT DOWN AND LEFT  }
    XKB_KEY_uprightcorner = $09eb;
  { U+250C BOX DRAWINGS LIGHT DOWN AND RIGHT  }
    XKB_KEY_upleftcorner = $09ec;
  { U+2514 BOX DRAWINGS LIGHT UP AND RIGHT  }
    XKB_KEY_lowleftcorner = $09ed;
  { U+253C BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL  }
    XKB_KEY_crossinglines = $09ee;
  { U+23BA HORIZONTAL SCAN LINE-1  }
    XKB_KEY_horizlinescan1 = $09ef;
  { U+23BB HORIZONTAL SCAN LINE-3  }
    XKB_KEY_horizlinescan3 = $09f0;
  { U+2500 BOX DRAWINGS LIGHT HORIZONTAL  }
    XKB_KEY_horizlinescan5 = $09f1;
  { U+23BC HORIZONTAL SCAN LINE-7  }
    XKB_KEY_horizlinescan7 = $09f2;
  { U+23BD HORIZONTAL SCAN LINE-9  }
    XKB_KEY_horizlinescan9 = $09f3;
  { U+251C BOX DRAWINGS LIGHT VERTICAL AND RIGHT  }
    XKB_KEY_leftt = $09f4;
  { U+2524 BOX DRAWINGS LIGHT VERTICAL AND LEFT  }
    XKB_KEY_rightt = $09f5;
  { U+2534 BOX DRAWINGS LIGHT UP AND HORIZONTAL  }
    XKB_KEY_bott = $09f6;
  { U+252C BOX DRAWINGS LIGHT DOWN AND HORIZONTAL  }
    XKB_KEY_topt = $09f7;
  { U+2502 BOX DRAWINGS LIGHT VERTICAL  }
    XKB_KEY_vertbar = $09f8;
  {
   * Publishing
   * (these are probably from a long forgotten DEC Publishing
   * font that once shipped with DECwrite)
   * Byte 3 = 0x0a
    }
  { U+2003 EM SPACE  }
    XKB_KEY_emspace = $0aa1;
  { U+2002 EN SPACE  }
    XKB_KEY_enspace = $0aa2;
  { U+2004 THREE-PER-EM SPACE  }
    XKB_KEY_em3space = $0aa3;
  { U+2005 FOUR-PER-EM SPACE  }
    XKB_KEY_em4space = $0aa4;
  { U+2007 FIGURE SPACE  }
    XKB_KEY_digitspace = $0aa5;
  { U+2008 PUNCTUATION SPACE  }
    XKB_KEY_punctspace = $0aa6;
  { U+2009 THIN SPACE  }
    XKB_KEY_thinspace = $0aa7;
  { U+200A HAIR SPACE  }
    XKB_KEY_hairspace = $0aa8;
  { U+2014 EM DASH  }
    XKB_KEY_emdash = $0aa9;
  { U+2013 EN DASH  }
    XKB_KEY_endash = $0aaa;
  {(U+2423 OPEN BOX) }
    XKB_KEY_signifblank = $0aac;
  { U+2026 HORIZONTAL ELLIPSIS  }
    XKB_KEY_ellipsis = $0aae;
  { U+2025 TWO DOT LEADER  }
    XKB_KEY_doubbaselinedot = $0aaf;
  { U+2153 VULGAR FRACTION ONE THIRD  }
    XKB_KEY_onethird = $0ab0;
  { U+2154 VULGAR FRACTION TWO THIRDS  }
    XKB_KEY_twothirds = $0ab1;
  { U+2155 VULGAR FRACTION ONE FIFTH  }
    XKB_KEY_onefifth = $0ab2;
  { U+2156 VULGAR FRACTION TWO FIFTHS  }
    XKB_KEY_twofifths = $0ab3;
  { U+2157 VULGAR FRACTION THREE FIFTHS  }
    XKB_KEY_threefifths = $0ab4;
  { U+2158 VULGAR FRACTION FOUR FIFTHS  }
    XKB_KEY_fourfifths = $0ab5;
  { U+2159 VULGAR FRACTION ONE SIXTH  }
    XKB_KEY_onesixth = $0ab6;
  { U+215A VULGAR FRACTION FIVE SIXTHS  }
    XKB_KEY_fivesixths = $0ab7;
  { U+2105 CARE OF  }
    XKB_KEY_careof = $0ab8;
  { U+2012 FIGURE DASH  }
    XKB_KEY_figdash = $0abb;
  {(U+27E8 MATHEMATICAL LEFT ANGLE BRACKET) }
    XKB_KEY_leftanglebracket = $0abc;
  {(U+002E FULL STOP) }
    XKB_KEY_decimalpoint = $0abd;
  {(U+27E9 MATHEMATICAL RIGHT ANGLE BRACKET) }
    XKB_KEY_rightanglebracket = $0abe;
    XKB_KEY_marker = $0abf;
  { U+215B VULGAR FRACTION ONE EIGHTH  }
    XKB_KEY_oneeighth = $0ac3;
  { U+215C VULGAR FRACTION THREE EIGHTHS  }
    XKB_KEY_threeeighths = $0ac4;
  { U+215D VULGAR FRACTION FIVE EIGHTHS  }
    XKB_KEY_fiveeighths = $0ac5;
  { U+215E VULGAR FRACTION SEVEN EIGHTHS  }
    XKB_KEY_seveneighths = $0ac6;
  { U+2122 TRADE MARK SIGN  }
    XKB_KEY_trademark = $0ac9;
  {(U+2613 SALTIRE) }
    XKB_KEY_signaturemark = $0aca;
    XKB_KEY_trademarkincircle = $0acb;
  {(U+25C1 WHITE LEFT-POINTING TRIANGLE) }
    XKB_KEY_leftopentriangle = $0acc;
  {(U+25B7 WHITE RIGHT-POINTING TRIANGLE) }
    XKB_KEY_rightopentriangle = $0acd;
  {(U+25CB WHITE CIRCLE) }
    XKB_KEY_emopencircle = $0ace;
  {(U+25AF WHITE VERTICAL RECTANGLE) }
    XKB_KEY_emopenrectangle = $0acf;
  { U+2018 LEFT SINGLE QUOTATION MARK  }
    XKB_KEY_leftsinglequotemark = $0ad0;
  { U+2019 RIGHT SINGLE QUOTATION MARK  }
    XKB_KEY_rightsinglequotemark = $0ad1;
  { U+201C LEFT DOUBLE QUOTATION MARK  }
    XKB_KEY_leftdoublequotemark = $0ad2;
  { U+201D RIGHT DOUBLE QUOTATION MARK  }
    XKB_KEY_rightdoublequotemark = $0ad3;
  { U+211E PRESCRIPTION TAKE  }
    XKB_KEY_prescription = $0ad4;
  { U+2030 PER MILLE SIGN  }
    XKB_KEY_permille = $0ad5;
  { U+2032 PRIME  }
    XKB_KEY_minutes = $0ad6;
  { U+2033 DOUBLE PRIME  }
    XKB_KEY_seconds = $0ad7;
  { U+271D LATIN CROSS  }
    XKB_KEY_latincross = $0ad9;
    XKB_KEY_hexagram = $0ada;
  {(U+25AC BLACK RECTANGLE) }
    XKB_KEY_filledrectbullet = $0adb;
  {(U+25C0 BLACK LEFT-POINTING TRIANGLE) }
    XKB_KEY_filledlefttribullet = $0adc;
  {(U+25B6 BLACK RIGHT-POINTING TRIANGLE) }
    XKB_KEY_filledrighttribullet = $0add;
  {(U+25CF BLACK CIRCLE) }
    XKB_KEY_emfilledcircle = $0ade;
  {(U+25AE BLACK VERTICAL RECTANGLE) }
    XKB_KEY_emfilledrect = $0adf;
  {(U+25E6 WHITE BULLET) }
    XKB_KEY_enopencircbullet = $0ae0;
  {(U+25AB WHITE SMALL SQUARE) }
    XKB_KEY_enopensquarebullet = $0ae1;
  {(U+25AD WHITE RECTANGLE) }
    XKB_KEY_openrectbullet = $0ae2;
  {(U+25B3 WHITE UP-POINTING TRIANGLE) }
    XKB_KEY_opentribulletup = $0ae3;
  {(U+25BD WHITE DOWN-POINTING TRIANGLE) }
    XKB_KEY_opentribulletdown = $0ae4;
  {(U+2606 WHITE STAR) }
    XKB_KEY_openstar = $0ae5;
  {(U+2022 BULLET) }
    XKB_KEY_enfilledcircbullet = $0ae6;
  {(U+25AA BLACK SMALL SQUARE) }
    XKB_KEY_enfilledsqbullet = $0ae7;
  {(U+25B2 BLACK UP-POINTING TRIANGLE) }
    XKB_KEY_filledtribulletup = $0ae8;
  {(U+25BC BLACK DOWN-POINTING TRIANGLE) }
    XKB_KEY_filledtribulletdown = $0ae9;
  {(U+261C WHITE LEFT POINTING INDEX) }
    XKB_KEY_leftpointer = $0aea;
  {(U+261E WHITE RIGHT POINTING INDEX) }
    XKB_KEY_rightpointer = $0aeb;
  { U+2663 BLACK CLUB SUIT  }
    XKB_KEY_club = $0aec;
  { U+2666 BLACK DIAMOND SUIT  }
    XKB_KEY_diamond = $0aed;
  { U+2665 BLACK HEART SUIT  }
    XKB_KEY_heart = $0aee;
  { U+2720 MALTESE CROSS  }
    XKB_KEY_maltesecross = $0af0;
  { U+2020 DAGGER  }
    XKB_KEY_dagger = $0af1;
  { U+2021 DOUBLE DAGGER  }
    XKB_KEY_doubledagger = $0af2;
  { U+2713 CHECK MARK  }
    XKB_KEY_checkmark = $0af3;
  { U+2717 BALLOT X  }
    XKB_KEY_ballotcross = $0af4;
  { U+266F MUSIC SHARP SIGN  }
    XKB_KEY_musicalsharp = $0af5;
  { U+266D MUSIC FLAT SIGN  }
    XKB_KEY_musicalflat = $0af6;
  { U+2642 MALE SIGN  }
    XKB_KEY_malesymbol = $0af7;
  { U+2640 FEMALE SIGN  }
    XKB_KEY_femalesymbol = $0af8;
  { U+260E BLACK TELEPHONE  }
    XKB_KEY_telephone = $0af9;
  { U+2315 TELEPHONE RECORDER  }
    XKB_KEY_telephonerecorder = $0afa;
  { U+2117 SOUND RECORDING COPYRIGHT  }
    XKB_KEY_phonographcopyright = $0afb;
  { U+2038 CARET  }
    XKB_KEY_caret = $0afc;
  { U+201A SINGLE LOW-9 QUOTATION MARK  }
    XKB_KEY_singlelowquotemark = $0afd;
  { U+201E DOUBLE LOW-9 QUOTATION MARK  }
    XKB_KEY_doublelowquotemark = $0afe;
    XKB_KEY_cursor = $0aff;
  {
   * APL
   * Byte 3 = 0x0b
    }
  {(U+003C LESS-THAN SIGN) }
    XKB_KEY_leftcaret = $0ba3;
  {(U+003E GREATER-THAN SIGN) }
    XKB_KEY_rightcaret = $0ba6;
  {(U+2228 LOGICAL OR) }
    XKB_KEY_downcaret = $0ba8;
  {(U+2227 LOGICAL AND) }
    XKB_KEY_upcaret = $0ba9;
  {(U+00AF MACRON) }
    XKB_KEY_overbar = $0bc0;
  { U+22A4 DOWN TACK  }
    XKB_KEY_downtack = $0bc2;
  {(U+2229 INTERSECTION) }
    XKB_KEY_upshoe = $0bc3;
  { U+230A LEFT FLOOR  }
    XKB_KEY_downstile = $0bc4;
  {(U+005F LOW LINE) }
    XKB_KEY_underbar = $0bc6;
  { U+2218 RING OPERATOR  }
    XKB_KEY_jot = $0bca;
  { U+2395 APL FUNCTIONAL SYMBOL QUAD  }
    XKB_KEY_quad = $0bcc;
  { U+22A5 UP TACK  }
    XKB_KEY_uptack = $0bce;
  { U+25CB WHITE CIRCLE  }
    XKB_KEY_circle = $0bcf;
  { U+2308 LEFT CEILING  }
    XKB_KEY_upstile = $0bd3;
  {(U+222A UNION) }
    XKB_KEY_downshoe = $0bd6;
  {(U+2283 SUPERSET OF) }
    XKB_KEY_rightshoe = $0bd8;
  {(U+2282 SUBSET OF) }
    XKB_KEY_leftshoe = $0bda;
  { U+22A3 LEFT TACK  }
    XKB_KEY_lefttack = $0bdc;
  { U+22A2 RIGHT TACK  }
    XKB_KEY_righttack = $0bfc;
  {
   * Hebrew
   * Byte 3 = 0x0c
    }
  { U+2017 DOUBLE LOW LINE  }
    XKB_KEY_hebrew_doublelowline = $0cdf;
  { U+05D0 HEBREW LETTER ALEF  }
    XKB_KEY_hebrew_aleph = $0ce0;
  { U+05D1 HEBREW LETTER BET  }
    XKB_KEY_hebrew_bet = $0ce1;
  { U+05D2 HEBREW LETTER GIMEL  }
    XKB_KEY_hebrew_gimel = $0ce2;
  { U+05D3 HEBREW LETTER DALET  }
    XKB_KEY_hebrew_dalet = $0ce3;
  { U+05D4 HEBREW LETTER HE  }
    XKB_KEY_hebrew_he = $0ce4;
  { U+05D5 HEBREW LETTER VAV  }
    XKB_KEY_hebrew_waw = $0ce5;
  { U+05D6 HEBREW LETTER ZAYIN  }
    XKB_KEY_hebrew_zain = $0ce6;
  { U+05D7 HEBREW LETTER HET  }
    XKB_KEY_hebrew_chet = $0ce7;
  { U+05D8 HEBREW LETTER TET  }
    XKB_KEY_hebrew_tet = $0ce8;
  { U+05D9 HEBREW LETTER YOD  }
    XKB_KEY_hebrew_yod = $0ce9;
  { U+05DA HEBREW LETTER FINAL KAF  }
    XKB_KEY_hebrew_finalkaph = $0cea;
  { U+05DB HEBREW LETTER KAF  }
    XKB_KEY_hebrew_kaph = $0ceb;
  { U+05DC HEBREW LETTER LAMED  }
    XKB_KEY_hebrew_lamed = $0cec;
  { U+05DD HEBREW LETTER FINAL MEM  }
    XKB_KEY_hebrew_finalmem = $0ced;
  { U+05DE HEBREW LETTER MEM  }
    XKB_KEY_hebrew_mem = $0cee;
  { U+05DF HEBREW LETTER FINAL NUN  }
    XKB_KEY_hebrew_finalnun = $0cef;
  { U+05E0 HEBREW LETTER NUN  }
    XKB_KEY_hebrew_nun = $0cf0;
  { U+05E1 HEBREW LETTER SAMEKH  }
    XKB_KEY_hebrew_samech = $0cf1;
  { U+05E2 HEBREW LETTER AYIN  }
    XKB_KEY_hebrew_ayin = $0cf2;
  { U+05E3 HEBREW LETTER FINAL PE  }
    XKB_KEY_hebrew_finalpe = $0cf3;
  { U+05E4 HEBREW LETTER PE  }
    XKB_KEY_hebrew_pe = $0cf4;
  { U+05E5 HEBREW LETTER FINAL TSADI  }
    XKB_KEY_hebrew_finalzade = $0cf5;
  { U+05E6 HEBREW LETTER TSADI  }
    XKB_KEY_hebrew_zade = $0cf6;
  { U+05E7 HEBREW LETTER QOF  }
    XKB_KEY_hebrew_qoph = $0cf7;
  { U+05E8 HEBREW LETTER RESH  }
    XKB_KEY_hebrew_resh = $0cf8;
  { U+05E9 HEBREW LETTER SHIN  }
    XKB_KEY_hebrew_shin = $0cf9;
  { U+05EA HEBREW LETTER TAV  }
    XKB_KEY_hebrew_taw = $0cfa;
  { Alias for mode_switch  }
    XKB_KEY_Hebrew_switch = $ff7e;
  {
   * Thai
   * Byte 3 = 0x0d
    }
  { U+0E01 THAI CHARACTER KO KAI  }
    XKB_KEY_Thai_kokai = $0da1;
  { U+0E02 THAI CHARACTER KHO KHAI  }
    XKB_KEY_Thai_khokhai = $0da2;
  { U+0E03 THAI CHARACTER KHO KHUAT  }
    XKB_KEY_Thai_khokhuat = $0da3;
  { U+0E04 THAI CHARACTER KHO KHWAI  }
    XKB_KEY_Thai_khokhwai = $0da4;
  { U+0E05 THAI CHARACTER KHO KHON  }
    XKB_KEY_Thai_khokhon = $0da5;
  { U+0E06 THAI CHARACTER KHO RAKHANG  }
    XKB_KEY_Thai_khorakhang = $0da6;
  { U+0E07 THAI CHARACTER NGO NGU  }
    XKB_KEY_Thai_ngongu = $0da7;
  { U+0E08 THAI CHARACTER CHO CHAN  }
    XKB_KEY_Thai_chochan = $0da8;
  { U+0E09 THAI CHARACTER CHO CHING  }
    XKB_KEY_Thai_choching = $0da9;
  { U+0E0A THAI CHARACTER CHO CHANG  }
    XKB_KEY_Thai_chochang = $0daa;
  { U+0E0B THAI CHARACTER SO SO  }
    XKB_KEY_Thai_soso = $0dab;
  { U+0E0C THAI CHARACTER CHO CHOE  }
    XKB_KEY_Thai_chochoe = $0dac;
  { U+0E0D THAI CHARACTER YO YING  }
    XKB_KEY_Thai_yoying = $0dad;
  { U+0E0E THAI CHARACTER DO CHADA  }
    XKB_KEY_Thai_dochada = $0dae;
  { U+0E0F THAI CHARACTER TO PATAK  }
    XKB_KEY_Thai_topatak = $0daf;
  { U+0E10 THAI CHARACTER THO THAN  }
    XKB_KEY_Thai_thothan = $0db0;
  { U+0E11 THAI CHARACTER THO NANGMONTHO  }
    XKB_KEY_Thai_thonangmontho = $0db1;
  { U+0E12 THAI CHARACTER THO PHUTHAO  }
    XKB_KEY_Thai_thophuthao = $0db2;
  { U+0E13 THAI CHARACTER NO NEN  }
    XKB_KEY_Thai_nonen = $0db3;
  { U+0E14 THAI CHARACTER DO DEK  }
    XKB_KEY_Thai_dodek = $0db4;
  { U+0E15 THAI CHARACTER TO TAO  }
    XKB_KEY_Thai_totao = $0db5;
  { U+0E16 THAI CHARACTER THO THUNG  }
    XKB_KEY_Thai_thothung = $0db6;
  { U+0E17 THAI CHARACTER THO THAHAN  }
    XKB_KEY_Thai_thothahan = $0db7;
  { U+0E18 THAI CHARACTER THO THONG  }
    XKB_KEY_Thai_thothong = $0db8;
  { U+0E19 THAI CHARACTER NO NU  }
    XKB_KEY_Thai_nonu = $0db9;
  { U+0E1A THAI CHARACTER BO BAIMAI  }
    XKB_KEY_Thai_bobaimai = $0dba;
  { U+0E1B THAI CHARACTER PO PLA  }
    XKB_KEY_Thai_popla = $0dbb;
  { U+0E1C THAI CHARACTER PHO PHUNG  }
    XKB_KEY_Thai_phophung = $0dbc;
  { U+0E1D THAI CHARACTER FO FA  }
    XKB_KEY_Thai_fofa = $0dbd;
  { U+0E1E THAI CHARACTER PHO PHAN  }
    XKB_KEY_Thai_phophan = $0dbe;
  { U+0E1F THAI CHARACTER FO FAN  }
    XKB_KEY_Thai_fofan = $0dbf;
  { U+0E20 THAI CHARACTER PHO SAMPHAO  }
    XKB_KEY_Thai_phosamphao = $0dc0;
  { U+0E21 THAI CHARACTER MO MA  }
    XKB_KEY_Thai_moma = $0dc1;
  { U+0E22 THAI CHARACTER YO YAK  }
    XKB_KEY_Thai_yoyak = $0dc2;
  { U+0E23 THAI CHARACTER RO RUA  }
    XKB_KEY_Thai_rorua = $0dc3;
  { U+0E24 THAI CHARACTER RU  }
    XKB_KEY_Thai_ru = $0dc4;
  { U+0E25 THAI CHARACTER LO LING  }
    XKB_KEY_Thai_loling = $0dc5;
  { U+0E26 THAI CHARACTER LU  }
    XKB_KEY_Thai_lu = $0dc6;
  { U+0E27 THAI CHARACTER WO WAEN  }
    XKB_KEY_Thai_wowaen = $0dc7;
  { U+0E28 THAI CHARACTER SO SALA  }
    XKB_KEY_Thai_sosala = $0dc8;
  { U+0E29 THAI CHARACTER SO RUSI  }
    XKB_KEY_Thai_sorusi = $0dc9;
  { U+0E2A THAI CHARACTER SO SUA  }
    XKB_KEY_Thai_sosua = $0dca;
  { U+0E2B THAI CHARACTER HO HIP  }
    XKB_KEY_Thai_hohip = $0dcb;
  { U+0E2C THAI CHARACTER LO CHULA  }
    XKB_KEY_Thai_lochula = $0dcc;
  { U+0E2D THAI CHARACTER O ANG  }
    XKB_KEY_Thai_oang = $0dcd;
  { U+0E2E THAI CHARACTER HO NOKHUK  }
    XKB_KEY_Thai_honokhuk = $0dce;
  { U+0E2F THAI CHARACTER PAIYANNOI  }
    XKB_KEY_Thai_paiyannoi = $0dcf;
  { U+0E30 THAI CHARACTER SARA A  }
    XKB_KEY_Thai_saraa = $0dd0;
  { U+0E31 THAI CHARACTER MAI HAN-AKAT  }
    XKB_KEY_Thai_maihanakat = $0dd1;
  { U+0E32 THAI CHARACTER SARA AA  }
    XKB_KEY_Thai_saraaa = $0dd2;
  { U+0E33 THAI CHARACTER SARA AM  }
    XKB_KEY_Thai_saraam = $0dd3;
  { U+0E34 THAI CHARACTER SARA I  }
    XKB_KEY_Thai_sarai = $0dd4;
  { U+0E35 THAI CHARACTER SARA II  }
    XKB_KEY_Thai_saraii = $0dd5;
  { U+0E36 THAI CHARACTER SARA UE  }
    XKB_KEY_Thai_saraue = $0dd6;
  { U+0E37 THAI CHARACTER SARA UEE  }
    XKB_KEY_Thai_sarauee = $0dd7;
  { U+0E38 THAI CHARACTER SARA U  }
    XKB_KEY_Thai_sarau = $0dd8;
  { U+0E39 THAI CHARACTER SARA UU  }
    XKB_KEY_Thai_sarauu = $0dd9;
  { U+0E3A THAI CHARACTER PHINTHU  }
    XKB_KEY_Thai_phinthu = $0dda;
    XKB_KEY_Thai_maihanakat_maitho = $0dde;
  { U+0E3F THAI CURRENCY SYMBOL BAHT  }
    XKB_KEY_Thai_baht = $0ddf;
  { U+0E40 THAI CHARACTER SARA E  }
    XKB_KEY_Thai_sarae = $0de0;
  { U+0E41 THAI CHARACTER SARA AE  }
    XKB_KEY_Thai_saraae = $0de1;
  { U+0E42 THAI CHARACTER SARA O  }
    XKB_KEY_Thai_sarao = $0de2;
  { U+0E43 THAI CHARACTER SARA AI MAIMUAN  }
    XKB_KEY_Thai_saraaimaimuan = $0de3;
  { U+0E44 THAI CHARACTER SARA AI MAIMALAI  }
    XKB_KEY_Thai_saraaimaimalai = $0de4;
  { U+0E45 THAI CHARACTER LAKKHANGYAO  }
    XKB_KEY_Thai_lakkhangyao = $0de5;
  { U+0E46 THAI CHARACTER MAIYAMOK  }
    XKB_KEY_Thai_maiyamok = $0de6;
  { U+0E47 THAI CHARACTER MAITAIKHU  }
    XKB_KEY_Thai_maitaikhu = $0de7;
  { U+0E48 THAI CHARACTER MAI EK  }
    XKB_KEY_Thai_maiek = $0de8;
  { U+0E49 THAI CHARACTER MAI THO  }
    XKB_KEY_Thai_maitho = $0de9;
  { U+0E4A THAI CHARACTER MAI TRI  }
    XKB_KEY_Thai_maitri = $0dea;
  { U+0E4B THAI CHARACTER MAI CHATTAWA  }
    XKB_KEY_Thai_maichattawa = $0deb;
  { U+0E4C THAI CHARACTER THANTHAKHAT  }
    XKB_KEY_Thai_thanthakhat = $0dec;
  { U+0E4D THAI CHARACTER NIKHAHIT  }
    XKB_KEY_Thai_nikhahit = $0ded;
  { U+0E50 THAI DIGIT ZERO  }
    XKB_KEY_Thai_leksun = $0df0;
  { U+0E51 THAI DIGIT ONE  }
    XKB_KEY_Thai_leknung = $0df1;
  { U+0E52 THAI DIGIT TWO  }
    XKB_KEY_Thai_leksong = $0df2;
  { U+0E53 THAI DIGIT THREE  }
    XKB_KEY_Thai_leksam = $0df3;
  { U+0E54 THAI DIGIT FOUR  }
    XKB_KEY_Thai_leksi = $0df4;
  { U+0E55 THAI DIGIT FIVE  }
    XKB_KEY_Thai_lekha = $0df5;
  { U+0E56 THAI DIGIT SIX  }
    XKB_KEY_Thai_lekhok = $0df6;
  { U+0E57 THAI DIGIT SEVEN  }
    XKB_KEY_Thai_lekchet = $0df7;
  { U+0E58 THAI DIGIT EIGHT  }
    XKB_KEY_Thai_lekpaet = $0df8;
  { U+0E59 THAI DIGIT NINE  }
    XKB_KEY_Thai_lekkao = $0df9;
  {
   * Korean
   * Byte 3 = 0x0e
    }
  { Hangul start/stop(toggle)  }
    XKB_KEY_Hangul = $ff31;
  { Hangul start  }
    XKB_KEY_Hangul_Start = $ff32;
  { Hangul end, English start  }
    XKB_KEY_Hangul_End = $ff33;
  { Start Hangul->Hanja Conversion  }
    XKB_KEY_Hangul_Hanja = $ff34;
  { Hangul Jamo mode  }
    XKB_KEY_Hangul_Jamo = $ff35;
  { Hangul Romaja mode  }
    XKB_KEY_Hangul_Romaja = $ff36;
  { Hangul code input mode  }
    XKB_KEY_Hangul_Codeinput = $ff37;
  { Jeonja mode  }
    XKB_KEY_Hangul_Jeonja = $ff38;
  { Banja mode  }
    XKB_KEY_Hangul_Banja = $ff39;
  { Pre Hanja conversion  }
    XKB_KEY_Hangul_PreHanja = $ff3a;
  { Post Hanja conversion  }
    XKB_KEY_Hangul_PostHanja = $ff3b;
  { Single candidate  }
    XKB_KEY_Hangul_SingleCandidate = $ff3c;
  { Multiple candidate  }
    XKB_KEY_Hangul_MultipleCandidate = $ff3d;
  { Previous candidate  }
    XKB_KEY_Hangul_PreviousCandidate = $ff3e;
  { Special symbols  }
    XKB_KEY_Hangul_Special = $ff3f;
  { Alias for mode_switch  }
    XKB_KEY_Hangul_switch = $ff7e;
  { Hangul Consonant Characters  }
    XKB_KEY_Hangul_Kiyeog = $0ea1;
    XKB_KEY_Hangul_SsangKiyeog = $0ea2;
    XKB_KEY_Hangul_KiyeogSios = $0ea3;
    XKB_KEY_Hangul_Nieun = $0ea4;
    XKB_KEY_Hangul_NieunJieuj = $0ea5;
    XKB_KEY_Hangul_NieunHieuh = $0ea6;
    XKB_KEY_Hangul_Dikeud = $0ea7;
    XKB_KEY_Hangul_SsangDikeud = $0ea8;
    XKB_KEY_Hangul_Rieul = $0ea9;
    XKB_KEY_Hangul_RieulKiyeog = $0eaa;
    XKB_KEY_Hangul_RieulMieum = $0eab;
    XKB_KEY_Hangul_RieulPieub = $0eac;
    XKB_KEY_Hangul_RieulSios = $0ead;
    XKB_KEY_Hangul_RieulTieut = $0eae;
    XKB_KEY_Hangul_RieulPhieuf = $0eaf;
    XKB_KEY_Hangul_RieulHieuh = $0eb0;
    XKB_KEY_Hangul_Mieum = $0eb1;
    XKB_KEY_Hangul_Pieub = $0eb2;
    XKB_KEY_Hangul_SsangPieub = $0eb3;
    XKB_KEY_Hangul_PieubSios = $0eb4;
    XKB_KEY_Hangul_Sios = $0eb5;
    XKB_KEY_Hangul_SsangSios = $0eb6;
    XKB_KEY_Hangul_Ieung = $0eb7;
    XKB_KEY_Hangul_Jieuj = $0eb8;
    XKB_KEY_Hangul_SsangJieuj = $0eb9;
    XKB_KEY_Hangul_Cieuc = $0eba;
    XKB_KEY_Hangul_Khieuq = $0ebb;
    XKB_KEY_Hangul_Tieut = $0ebc;
    XKB_KEY_Hangul_Phieuf = $0ebd;
    XKB_KEY_Hangul_Hieuh = $0ebe;
  { Hangul Vowel Characters  }
    XKB_KEY_Hangul_A = $0ebf;
    XKB_KEY_Hangul_AE = $0ec0;
    XKB_KEY_Hangul_YA = $0ec1;
    XKB_KEY_Hangul_YAE = $0ec2;
    XKB_KEY_Hangul_EO = $0ec3;
    XKB_KEY_Hangul_E = $0ec4;
    XKB_KEY_Hangul_YEO = $0ec5;
    XKB_KEY_Hangul_YE = $0ec6;
    XKB_KEY_Hangul_O = $0ec7;
    XKB_KEY_Hangul_WA = $0ec8;
    XKB_KEY_Hangul_WAE = $0ec9;
    XKB_KEY_Hangul_OE = $0eca;
    XKB_KEY_Hangul_YO = $0ecb;
    XKB_KEY_Hangul_U = $0ecc;
    XKB_KEY_Hangul_WEO = $0ecd;
    XKB_KEY_Hangul_WE = $0ece;
    XKB_KEY_Hangul_WI = $0ecf;
    XKB_KEY_Hangul_YU = $0ed0;
    XKB_KEY_Hangul_EU = $0ed1;
    XKB_KEY_Hangul_YI = $0ed2;
    XKB_KEY_Hangul_I = $0ed3;
  { Hangul syllable-final (JongSeong) Characters  }
    XKB_KEY_Hangul_J_Kiyeog = $0ed4;
    XKB_KEY_Hangul_J_SsangKiyeog = $0ed5;
    XKB_KEY_Hangul_J_KiyeogSios = $0ed6;
    XKB_KEY_Hangul_J_Nieun = $0ed7;
    XKB_KEY_Hangul_J_NieunJieuj = $0ed8;
    XKB_KEY_Hangul_J_NieunHieuh = $0ed9;
    XKB_KEY_Hangul_J_Dikeud = $0eda;
    XKB_KEY_Hangul_J_Rieul = $0edb;
    XKB_KEY_Hangul_J_RieulKiyeog = $0edc;
    XKB_KEY_Hangul_J_RieulMieum = $0edd;
    XKB_KEY_Hangul_J_RieulPieub = $0ede;
    XKB_KEY_Hangul_J_RieulSios = $0edf;
    XKB_KEY_Hangul_J_RieulTieut = $0ee0;
    XKB_KEY_Hangul_J_RieulPhieuf = $0ee1;
    XKB_KEY_Hangul_J_RieulHieuh = $0ee2;
    XKB_KEY_Hangul_J_Mieum = $0ee3;
    XKB_KEY_Hangul_J_Pieub = $0ee4;
    XKB_KEY_Hangul_J_PieubSios = $0ee5;
    XKB_KEY_Hangul_J_Sios = $0ee6;
    XKB_KEY_Hangul_J_SsangSios = $0ee7;
    XKB_KEY_Hangul_J_Ieung = $0ee8;
    XKB_KEY_Hangul_J_Jieuj = $0ee9;
    XKB_KEY_Hangul_J_Cieuc = $0eea;
    XKB_KEY_Hangul_J_Khieuq = $0eeb;
    XKB_KEY_Hangul_J_Tieut = $0eec;
    XKB_KEY_Hangul_J_Phieuf = $0eed;
    XKB_KEY_Hangul_J_Hieuh = $0eee;
  { Ancient Hangul Consonant Characters  }
    XKB_KEY_Hangul_RieulYeorinHieuh = $0eef;
    XKB_KEY_Hangul_SunkyeongeumMieum = $0ef0;
    XKB_KEY_Hangul_SunkyeongeumPieub = $0ef1;
    XKB_KEY_Hangul_PanSios = $0ef2;
    XKB_KEY_Hangul_KkogjiDalrinIeung = $0ef3;
    XKB_KEY_Hangul_SunkyeongeumPhieuf = $0ef4;
    XKB_KEY_Hangul_YeorinHieuh = $0ef5;
  { Ancient Hangul Vowel Characters  }
    XKB_KEY_Hangul_AraeA = $0ef6;
    XKB_KEY_Hangul_AraeAE = $0ef7;
  { Ancient Hangul syllable-final (JongSeong) Characters  }
    XKB_KEY_Hangul_J_PanSios = $0ef8;
    XKB_KEY_Hangul_J_KkogjiDalrinIeung = $0ef9;
    XKB_KEY_Hangul_J_YeorinHieuh = $0efa;
  { Korean currency symbol  }
  {(U+20A9 WON SIGN) }
    XKB_KEY_Korean_Won = $0eff;
  {
   * Armenian
    }
  { U+0587 ARMENIAN SMALL LIGATURE ECH YIWN  }
    XKB_KEY_Armenian_ligature_ew = $1000587;
  { U+0589 ARMENIAN FULL STOP  }
    XKB_KEY_Armenian_full_stop = $1000589;
  { U+0589 ARMENIAN FULL STOP  }
    XKB_KEY_Armenian_verjaket = $1000589;
  { U+055D ARMENIAN COMMA  }
    XKB_KEY_Armenian_separation_mark = $100055d;
  { U+055D ARMENIAN COMMA  }
    XKB_KEY_Armenian_but = $100055d;
  { U+058A ARMENIAN HYPHEN  }
    XKB_KEY_Armenian_hyphen = $100058a;
  { U+058A ARMENIAN HYPHEN  }
    XKB_KEY_Armenian_yentamna = $100058a;
  { U+055C ARMENIAN EXCLAMATION MARK  }
    XKB_KEY_Armenian_exclam = $100055c;
  { U+055C ARMENIAN EXCLAMATION MARK  }
    XKB_KEY_Armenian_amanak = $100055c;
  { U+055B ARMENIAN EMPHASIS MARK  }
    XKB_KEY_Armenian_accent = $100055b;
  { U+055B ARMENIAN EMPHASIS MARK  }
    XKB_KEY_Armenian_shesht = $100055b;
  { U+055E ARMENIAN QUESTION MARK  }
    XKB_KEY_Armenian_question = $100055e;
  { U+055E ARMENIAN QUESTION MARK  }
    XKB_KEY_Armenian_paruyk = $100055e;
  { U+0531 ARMENIAN CAPITAL LETTER AYB  }
    XKB_KEY_Armenian_AYB = $1000531;
  { U+0561 ARMENIAN SMALL LETTER AYB  }
    XKB_KEY_Armenian_ayb_ = $1000561;
  { U+0532 ARMENIAN CAPITAL LETTER BEN  }
    XKB_KEY_Armenian_BEN = $1000532;
  { U+0562 ARMENIAN SMALL LETTER BEN  }
    XKB_KEY_Armenian_ben_ = $1000562;
  { U+0533 ARMENIAN CAPITAL LETTER GIM  }
    XKB_KEY_Armenian_GIM = $1000533;
  { U+0563 ARMENIAN SMALL LETTER GIM  }
    XKB_KEY_Armenian_gim_ = $1000563;
  { U+0534 ARMENIAN CAPITAL LETTER DA  }
    XKB_KEY_Armenian_DA = $1000534;
  { U+0564 ARMENIAN SMALL LETTER DA  }
    XKB_KEY_Armenian_da_ = $1000564;
  { U+0535 ARMENIAN CAPITAL LETTER ECH  }
    XKB_KEY_Armenian_YECH = $1000535;
  { U+0565 ARMENIAN SMALL LETTER ECH  }
    XKB_KEY_Armenian_yech_ = $1000565;
  { U+0536 ARMENIAN CAPITAL LETTER ZA  }
    XKB_KEY_Armenian_ZA = $1000536;
  { U+0566 ARMENIAN SMALL LETTER ZA  }
    XKB_KEY_Armenian_za_ = $1000566;
  { U+0537 ARMENIAN CAPITAL LETTER EH  }
    XKB_KEY_Armenian_E = $1000537;
  { U+0567 ARMENIAN SMALL LETTER EH  }
    XKB_KEY_Armenian_e_ = $1000567;
  { U+0538 ARMENIAN CAPITAL LETTER ET  }
    XKB_KEY_Armenian_AT = $1000538;
  { U+0568 ARMENIAN SMALL LETTER ET  }
    XKB_KEY_Armenian_at_ = $1000568;
  { U+0539 ARMENIAN CAPITAL LETTER TO  }
    XKB_KEY_Armenian_TO = $1000539;
  { U+0569 ARMENIAN SMALL LETTER TO  }
    XKB_KEY_Armenian_to_ = $1000569;
  { U+053A ARMENIAN CAPITAL LETTER ZHE  }
    XKB_KEY_Armenian_ZHE = $100053a;
  { U+056A ARMENIAN SMALL LETTER ZHE  }
    XKB_KEY_Armenian_zhe_ = $100056a;
  { U+053B ARMENIAN CAPITAL LETTER INI  }
    XKB_KEY_Armenian_INI = $100053b;
  { U+056B ARMENIAN SMALL LETTER INI  }
    XKB_KEY_Armenian_ini_ = $100056b;
  { U+053C ARMENIAN CAPITAL LETTER LIWN  }
    XKB_KEY_Armenian_LYUN = $100053c;
  { U+056C ARMENIAN SMALL LETTER LIWN  }
    XKB_KEY_Armenian_lyun_ = $100056c;
  { U+053D ARMENIAN CAPITAL LETTER XEH  }
    XKB_KEY_Armenian_KHE = $100053d;
  { U+056D ARMENIAN SMALL LETTER XEH  }
    XKB_KEY_Armenian_khe_ = $100056d;
  { U+053E ARMENIAN CAPITAL LETTER CA  }
    XKB_KEY_Armenian_TSA = $100053e;
  { U+056E ARMENIAN SMALL LETTER CA  }
    XKB_KEY_Armenian_tsa_ = $100056e;
  { U+053F ARMENIAN CAPITAL LETTER KEN  }
    XKB_KEY_Armenian_KEN = $100053f;
  { U+056F ARMENIAN SMALL LETTER KEN  }
    XKB_KEY_Armenian_ken_ = $100056f;
  { U+0540 ARMENIAN CAPITAL LETTER HO  }
    XKB_KEY_Armenian_HO = $1000540;
  { U+0570 ARMENIAN SMALL LETTER HO  }
    XKB_KEY_Armenian_ho_ = $1000570;
  { U+0541 ARMENIAN CAPITAL LETTER JA  }
    XKB_KEY_Armenian_DZA = $1000541;
  { U+0571 ARMENIAN SMALL LETTER JA  }
    XKB_KEY_Armenian_dza_ = $1000571;
  { U+0542 ARMENIAN CAPITAL LETTER GHAD  }
    XKB_KEY_Armenian_GHAT = $1000542;
  { U+0572 ARMENIAN SMALL LETTER GHAD  }
    XKB_KEY_Armenian_ghat_ = $1000572;
  { U+0543 ARMENIAN CAPITAL LETTER CHEH  }
    XKB_KEY_Armenian_TCHE = $1000543;
  { U+0573 ARMENIAN SMALL LETTER CHEH  }
    XKB_KEY_Armenian_tche_ = $1000573;
  { U+0544 ARMENIAN CAPITAL LETTER MEN  }
    XKB_KEY_Armenian_MEN = $1000544;
  { U+0574 ARMENIAN SMALL LETTER MEN  }
    XKB_KEY_Armenian_men_ = $1000574;
  { U+0545 ARMENIAN CAPITAL LETTER YI  }
    XKB_KEY_Armenian_HI = $1000545;
  { U+0575 ARMENIAN SMALL LETTER YI  }
    XKB_KEY_Armenian_hi_ = $1000575;
  { U+0546 ARMENIAN CAPITAL LETTER NOW  }
    XKB_KEY_Armenian_NU = $1000546;
  { U+0576 ARMENIAN SMALL LETTER NOW  }
    XKB_KEY_Armenian_nu_ = $1000576;
  { U+0547 ARMENIAN CAPITAL LETTER SHA  }
    XKB_KEY_Armenian_SHA = $1000547;
  { U+0577 ARMENIAN SMALL LETTER SHA  }
    XKB_KEY_Armenian_sha_ = $1000577;
  { U+0548 ARMENIAN CAPITAL LETTER VO  }
    XKB_KEY_Armenian_VO = $1000548;
  { U+0578 ARMENIAN SMALL LETTER VO  }
    XKB_KEY_Armenian_vo_ = $1000578;
  { U+0549 ARMENIAN CAPITAL LETTER CHA  }
    XKB_KEY_Armenian_CHA = $1000549;
  { U+0579 ARMENIAN SMALL LETTER CHA  }
    XKB_KEY_Armenian_cha_ = $1000579;
  { U+054A ARMENIAN CAPITAL LETTER PEH  }
    XKB_KEY_Armenian_PE = $100054a;
  { U+057A ARMENIAN SMALL LETTER PEH  }
    XKB_KEY_Armenian_pe_ = $100057a;
  { U+054B ARMENIAN CAPITAL LETTER JHEH  }
    XKB_KEY_Armenian_JE = $100054b;
  { U+057B ARMENIAN SMALL LETTER JHEH  }
    XKB_KEY_Armenian_je_ = $100057b;
  { U+054C ARMENIAN CAPITAL LETTER RA  }
    XKB_KEY_Armenian_RA = $100054c;
  { U+057C ARMENIAN SMALL LETTER RA  }
    XKB_KEY_Armenian_ra_ = $100057c;
  { U+054D ARMENIAN CAPITAL LETTER SEH  }
    XKB_KEY_Armenian_SE = $100054d;
  { U+057D ARMENIAN SMALL LETTER SEH  }
    XKB_KEY_Armenian_se_ = $100057d;
  { U+054E ARMENIAN CAPITAL LETTER VEW  }
    XKB_KEY_Armenian_VEV = $100054e;
  { U+057E ARMENIAN SMALL LETTER VEW  }
    XKB_KEY_Armenian_vev_ = $100057e;
  { U+054F ARMENIAN CAPITAL LETTER TIWN  }
    XKB_KEY_Armenian_TYUN = $100054f;
  { U+057F ARMENIAN SMALL LETTER TIWN  }
    XKB_KEY_Armenian_tyun_ = $100057f;
  { U+0550 ARMENIAN CAPITAL LETTER REH  }
    XKB_KEY_Armenian_RE = $1000550;
  { U+0580 ARMENIAN SMALL LETTER REH  }
    XKB_KEY_Armenian_re_ = $1000580;
  { U+0551 ARMENIAN CAPITAL LETTER CO  }
    XKB_KEY_Armenian_TSO = $1000551;
  { U+0581 ARMENIAN SMALL LETTER CO  }
    XKB_KEY_Armenian_tso_ = $1000581;
  { U+0552 ARMENIAN CAPITAL LETTER YIWN  }
    XKB_KEY_Armenian_VYUN = $1000552;
  { U+0582 ARMENIAN SMALL LETTER YIWN  }
    XKB_KEY_Armenian_vyun_ = $1000582;
  { U+0553 ARMENIAN CAPITAL LETTER PIWR  }
    XKB_KEY_Armenian_PYUR = $1000553;
  { U+0583 ARMENIAN SMALL LETTER PIWR  }
    XKB_KEY_Armenian_pyur_ = $1000583;
  { U+0554 ARMENIAN CAPITAL LETTER KEH  }
    XKB_KEY_Armenian_KE = $1000554;
  { U+0584 ARMENIAN SMALL LETTER KEH  }
    XKB_KEY_Armenian_ke_ = $1000584;
  { U+0555 ARMENIAN CAPITAL LETTER OH  }
    XKB_KEY_Armenian_O = $1000555;
  { U+0585 ARMENIAN SMALL LETTER OH  }
    XKB_KEY_Armenian_o_ = $1000585;
  { U+0556 ARMENIAN CAPITAL LETTER FEH  }
    XKB_KEY_Armenian_FE = $1000556;
  { U+0586 ARMENIAN SMALL LETTER FEH  }
    XKB_KEY_Armenian_fe_ = $1000586;
  { U+055A ARMENIAN APOSTROPHE  }
    XKB_KEY_Armenian_apostrophe = $100055a;
  {
   * Georgian
    }
  { U+10D0 GEORGIAN LETTER AN  }
    XKB_KEY_Georgian_an = $10010d0;
  { U+10D1 GEORGIAN LETTER BAN  }
    XKB_KEY_Georgian_ban = $10010d1;
  { U+10D2 GEORGIAN LETTER GAN  }
    XKB_KEY_Georgian_gan = $10010d2;
  { U+10D3 GEORGIAN LETTER DON  }
    XKB_KEY_Georgian_don = $10010d3;
  { U+10D4 GEORGIAN LETTER EN  }
    XKB_KEY_Georgian_en = $10010d4;
  { U+10D5 GEORGIAN LETTER VIN  }
    XKB_KEY_Georgian_vin = $10010d5;
  { U+10D6 GEORGIAN LETTER ZEN  }
    XKB_KEY_Georgian_zen = $10010d6;
  { U+10D7 GEORGIAN LETTER TAN  }
    XKB_KEY_Georgian_tan = $10010d7;
  { U+10D8 GEORGIAN LETTER IN  }
    XKB_KEY_Georgian_in = $10010d8;
  { U+10D9 GEORGIAN LETTER KAN  }
    XKB_KEY_Georgian_kan = $10010d9;
  { U+10DA GEORGIAN LETTER LAS  }
    XKB_KEY_Georgian_las = $10010da;
  { U+10DB GEORGIAN LETTER MAN  }
    XKB_KEY_Georgian_man = $10010db;
  { U+10DC GEORGIAN LETTER NAR  }
    XKB_KEY_Georgian_nar = $10010dc;
  { U+10DD GEORGIAN LETTER ON  }
    XKB_KEY_Georgian_on = $10010dd;
  { U+10DE GEORGIAN LETTER PAR  }
    XKB_KEY_Georgian_par = $10010de;
  { U+10DF GEORGIAN LETTER ZHAR  }
    XKB_KEY_Georgian_zhar = $10010df;
  { U+10E0 GEORGIAN LETTER RAE  }
    XKB_KEY_Georgian_rae = $10010e0;
  { U+10E1 GEORGIAN LETTER SAN  }
    XKB_KEY_Georgian_san = $10010e1;
  { U+10E2 GEORGIAN LETTER TAR  }
    XKB_KEY_Georgian_tar = $10010e2;
  { U+10E3 GEORGIAN LETTER UN  }
    XKB_KEY_Georgian_un = $10010e3;
  { U+10E4 GEORGIAN LETTER PHAR  }
    XKB_KEY_Georgian_phar = $10010e4;
  { U+10E5 GEORGIAN LETTER KHAR  }
    XKB_KEY_Georgian_khar = $10010e5;
  { U+10E6 GEORGIAN LETTER GHAN  }
    XKB_KEY_Georgian_ghan = $10010e6;
  { U+10E7 GEORGIAN LETTER QAR  }
    XKB_KEY_Georgian_qar = $10010e7;
  { U+10E8 GEORGIAN LETTER SHIN  }
    XKB_KEY_Georgian_shin = $10010e8;
  { U+10E9 GEORGIAN LETTER CHIN  }
    XKB_KEY_Georgian_chin = $10010e9;
  { U+10EA GEORGIAN LETTER CAN  }
    XKB_KEY_Georgian_can = $10010ea;
  { U+10EB GEORGIAN LETTER JIL  }
    XKB_KEY_Georgian_jil = $10010eb;
  { U+10EC GEORGIAN LETTER CIL  }
    XKB_KEY_Georgian_cil = $10010ec;
  { U+10ED GEORGIAN LETTER CHAR  }
    XKB_KEY_Georgian_char = $10010ed;
  { U+10EE GEORGIAN LETTER XAN  }
    XKB_KEY_Georgian_xan = $10010ee;
  { U+10EF GEORGIAN LETTER JHAN  }
    XKB_KEY_Georgian_jhan = $10010ef;
  { U+10F0 GEORGIAN LETTER HAE  }
    XKB_KEY_Georgian_hae = $10010f0;
  { U+10F1 GEORGIAN LETTER HE  }
    XKB_KEY_Georgian_he = $10010f1;
  { U+10F2 GEORGIAN LETTER HIE  }
    XKB_KEY_Georgian_hie = $10010f2;
  { U+10F3 GEORGIAN LETTER WE  }
    XKB_KEY_Georgian_we = $10010f3;
  { U+10F4 GEORGIAN LETTER HAR  }
    XKB_KEY_Georgian_har = $10010f4;
  { U+10F5 GEORGIAN LETTER HOE  }
    XKB_KEY_Georgian_hoe = $10010f5;
  { U+10F6 GEORGIAN LETTER FI  }
    XKB_KEY_Georgian_fi = $10010f6;
  {
   * Azeri (and other Turkic or Caucasian languages)
    }
  { latin  }
  { U+1E8A LATIN CAPITAL LETTER X WITH DOT ABOVE  }
    XKB_KEY_Xabovedot = $1001e8a;
  { U+012C LATIN CAPITAL LETTER I WITH BREVE  }
    XKB_KEY_Ibreve = $100012c;
  { U+01B5 LATIN CAPITAL LETTER Z WITH STROKE  }
    XKB_KEY_Zstroke = $10001b5;
  { U+01E6 LATIN CAPITAL LETTER G WITH CARON  }
    XKB_KEY_Gcaron = $10001e6;
  { U+01D2 LATIN CAPITAL LETTER O WITH CARON  }
    XKB_KEY_Ocaron = $10001d1;
  { U+019F LATIN CAPITAL LETTER O WITH MIDDLE TILDE  }
    XKB_KEY_Obarred = $100019f;
  { U+1E8B LATIN SMALL LETTER X WITH DOT ABOVE  }
    XKB_KEY_xabovedot_ = $1001e8b;
  { U+012D LATIN SMALL LETTER I WITH BREVE  }
    XKB_KEY_ibreve_ = $100012d;
  { U+01B6 LATIN SMALL LETTER Z WITH STROKE  }
    XKB_KEY_zstroke_ = $10001b6;
  { U+01E7 LATIN SMALL LETTER G WITH CARON  }
    XKB_KEY_gcaron_ = $10001e7;
  { U+01D2 LATIN SMALL LETTER O WITH CARON  }
    XKB_KEY_ocaron_ = $10001d2;
  { U+0275 LATIN SMALL LETTER BARRED O  }
    XKB_KEY_obarred_ = $1000275;
  { U+018F LATIN CAPITAL LETTER SCHWA  }
    XKB_KEY_SCHWA = $100018f;
  { U+0259 LATIN SMALL LETTER SCHWA  }
    XKB_KEY_schwa_ = $1000259;
  { U+01B7 LATIN CAPITAL LETTER EZH  }
    XKB_KEY_EZH = $10001b7;
  { U+0292 LATIN SMALL LETTER EZH  }
    XKB_KEY_ezh_ = $1000292;
  { those are not really Caucasus  }
  { For Inupiak  }
  { U+1E36 LATIN CAPITAL LETTER L WITH DOT BELOW  }
    XKB_KEY_Lbelowdot = $1001e36;
  { U+1E37 LATIN SMALL LETTER L WITH DOT BELOW  }
    XKB_KEY_lbelowdot_ = $1001e37;
  {
   * Vietnamese
    }
  { U+1EA0 LATIN CAPITAL LETTER A WITH DOT BELOW  }
    XKB_KEY_Abelowdot = $1001ea0;
  { U+1EA1 LATIN SMALL LETTER A WITH DOT BELOW  }
    XKB_KEY_abelowdot_ = $1001ea1;
  { U+1EA2 LATIN CAPITAL LETTER A WITH HOOK ABOVE  }
    XKB_KEY_Ahook = $1001ea2;
  { U+1EA3 LATIN SMALL LETTER A WITH HOOK ABOVE  }
    XKB_KEY_ahook_ = $1001ea3;
  { U+1EA4 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND ACUTE  }
    XKB_KEY_Acircumflexacute = $1001ea4;
  { U+1EA5 LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE  }
    XKB_KEY_acircumflexacute_ = $1001ea5;
  { U+1EA6 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND GRAVE  }
    XKB_KEY_Acircumflexgrave = $1001ea6;
  { U+1EA7 LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE  }
    XKB_KEY_acircumflexgrave_ = $1001ea7;
  { U+1EA8 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE  }
    XKB_KEY_Acircumflexhook = $1001ea8;
  { U+1EA9 LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE  }
    XKB_KEY_acircumflexhook_ = $1001ea9;
  { U+1EAA LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND TILDE  }
    XKB_KEY_Acircumflextilde = $1001eaa;
  { U+1EAB LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE  }
    XKB_KEY_acircumflextilde_ = $1001eab;
  { U+1EAC LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND DOT BELOW  }
    XKB_KEY_Acircumflexbelowdot = $1001eac;
  { U+1EAD LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW  }
    XKB_KEY_acircumflexbelowdot_ = $1001ead;
  { U+1EAE LATIN CAPITAL LETTER A WITH BREVE AND ACUTE  }
    XKB_KEY_Abreveacute = $1001eae;
  { U+1EAF LATIN SMALL LETTER A WITH BREVE AND ACUTE  }
    XKB_KEY_abreveacute_ = $1001eaf;
  { U+1EB0 LATIN CAPITAL LETTER A WITH BREVE AND GRAVE  }
    XKB_KEY_Abrevegrave = $1001eb0;
  { U+1EB1 LATIN SMALL LETTER A WITH BREVE AND GRAVE  }
    XKB_KEY_abrevegrave_ = $1001eb1;
  { U+1EB2 LATIN CAPITAL LETTER A WITH BREVE AND HOOK ABOVE  }
    XKB_KEY_Abrevehook = $1001eb2;
  { U+1EB3 LATIN SMALL LETTER A WITH BREVE AND HOOK ABOVE  }
    XKB_KEY_abrevehook_ = $1001eb3;
  { U+1EB4 LATIN CAPITAL LETTER A WITH BREVE AND TILDE  }
    XKB_KEY_Abrevetilde = $1001eb4;
  { U+1EB5 LATIN SMALL LETTER A WITH BREVE AND TILDE  }
    XKB_KEY_abrevetilde_ = $1001eb5;
  { U+1EB6 LATIN CAPITAL LETTER A WITH BREVE AND DOT BELOW  }
    XKB_KEY_Abrevebelowdot = $1001eb6;
  { U+1EB7 LATIN SMALL LETTER A WITH BREVE AND DOT BELOW  }
    XKB_KEY_abrevebelowdot_ = $1001eb7;
  { U+1EB8 LATIN CAPITAL LETTER E WITH DOT BELOW  }
    XKB_KEY_Ebelowdot = $1001eb8;
  { U+1EB9 LATIN SMALL LETTER E WITH DOT BELOW  }
    XKB_KEY_ebelowdot_ = $1001eb9;
  { U+1EBA LATIN CAPITAL LETTER E WITH HOOK ABOVE  }
    XKB_KEY_Ehook = $1001eba;
  { U+1EBB LATIN SMALL LETTER E WITH HOOK ABOVE  }
    XKB_KEY_ehook_ = $1001ebb;
  { U+1EBC LATIN CAPITAL LETTER E WITH TILDE  }
    XKB_KEY_Etilde = $1001ebc;
  { U+1EBD LATIN SMALL LETTER E WITH TILDE  }
    XKB_KEY_etilde_ = $1001ebd;
  { U+1EBE LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE  }
    XKB_KEY_Ecircumflexacute = $1001ebe;
  { U+1EBF LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE  }
    XKB_KEY_ecircumflexacute_ = $1001ebf;
  { U+1EC0 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE  }
    XKB_KEY_Ecircumflexgrave = $1001ec0;
  { U+1EC1 LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE  }
    XKB_KEY_ecircumflexgrave_ = $1001ec1;
  { U+1EC2 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE  }
    XKB_KEY_Ecircumflexhook = $1001ec2;
  { U+1EC3 LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE  }
    XKB_KEY_ecircumflexhook_ = $1001ec3;
  { U+1EC4 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE  }
    XKB_KEY_Ecircumflextilde = $1001ec4;
  { U+1EC5 LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE  }
    XKB_KEY_ecircumflextilde_ = $1001ec5;
  { U+1EC6 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND DOT BELOW  }
    XKB_KEY_Ecircumflexbelowdot = $1001ec6;
  { U+1EC7 LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW  }
    XKB_KEY_ecircumflexbelowdot_ = $1001ec7;
  { U+1EC8 LATIN CAPITAL LETTER I WITH HOOK ABOVE  }
    XKB_KEY_Ihook = $1001ec8;
  { U+1EC9 LATIN SMALL LETTER I WITH HOOK ABOVE  }
    XKB_KEY_ihook_ = $1001ec9;
  { U+1ECA LATIN CAPITAL LETTER I WITH DOT BELOW  }
    XKB_KEY_Ibelowdot = $1001eca;
  { U+1ECB LATIN SMALL LETTER I WITH DOT BELOW  }
    XKB_KEY_ibelowdot_ = $1001ecb;
  { U+1ECC LATIN CAPITAL LETTER O WITH DOT BELOW  }
    XKB_KEY_Obelowdot = $1001ecc;
  { U+1ECD LATIN SMALL LETTER O WITH DOT BELOW  }
    XKB_KEY_obelowdot_ = $1001ecd;
  { U+1ECE LATIN CAPITAL LETTER O WITH HOOK ABOVE  }
    XKB_KEY_Ohook = $1001ece;
  { U+1ECF LATIN SMALL LETTER O WITH HOOK ABOVE  }
    XKB_KEY_ohook_ = $1001ecf;
  { U+1ED0 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND ACUTE  }
    XKB_KEY_Ocircumflexacute = $1001ed0;
  { U+1ED1 LATIN SMALL LETTER O WITH CIRCUMFLEX AND ACUTE  }
    XKB_KEY_ocircumflexacute_ = $1001ed1;
  { U+1ED2 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND GRAVE  }
    _XKB_KEY_Ocircumflexgrave = $1001ed2;
  { U+1ED3 LATIN SMALL LETTER O WITH CIRCUMFLEX AND GRAVE  }
    XKB_KEY_ocircumflexgrave = $1001ed3;
  { U+1ED4 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE  }
    XKB_KEY_Ocircumflexhook = $1001ed4;
  { U+1ED5 LATIN SMALL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE  }
    XKB_KEY_ocircumflexhook_ = $1001ed5;
  { U+1ED6 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND TILDE  }
    XKB_KEY_Ocircumflextilde = $1001ed6;
  { U+1ED7 LATIN SMALL LETTER O WITH CIRCUMFLEX AND TILDE  }
    XKB_KEY_ocircumflextilde_ = $1001ed7;
  { U+1ED8 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND DOT BELOW  }
    XKB_KEY_Ocircumflexbelowdot = $1001ed8;
  { U+1ED9 LATIN SMALL LETTER O WITH CIRCUMFLEX AND DOT BELOW  }
    XKB_KEY_ocircumflexbelowdot_ = $1001ed9;
  { U+1EDA LATIN CAPITAL LETTER O WITH HORN AND ACUTE  }
    XKB_KEY_Ohornacute = $1001eda;
  { U+1EDB LATIN SMALL LETTER O WITH HORN AND ACUTE  }
    XKB_KEY_ohornacute_ = $1001edb;
  { U+1EDC LATIN CAPITAL LETTER O WITH HORN AND GRAVE  }
    XKB_KEY_Ohorngrave = $1001edc;
  { U+1EDD LATIN SMALL LETTER O WITH HORN AND GRAVE  }
    XKB_KEY_ohorngrave_ = $1001edd;
  { U+1EDE LATIN CAPITAL LETTER O WITH HORN AND HOOK ABOVE  }
    XKB_KEY_Ohornhook = $1001ede;
  { U+1EDF LATIN SMALL LETTER O WITH HORN AND HOOK ABOVE  }
    XKB_KEY_ohornhook_ = $1001edf;
  { U+1EE0 LATIN CAPITAL LETTER O WITH HORN AND TILDE  }
    XKB_KEY_Ohorntilde = $1001ee0;
  { U+1EE1 LATIN SMALL LETTER O WITH HORN AND TILDE  }
    XKB_KEY_ohorntilde_ = $1001ee1;
  { U+1EE2 LATIN CAPITAL LETTER O WITH HORN AND DOT BELOW  }
    XKB_KEY_Ohornbelowdot = $1001ee2;
  { U+1EE3 LATIN SMALL LETTER O WITH HORN AND DOT BELOW  }
    XKB_KEY_ohornbelowdot_ = $1001ee3;
  { U+1EE4 LATIN CAPITAL LETTER U WITH DOT BELOW  }
    XKB_KEY_Ubelowdot = $1001ee4;
  { U+1EE5 LATIN SMALL LETTER U WITH DOT BELOW  }
    XKB_KEY_ubelowdot_ = $1001ee5;
  { U+1EE6 LATIN CAPITAL LETTER U WITH HOOK ABOVE  }
    XKB_KEY_Uhook = $1001ee6;
  { U+1EE7 LATIN SMALL LETTER U WITH HOOK ABOVE  }
    XKB_KEY_uhook_ = $1001ee7;
  { U+1EE8 LATIN CAPITAL LETTER U WITH HORN AND ACUTE  }
    XKB_KEY_Uhornacute = $1001ee8;
  { U+1EE9 LATIN SMALL LETTER U WITH HORN AND ACUTE  }
    XKB_KEY_uhornacute_ = $1001ee9;
  { U+1EEA LATIN CAPITAL LETTER U WITH HORN AND GRAVE  }
    XKB_KEY_Uhorngrave = $1001eea;
  { U+1EEB LATIN SMALL LETTER U WITH HORN AND GRAVE  }
    XKB_KEY_uhorngrave_ = $1001eeb;
  { U+1EEC LATIN CAPITAL LETTER U WITH HORN AND HOOK ABOVE  }
    XKB_KEY_Uhornhook = $1001eec;
  { U+1EED LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE  }
    XKB_KEY_uhornhook_ = $1001eed;
  { U+1EEE LATIN CAPITAL LETTER U WITH HORN AND TILDE  }
    XKB_KEY_Uhorntilde = $1001eee;
  { U+1EEF LATIN SMALL LETTER U WITH HORN AND TILDE  }
    XKB_KEY_uhorntilde_ = $1001eef;
  { U+1EF0 LATIN CAPITAL LETTER U WITH HORN AND DOT BELOW  }
    XKB_KEY_Uhornbelowdot = $1001ef0;
  { U+1EF1 LATIN SMALL LETTER U WITH HORN AND DOT BELOW  }
    XKB_KEY_uhornbelowdot_ = $1001ef1;
  { U+1EF4 LATIN CAPITAL LETTER Y WITH DOT BELOW  }
    XKB_KEY_Ybelowdot = $1001ef4;
  { U+1EF5 LATIN SMALL LETTER Y WITH DOT BELOW  }
    XKB_KEY_ybelowdot_ = $1001ef5;
  { U+1EF6 LATIN CAPITAL LETTER Y WITH HOOK ABOVE  }
    XKB_KEY_Yhook = $1001ef6;
  { U+1EF7 LATIN SMALL LETTER Y WITH HOOK ABOVE  }
    XKB_KEY_yhook_ = $1001ef7;
  { U+1EF8 LATIN CAPITAL LETTER Y WITH TILDE  }
    XKB_KEY_Ytilde = $1001ef8;
  { U+1EF9 LATIN SMALL LETTER Y WITH TILDE  }
    XKB_KEY_ytilde_ = $1001ef9;
  { U+01A0 LATIN CAPITAL LETTER O WITH HORN  }
    XKB_KEY_Ohorn = $10001a0;
  { U+01A1 LATIN SMALL LETTER O WITH HORN  }
    XKB_KEY_ohorn_ = $10001a1;
  { U+01AF LATIN CAPITAL LETTER U WITH HORN  }
    XKB_KEY_Uhorn = $10001af;
  { U+01B0 LATIN SMALL LETTER U WITH HORN  }
    XKB_KEY_uhorn_ = $10001b0;
  { U+20A0 EURO-CURRENCY SIGN  }
    XKB_KEY_EcuSign = $10020a0;
  { U+20A1 COLON SIGN  }
    XKB_KEY_ColonSign = $10020a1;
  { U+20A2 CRUZEIRO SIGN  }
    XKB_KEY_CruzeiroSign = $10020a2;
  { U+20A3 FRENCH FRANC SIGN  }
    XKB_KEY_FFrancSign = $10020a3;
  { U+20A4 LIRA SIGN  }
    XKB_KEY_LiraSign = $10020a4;
  { U+20A5 MILL SIGN  }
    XKB_KEY_MillSign = $10020a5;
  { U+20A6 NAIRA SIGN  }
    XKB_KEY_NairaSign = $10020a6;
  { U+20A7 PESETA SIGN  }
    XKB_KEY_PesetaSign = $10020a7;
  { U+20A8 RUPEE SIGN  }
    XKB_KEY_RupeeSign = $10020a8;
  { U+20A9 WON SIGN  }
    XKB_KEY_WonSign = $10020a9;
  { U+20AA NEW SHEQEL SIGN  }
    XKB_KEY_NewSheqelSign = $10020aa;
  { U+20AB DONG SIGN  }
    XKB_KEY_DongSign = $10020ab;
  { U+20AC EURO SIGN  }
    XKB_KEY_EuroSign = $20ac;
  { one, two and three are defined above.  }
  { U+2070 SUPERSCRIPT ZERO  }
    XKB_KEY_zerosuperior = $1002070;
  { U+2074 SUPERSCRIPT FOUR  }
    XKB_KEY_foursuperior = $1002074;
  { U+2075 SUPERSCRIPT FIVE  }
    XKB_KEY_fivesuperior = $1002075;
  { U+2076 SUPERSCRIPT SIX  }
    XKB_KEY_sixsuperior = $1002076;
  { U+2077 SUPERSCRIPT SEVEN  }
    XKB_KEY_sevensuperior = $1002077;
  { U+2078 SUPERSCRIPT EIGHT  }
    XKB_KEY_eightsuperior = $1002078;
  { U+2079 SUPERSCRIPT NINE  }
    XKB_KEY_ninesuperior = $1002079;
  { U+2080 SUBSCRIPT ZERO  }
    XKB_KEY_zerosubscript = $1002080;
  { U+2081 SUBSCRIPT ONE  }
    XKB_KEY_onesubscript = $1002081;
  { U+2082 SUBSCRIPT TWO  }
    XKB_KEY_twosubscript = $1002082;
  { U+2083 SUBSCRIPT THREE  }
    XKB_KEY_threesubscript = $1002083;
  { U+2084 SUBSCRIPT FOUR  }
    XKB_KEY_foursubscript = $1002084;
  { U+2085 SUBSCRIPT FIVE  }
    XKB_KEY_fivesubscript = $1002085;
  { U+2086 SUBSCRIPT SIX  }
    XKB_KEY_sixsubscript = $1002086;
  { U+2087 SUBSCRIPT SEVEN  }
    XKB_KEY_sevensubscript = $1002087;
  { U+2088 SUBSCRIPT EIGHT  }
    XKB_KEY_eightsubscript = $1002088;
  { U+2089 SUBSCRIPT NINE  }
    XKB_KEY_ninesubscript = $1002089;
  { U+2202 PARTIAL DIFFERENTIAL  }
    XKB_KEY_partdifferential = $1002202;
  { U+2205 NULL SET  }
    XKB_KEY_emptyset = $1002205;
  { U+2208 ELEMENT OF  }
    XKB_KEY_elementof = $1002208;
  { U+2209 NOT AN ELEMENT OF  }
    XKB_KEY_notelementof = $1002209;
  { U+220B CONTAINS AS MEMBER  }
    XKB_KEY_containsas = $100220B;
  { U+221A SQUARE ROOT  }
    XKB_KEY_squareroot = $100221A;
  { U+221B CUBE ROOT  }
    XKB_KEY_cuberoot = $100221B;
  { U+221C FOURTH ROOT  }
    XKB_KEY_fourthroot = $100221C;
  { U+222C DOUBLE INTEGRAL  }
    XKB_KEY_dintegral = $100222C;
  { U+222D TRIPLE INTEGRAL  }
    XKB_KEY_tintegral = $100222D;
  { U+2235 BECAUSE  }
    XKB_KEY_because = $1002235;
  { U+2245 ALMOST EQUAL TO  }
    XKB_KEY_approxeq = $1002248;
  { U+2247 NOT ALMOST EQUAL TO  }
    XKB_KEY_notapproxeq = $1002247;
  { U+2262 NOT IDENTICAL TO  }
    XKB_KEY_notidentical = $1002262;
  { U+2263 STRICTLY EQUIVALENT TO  }    XKB_KEY_stricteq = $1002263;
    XKB_KEY_braille_dot_1 = $fff1;
    XKB_KEY_braille_dot_2 = $fff2;
    XKB_KEY_braille_dot_3 = $fff3;
    XKB_KEY_braille_dot_4 = $fff4;
    XKB_KEY_braille_dot_5 = $fff5;
    XKB_KEY_braille_dot_6 = $fff6;
    XKB_KEY_braille_dot_7 = $fff7;
    XKB_KEY_braille_dot_8 = $fff8;
    XKB_KEY_braille_dot_9 = $fff9;
    XKB_KEY_braille_dot_10 = $fffa;
  { U+2800 BRAILLE PATTERN BLANK  }
    XKB_KEY_braille_blank = $1002800;
  { U+2801 BRAILLE PATTERN DOTS-1  }
    XKB_KEY_braille_dots_1 = $1002801;
  { U+2802 BRAILLE PATTERN DOTS-2  }
    XKB_KEY_braille_dots_2 = $1002802;
  { U+2803 BRAILLE PATTERN DOTS-12  }
    XKB_KEY_braille_dots_12 = $1002803;
  { U+2804 BRAILLE PATTERN DOTS-3  }
    XKB_KEY_braille_dots_3 = $1002804;
  { U+2805 BRAILLE PATTERN DOTS-13  }
    XKB_KEY_braille_dots_13 = $1002805;
  { U+2806 BRAILLE PATTERN DOTS-23  }
    XKB_KEY_braille_dots_23 = $1002806;
  { U+2807 BRAILLE PATTERN DOTS-123  }
    XKB_KEY_braille_dots_123 = $1002807;
  { U+2808 BRAILLE PATTERN DOTS-4  }
    XKB_KEY_braille_dots_4 = $1002808;
  { U+2809 BRAILLE PATTERN DOTS-14  }
    XKB_KEY_braille_dots_14 = $1002809;
  { U+280a BRAILLE PATTERN DOTS-24  }
    XKB_KEY_braille_dots_24 = $100280a;
  { U+280b BRAILLE PATTERN DOTS-124  }
    XKB_KEY_braille_dots_124 = $100280b;
  { U+280c BRAILLE PATTERN DOTS-34  }
    XKB_KEY_braille_dots_34 = $100280c;
  { U+280d BRAILLE PATTERN DOTS-134  }
    XKB_KEY_braille_dots_134 = $100280d;
  { U+280e BRAILLE PATTERN DOTS-234  }
    XKB_KEY_braille_dots_234 = $100280e;
  { U+280f BRAILLE PATTERN DOTS-1234  }
    XKB_KEY_braille_dots_1234 = $100280f;
  { U+2810 BRAILLE PATTERN DOTS-5  }
    XKB_KEY_braille_dots_5 = $1002810;
  { U+2811 BRAILLE PATTERN DOTS-15  }
    XKB_KEY_braille_dots_15 = $1002811;
  { U+2812 BRAILLE PATTERN DOTS-25  }
    XKB_KEY_braille_dots_25 = $1002812;
  { U+2813 BRAILLE PATTERN DOTS-125  }
    XKB_KEY_braille_dots_125 = $1002813;
  { U+2814 BRAILLE PATTERN DOTS-35  }
    XKB_KEY_braille_dots_35 = $1002814;
  { U+2815 BRAILLE PATTERN DOTS-135  }
    XKB_KEY_braille_dots_135 = $1002815;
  { U+2816 BRAILLE PATTERN DOTS-235  }
    XKB_KEY_braille_dots_235 = $1002816;
  { U+2817 BRAILLE PATTERN DOTS-1235  }
    XKB_KEY_braille_dots_1235 = $1002817;
  { U+2818 BRAILLE PATTERN DOTS-45  }
    XKB_KEY_braille_dots_45 = $1002818;
  { U+2819 BRAILLE PATTERN DOTS-145  }
    XKB_KEY_braille_dots_145 = $1002819;
  { U+281a BRAILLE PATTERN DOTS-245  }
    XKB_KEY_braille_dots_245 = $100281a;
  { U+281b BRAILLE PATTERN DOTS-1245  }
    XKB_KEY_braille_dots_1245 = $100281b;
  { U+281c BRAILLE PATTERN DOTS-345  }
    XKB_KEY_braille_dots_345 = $100281c;
  { U+281d BRAILLE PATTERN DOTS-1345  }
    XKB_KEY_braille_dots_1345 = $100281d;
  { U+281e BRAILLE PATTERN DOTS-2345  }
    XKB_KEY_braille_dots_2345 = $100281e;
  { U+281f BRAILLE PATTERN DOTS-12345  }
    XKB_KEY_braille_dots_12345 = $100281f;
  { U+2820 BRAILLE PATTERN DOTS-6  }
    XKB_KEY_braille_dots_6 = $1002820;
  { U+2821 BRAILLE PATTERN DOTS-16  }
    XKB_KEY_braille_dots_16 = $1002821;
  { U+2822 BRAILLE PATTERN DOTS-26  }
    XKB_KEY_braille_dots_26 = $1002822;
  { U+2823 BRAILLE PATTERN DOTS-126  }
    XKB_KEY_braille_dots_126 = $1002823;
  { U+2824 BRAILLE PATTERN DOTS-36  }
    XKB_KEY_braille_dots_36 = $1002824;
  { U+2825 BRAILLE PATTERN DOTS-136  }
    XKB_KEY_braille_dots_136 = $1002825;
  { U+2826 BRAILLE PATTERN DOTS-236  }
    XKB_KEY_braille_dots_236 = $1002826;
  { U+2827 BRAILLE PATTERN DOTS-1236  }
    XKB_KEY_braille_dots_1236 = $1002827;
  { U+2828 BRAILLE PATTERN DOTS-46  }
    XKB_KEY_braille_dots_46 = $1002828;
  { U+2829 BRAILLE PATTERN DOTS-146  }
    XKB_KEY_braille_dots_146 = $1002829;
  { U+282a BRAILLE PATTERN DOTS-246  }
    XKB_KEY_braille_dots_246 = $100282a;
  { U+282b BRAILLE PATTERN DOTS-1246  }
    XKB_KEY_braille_dots_1246 = $100282b;
  { U+282c BRAILLE PATTERN DOTS-346  }
    XKB_KEY_braille_dots_346 = $100282c;
  { U+282d BRAILLE PATTERN DOTS-1346  }
    XKB_KEY_braille_dots_1346 = $100282d;
  { U+282e BRAILLE PATTERN DOTS-2346  }
    XKB_KEY_braille_dots_2346 = $100282e;
  { U+282f BRAILLE PATTERN DOTS-12346  }
    XKB_KEY_braille_dots_12346 = $100282f;
  { U+2830 BRAILLE PATTERN DOTS-56  }
    XKB_KEY_braille_dots_56 = $1002830;
  { U+2831 BRAILLE PATTERN DOTS-156  }
    XKB_KEY_braille_dots_156 = $1002831;
  { U+2832 BRAILLE PATTERN DOTS-256  }
    XKB_KEY_braille_dots_256 = $1002832;
  { U+2833 BRAILLE PATTERN DOTS-1256  }
    XKB_KEY_braille_dots_1256 = $1002833;
  { U+2834 BRAILLE PATTERN DOTS-356  }
    XKB_KEY_braille_dots_356 = $1002834;
  { U+2835 BRAILLE PATTERN DOTS-1356  }
    XKB_KEY_braille_dots_1356 = $1002835;
  { U+2836 BRAILLE PATTERN DOTS-2356  }
    XKB_KEY_braille_dots_2356 = $1002836;
  { U+2837 BRAILLE PATTERN DOTS-12356  }
    XKB_KEY_braille_dots_12356 = $1002837;
  { U+2838 BRAILLE PATTERN DOTS-456  }
    XKB_KEY_braille_dots_456 = $1002838;
  { U+2839 BRAILLE PATTERN DOTS-1456  }
    XKB_KEY_braille_dots_1456 = $1002839;
  { U+283a BRAILLE PATTERN DOTS-2456  }
    XKB_KEY_braille_dots_2456 = $100283a;
  { U+283b BRAILLE PATTERN DOTS-12456  }
    XKB_KEY_braille_dots_12456 = $100283b;
  { U+283c BRAILLE PATTERN DOTS-3456  }
    XKB_KEY_braille_dots_3456 = $100283c;
  { U+283d BRAILLE PATTERN DOTS-13456  }
    XKB_KEY_braille_dots_13456 = $100283d;
  { U+283e BRAILLE PATTERN DOTS-23456  }
    XKB_KEY_braille_dots_23456 = $100283e;
  { U+283f BRAILLE PATTERN DOTS-123456  }
    XKB_KEY_braille_dots_123456 = $100283f;
  { U+2840 BRAILLE PATTERN DOTS-7  }
    XKB_KEY_braille_dots_7 = $1002840;
  { U+2841 BRAILLE PATTERN DOTS-17  }
    XKB_KEY_braille_dots_17 = $1002841;
  { U+2842 BRAILLE PATTERN DOTS-27  }
    XKB_KEY_braille_dots_27 = $1002842;
  { U+2843 BRAILLE PATTERN DOTS-127  }
    XKB_KEY_braille_dots_127 = $1002843;
  { U+2844 BRAILLE PATTERN DOTS-37  }
    XKB_KEY_braille_dots_37 = $1002844;
  { U+2845 BRAILLE PATTERN DOTS-137  }
    XKB_KEY_braille_dots_137 = $1002845;
  { U+2846 BRAILLE PATTERN DOTS-237  }
    XKB_KEY_braille_dots_237 = $1002846;
  { U+2847 BRAILLE PATTERN DOTS-1237  }
    XKB_KEY_braille_dots_1237 = $1002847;
  { U+2848 BRAILLE PATTERN DOTS-47  }
    XKB_KEY_braille_dots_47 = $1002848;
  { U+2849 BRAILLE PATTERN DOTS-147  }
    XKB_KEY_braille_dots_147 = $1002849;
  { U+284a BRAILLE PATTERN DOTS-247  }
    XKB_KEY_braille_dots_247 = $100284a;
  { U+284b BRAILLE PATTERN DOTS-1247  }
    XKB_KEY_braille_dots_1247 = $100284b;
  { U+284c BRAILLE PATTERN DOTS-347  }
    XKB_KEY_braille_dots_347 = $100284c;
  { U+284d BRAILLE PATTERN DOTS-1347  }
    XKB_KEY_braille_dots_1347 = $100284d;
  { U+284e BRAILLE PATTERN DOTS-2347  }
    XKB_KEY_braille_dots_2347 = $100284e;
  { U+284f BRAILLE PATTERN DOTS-12347  }
    XKB_KEY_braille_dots_12347 = $100284f;
  { U+2850 BRAILLE PATTERN DOTS-57  }
    XKB_KEY_braille_dots_57 = $1002850;
  { U+2851 BRAILLE PATTERN DOTS-157  }
    XKB_KEY_braille_dots_157 = $1002851;
  { U+2852 BRAILLE PATTERN DOTS-257  }
    XKB_KEY_braille_dots_257 = $1002852;
  { U+2853 BRAILLE PATTERN DOTS-1257  }
    XKB_KEY_braille_dots_1257 = $1002853;
  { U+2854 BRAILLE PATTERN DOTS-357  }
    XKB_KEY_braille_dots_357 = $1002854;
  { U+2855 BRAILLE PATTERN DOTS-1357  }
    XKB_KEY_braille_dots_1357 = $1002855;
  { U+2856 BRAILLE PATTERN DOTS-2357  }
    XKB_KEY_braille_dots_2357 = $1002856;
  { U+2857 BRAILLE PATTERN DOTS-12357  }
    XKB_KEY_braille_dots_12357 = $1002857;
  { U+2858 BRAILLE PATTERN DOTS-457  }
    XKB_KEY_braille_dots_457 = $1002858;
  { U+2859 BRAILLE PATTERN DOTS-1457  }
    XKB_KEY_braille_dots_1457 = $1002859;
  { U+285a BRAILLE PATTERN DOTS-2457  }
    XKB_KEY_braille_dots_2457 = $100285a;
  { U+285b BRAILLE PATTERN DOTS-12457  }
    XKB_KEY_braille_dots_12457 = $100285b;
  { U+285c BRAILLE PATTERN DOTS-3457  }
    XKB_KEY_braille_dots_3457 = $100285c;
  { U+285d BRAILLE PATTERN DOTS-13457  }
    XKB_KEY_braille_dots_13457 = $100285d;
  { U+285e BRAILLE PATTERN DOTS-23457  }
    XKB_KEY_braille_dots_23457 = $100285e;
  { U+285f BRAILLE PATTERN DOTS-123457  }
    XKB_KEY_braille_dots_123457 = $100285f;
  { U+2860 BRAILLE PATTERN DOTS-67  }
    XKB_KEY_braille_dots_67 = $1002860;
  { U+2861 BRAILLE PATTERN DOTS-167  }
    XKB_KEY_braille_dots_167 = $1002861;
  { U+2862 BRAILLE PATTERN DOTS-267  }
    XKB_KEY_braille_dots_267 = $1002862;
  { U+2863 BRAILLE PATTERN DOTS-1267  }
    XKB_KEY_braille_dots_1267 = $1002863;
  { U+2864 BRAILLE PATTERN DOTS-367  }
    XKB_KEY_braille_dots_367 = $1002864;
  { U+2865 BRAILLE PATTERN DOTS-1367  }
    XKB_KEY_braille_dots_1367 = $1002865;
  { U+2866 BRAILLE PATTERN DOTS-2367  }
    XKB_KEY_braille_dots_2367 = $1002866;
  { U+2867 BRAILLE PATTERN DOTS-12367  }
    XKB_KEY_braille_dots_12367 = $1002867;
  { U+2868 BRAILLE PATTERN DOTS-467  }
    XKB_KEY_braille_dots_467 = $1002868;
  { U+2869 BRAILLE PATTERN DOTS-1467  }
    XKB_KEY_braille_dots_1467 = $1002869;
  { U+286a BRAILLE PATTERN DOTS-2467  }
    XKB_KEY_braille_dots_2467 = $100286a;
  { U+286b BRAILLE PATTERN DOTS-12467  }
    XKB_KEY_braille_dots_12467 = $100286b;
  { U+286c BRAILLE PATTERN DOTS-3467  }
    XKB_KEY_braille_dots_3467 = $100286c;
  { U+286d BRAILLE PATTERN DOTS-13467  }
    XKB_KEY_braille_dots_13467 = $100286d;
  { U+286e BRAILLE PATTERN DOTS-23467  }
    XKB_KEY_braille_dots_23467 = $100286e;
  { U+286f BRAILLE PATTERN DOTS-123467  }
    XKB_KEY_braille_dots_123467 = $100286f;
  { U+2870 BRAILLE PATTERN DOTS-567  }
    XKB_KEY_braille_dots_567 = $1002870;
  { U+2871 BRAILLE PATTERN DOTS-1567  }
    XKB_KEY_braille_dots_1567 = $1002871;
  { U+2872 BRAILLE PATTERN DOTS-2567  }
    XKB_KEY_braille_dots_2567 = $1002872;
  { U+2873 BRAILLE PATTERN DOTS-12567  }
    XKB_KEY_braille_dots_12567 = $1002873;
  { U+2874 BRAILLE PATTERN DOTS-3567  }
    XKB_KEY_braille_dots_3567 = $1002874;
  { U+2875 BRAILLE PATTERN DOTS-13567  }
    XKB_KEY_braille_dots_13567 = $1002875;
  { U+2876 BRAILLE PATTERN DOTS-23567  }
    XKB_KEY_braille_dots_23567 = $1002876;
  { U+2877 BRAILLE PATTERN DOTS-123567  }
    XKB_KEY_braille_dots_123567 = $1002877;
  { U+2878 BRAILLE PATTERN DOTS-4567  }
    XKB_KEY_braille_dots_4567 = $1002878;
  { U+2879 BRAILLE PATTERN DOTS-14567  }
    XKB_KEY_braille_dots_14567 = $1002879;
  { U+287a BRAILLE PATTERN DOTS-24567  }
    XKB_KEY_braille_dots_24567 = $100287a;
  { U+287b BRAILLE PATTERN DOTS-124567  }
    XKB_KEY_braille_dots_124567 = $100287b;
  { U+287c BRAILLE PATTERN DOTS-34567  }
    XKB_KEY_braille_dots_34567 = $100287c;
  { U+287d BRAILLE PATTERN DOTS-134567  }
    XKB_KEY_braille_dots_134567 = $100287d;
  { U+287e BRAILLE PATTERN DOTS-234567  }
    XKB_KEY_braille_dots_234567 = $100287e;
  { U+287f BRAILLE PATTERN DOTS-1234567  }
    XKB_KEY_braille_dots_1234567 = $100287f;
  { U+2880 BRAILLE PATTERN DOTS-8  }
    XKB_KEY_braille_dots_8 = $1002880;
  { U+2881 BRAILLE PATTERN DOTS-18  }
    XKB_KEY_braille_dots_18 = $1002881;
  { U+2882 BRAILLE PATTERN DOTS-28  }
    XKB_KEY_braille_dots_28 = $1002882;
  { U+2883 BRAILLE PATTERN DOTS-128  }
    XKB_KEY_braille_dots_128 = $1002883;
  { U+2884 BRAILLE PATTERN DOTS-38  }
    XKB_KEY_braille_dots_38 = $1002884;
  { U+2885 BRAILLE PATTERN DOTS-138  }
    XKB_KEY_braille_dots_138 = $1002885;
  { U+2886 BRAILLE PATTERN DOTS-238  }
    XKB_KEY_braille_dots_238 = $1002886;
  { U+2887 BRAILLE PATTERN DOTS-1238  }
    XKB_KEY_braille_dots_1238 = $1002887;
  { U+2888 BRAILLE PATTERN DOTS-48  }
    XKB_KEY_braille_dots_48 = $1002888;
  { U+2889 BRAILLE PATTERN DOTS-148  }
    XKB_KEY_braille_dots_148 = $1002889;
  { U+288a BRAILLE PATTERN DOTS-248  }
    XKB_KEY_braille_dots_248 = $100288a;
  { U+288b BRAILLE PATTERN DOTS-1248  }
    XKB_KEY_braille_dots_1248 = $100288b;
  { U+288c BRAILLE PATTERN DOTS-348  }
    XKB_KEY_braille_dots_348 = $100288c;
  { U+288d BRAILLE PATTERN DOTS-1348  }
    XKB_KEY_braille_dots_1348 = $100288d;
  { U+288e BRAILLE PATTERN DOTS-2348  }
    XKB_KEY_braille_dots_2348 = $100288e;
  { U+288f BRAILLE PATTERN DOTS-12348  }
    XKB_KEY_braille_dots_12348 = $100288f;
  { U+2890 BRAILLE PATTERN DOTS-58  }
    XKB_KEY_braille_dots_58 = $1002890;
  { U+2891 BRAILLE PATTERN DOTS-158  }
    XKB_KEY_braille_dots_158 = $1002891;
  { U+2892 BRAILLE PATTERN DOTS-258  }
    XKB_KEY_braille_dots_258 = $1002892;
  { U+2893 BRAILLE PATTERN DOTS-1258  }
    XKB_KEY_braille_dots_1258 = $1002893;
  { U+2894 BRAILLE PATTERN DOTS-358  }
    XKB_KEY_braille_dots_358 = $1002894;
  { U+2895 BRAILLE PATTERN DOTS-1358  }
    XKB_KEY_braille_dots_1358 = $1002895;
  { U+2896 BRAILLE PATTERN DOTS-2358  }
    XKB_KEY_braille_dots_2358 = $1002896;
  { U+2897 BRAILLE PATTERN DOTS-12358  }
    XKB_KEY_braille_dots_12358 = $1002897;
  { U+2898 BRAILLE PATTERN DOTS-458  }
    XKB_KEY_braille_dots_458 = $1002898;
  { U+2899 BRAILLE PATTERN DOTS-1458  }
    XKB_KEY_braille_dots_1458 = $1002899;
  { U+289a BRAILLE PATTERN DOTS-2458  }
    XKB_KEY_braille_dots_2458 = $100289a;
  { U+289b BRAILLE PATTERN DOTS-12458  }
    XKB_KEY_braille_dots_12458 = $100289b;
  { U+289c BRAILLE PATTERN DOTS-3458  }
    XKB_KEY_braille_dots_3458 = $100289c;
  { U+289d BRAILLE PATTERN DOTS-13458  }
    XKB_KEY_braille_dots_13458 = $100289d;
  { U+289e BRAILLE PATTERN DOTS-23458  }
    XKB_KEY_braille_dots_23458 = $100289e;
  { U+289f BRAILLE PATTERN DOTS-123458  }
    XKB_KEY_braille_dots_123458 = $100289f;
  { U+28a0 BRAILLE PATTERN DOTS-68  }
    XKB_KEY_braille_dots_68 = $10028a0;
  { U+28a1 BRAILLE PATTERN DOTS-168  }
    XKB_KEY_braille_dots_168 = $10028a1;
  { U+28a2 BRAILLE PATTERN DOTS-268  }
    XKB_KEY_braille_dots_268 = $10028a2;
  { U+28a3 BRAILLE PATTERN DOTS-1268  }
    XKB_KEY_braille_dots_1268 = $10028a3;
  { U+28a4 BRAILLE PATTERN DOTS-368  }
    XKB_KEY_braille_dots_368 = $10028a4;
  { U+28a5 BRAILLE PATTERN DOTS-1368  }
    XKB_KEY_braille_dots_1368 = $10028a5;
  { U+28a6 BRAILLE PATTERN DOTS-2368  }
    XKB_KEY_braille_dots_2368 = $10028a6;
  { U+28a7 BRAILLE PATTERN DOTS-12368  }
    XKB_KEY_braille_dots_12368 = $10028a7;
  { U+28a8 BRAILLE PATTERN DOTS-468  }
    XKB_KEY_braille_dots_468 = $10028a8;
  { U+28a9 BRAILLE PATTERN DOTS-1468  }
    XKB_KEY_braille_dots_1468 = $10028a9;
  { U+28aa BRAILLE PATTERN DOTS-2468  }
    XKB_KEY_braille_dots_2468 = $10028aa;
  { U+28ab BRAILLE PATTERN DOTS-12468  }
    XKB_KEY_braille_dots_12468 = $10028ab;
  { U+28ac BRAILLE PATTERN DOTS-3468  }
    XKB_KEY_braille_dots_3468 = $10028ac;
  { U+28ad BRAILLE PATTERN DOTS-13468  }
    XKB_KEY_braille_dots_13468 = $10028ad;
  { U+28ae BRAILLE PATTERN DOTS-23468  }
    XKB_KEY_braille_dots_23468 = $10028ae;
  { U+28af BRAILLE PATTERN DOTS-123468  }
    XKB_KEY_braille_dots_123468 = $10028af;
  { U+28b0 BRAILLE PATTERN DOTS-568  }
    XKB_KEY_braille_dots_568 = $10028b0;
  { U+28b1 BRAILLE PATTERN DOTS-1568  }
    XKB_KEY_braille_dots_1568 = $10028b1;
  { U+28b2 BRAILLE PATTERN DOTS-2568  }
    XKB_KEY_braille_dots_2568 = $10028b2;
  { U+28b3 BRAILLE PATTERN DOTS-12568  }
    XKB_KEY_braille_dots_12568 = $10028b3;
  { U+28b4 BRAILLE PATTERN DOTS-3568  }
    XKB_KEY_braille_dots_3568 = $10028b4;
  { U+28b5 BRAILLE PATTERN DOTS-13568  }
    XKB_KEY_braille_dots_13568 = $10028b5;
  { U+28b6 BRAILLE PATTERN DOTS-23568  }
    XKB_KEY_braille_dots_23568 = $10028b6;
  { U+28b7 BRAILLE PATTERN DOTS-123568  }
    XKB_KEY_braille_dots_123568 = $10028b7;
  { U+28b8 BRAILLE PATTERN DOTS-4568  }
    XKB_KEY_braille_dots_4568 = $10028b8;
  { U+28b9 BRAILLE PATTERN DOTS-14568  }
    XKB_KEY_braille_dots_14568 = $10028b9;
  { U+28ba BRAILLE PATTERN DOTS-24568  }
    XKB_KEY_braille_dots_24568 = $10028ba;
  { U+28bb BRAILLE PATTERN DOTS-124568  }
    XKB_KEY_braille_dots_124568 = $10028bb;
  { U+28bc BRAILLE PATTERN DOTS-34568  }
    XKB_KEY_braille_dots_34568 = $10028bc;
  { U+28bd BRAILLE PATTERN DOTS-134568  }
    XKB_KEY_braille_dots_134568 = $10028bd;
  { U+28be BRAILLE PATTERN DOTS-234568  }
    XKB_KEY_braille_dots_234568 = $10028be;
  { U+28bf BRAILLE PATTERN DOTS-1234568  }
    XKB_KEY_braille_dots_1234568 = $10028bf;
  { U+28c0 BRAILLE PATTERN DOTS-78  }
    XKB_KEY_braille_dots_78 = $10028c0;
  { U+28c1 BRAILLE PATTERN DOTS-178  }
    XKB_KEY_braille_dots_178 = $10028c1;
  { U+28c2 BRAILLE PATTERN DOTS-278  }
    XKB_KEY_braille_dots_278 = $10028c2;
  { U+28c3 BRAILLE PATTERN DOTS-1278  }
    XKB_KEY_braille_dots_1278 = $10028c3;
  { U+28c4 BRAILLE PATTERN DOTS-378  }
    XKB_KEY_braille_dots_378 = $10028c4;
  { U+28c5 BRAILLE PATTERN DOTS-1378  }
    XKB_KEY_braille_dots_1378 = $10028c5;
  { U+28c6 BRAILLE PATTERN DOTS-2378  }
    XKB_KEY_braille_dots_2378 = $10028c6;
  { U+28c7 BRAILLE PATTERN DOTS-12378  }
    XKB_KEY_braille_dots_12378 = $10028c7;
  { U+28c8 BRAILLE PATTERN DOTS-478  }
    XKB_KEY_braille_dots_478 = $10028c8;
  { U+28c9 BRAILLE PATTERN DOTS-1478  }
    XKB_KEY_braille_dots_1478 = $10028c9;
  { U+28ca BRAILLE PATTERN DOTS-2478  }
    XKB_KEY_braille_dots_2478 = $10028ca;
  { U+28cb BRAILLE PATTERN DOTS-12478  }
    XKB_KEY_braille_dots_12478 = $10028cb;
  { U+28cc BRAILLE PATTERN DOTS-3478  }
    XKB_KEY_braille_dots_3478 = $10028cc;
  { U+28cd BRAILLE PATTERN DOTS-13478  }
    XKB_KEY_braille_dots_13478 = $10028cd;
  { U+28ce BRAILLE PATTERN DOTS-23478  }
    XKB_KEY_braille_dots_23478 = $10028ce;
  { U+28cf BRAILLE PATTERN DOTS-123478  }
    XKB_KEY_braille_dots_123478 = $10028cf;
  { U+28d0 BRAILLE PATTERN DOTS-578  }
    XKB_KEY_braille_dots_578 = $10028d0;
  { U+28d1 BRAILLE PATTERN DOTS-1578  }
    XKB_KEY_braille_dots_1578 = $10028d1;
  { U+28d2 BRAILLE PATTERN DOTS-2578  }
    XKB_KEY_braille_dots_2578 = $10028d2;
  { U+28d3 BRAILLE PATTERN DOTS-12578  }
    XKB_KEY_braille_dots_12578 = $10028d3;
  { U+28d4 BRAILLE PATTERN DOTS-3578  }
    XKB_KEY_braille_dots_3578 = $10028d4;
  { U+28d5 BRAILLE PATTERN DOTS-13578  }
    XKB_KEY_braille_dots_13578 = $10028d5;
  { U+28d6 BRAILLE PATTERN DOTS-23578  }
    XKB_KEY_braille_dots_23578 = $10028d6;
  { U+28d7 BRAILLE PATTERN DOTS-123578  }
    XKB_KEY_braille_dots_123578 = $10028d7;
  { U+28d8 BRAILLE PATTERN DOTS-4578  }
    XKB_KEY_braille_dots_4578 = $10028d8;
  { U+28d9 BRAILLE PATTERN DOTS-14578  }
    XKB_KEY_braille_dots_14578 = $10028d9;
  { U+28da BRAILLE PATTERN DOTS-24578  }
    XKB_KEY_braille_dots_24578 = $10028da;
  { U+28db BRAILLE PATTERN DOTS-124578  }
    XKB_KEY_braille_dots_124578 = $10028db;
  { U+28dc BRAILLE PATTERN DOTS-34578  }
    XKB_KEY_braille_dots_34578 = $10028dc;
  { U+28dd BRAILLE PATTERN DOTS-134578  }
    XKB_KEY_braille_dots_134578 = $10028dd;
  { U+28de BRAILLE PATTERN DOTS-234578  }
    XKB_KEY_braille_dots_234578 = $10028de;
  { U+28df BRAILLE PATTERN DOTS-1234578  }
    XKB_KEY_braille_dots_1234578 = $10028df;
  { U+28e0 BRAILLE PATTERN DOTS-678  }
    XKB_KEY_braille_dots_678 = $10028e0;
  { U+28e1 BRAILLE PATTERN DOTS-1678  }
    XKB_KEY_braille_dots_1678 = $10028e1;
  { U+28e2 BRAILLE PATTERN DOTS-2678  }
    XKB_KEY_braille_dots_2678 = $10028e2;
  { U+28e3 BRAILLE PATTERN DOTS-12678  }
    XKB_KEY_braille_dots_12678 = $10028e3;
  { U+28e4 BRAILLE PATTERN DOTS-3678  }
    XKB_KEY_braille_dots_3678 = $10028e4;
  { U+28e5 BRAILLE PATTERN DOTS-13678  }
    XKB_KEY_braille_dots_13678 = $10028e5;
  { U+28e6 BRAILLE PATTERN DOTS-23678  }
    XKB_KEY_braille_dots_23678 = $10028e6;
  { U+28e7 BRAILLE PATTERN DOTS-123678  }
    XKB_KEY_braille_dots_123678 = $10028e7;
  { U+28e8 BRAILLE PATTERN DOTS-4678  }
    XKB_KEY_braille_dots_4678 = $10028e8;
  { U+28e9 BRAILLE PATTERN DOTS-14678  }
    XKB_KEY_braille_dots_14678 = $10028e9;
  { U+28ea BRAILLE PATTERN DOTS-24678  }
    XKB_KEY_braille_dots_24678 = $10028ea;
  { U+28eb BRAILLE PATTERN DOTS-124678  }
    XKB_KEY_braille_dots_124678 = $10028eb;
  { U+28ec BRAILLE PATTERN DOTS-34678  }
    XKB_KEY_braille_dots_34678 = $10028ec;
  { U+28ed BRAILLE PATTERN DOTS-134678  }
    XKB_KEY_braille_dots_134678 = $10028ed;
  { U+28ee BRAILLE PATTERN DOTS-234678  }
    XKB_KEY_braille_dots_234678 = $10028ee;
  { U+28ef BRAILLE PATTERN DOTS-1234678  }
    XKB_KEY_braille_dots_1234678 = $10028ef;
  { U+28f0 BRAILLE PATTERN DOTS-5678  }
    XKB_KEY_braille_dots_5678 = $10028f0;
  { U+28f1 BRAILLE PATTERN DOTS-15678  }
    XKB_KEY_braille_dots_15678 = $10028f1;
  { U+28f2 BRAILLE PATTERN DOTS-25678  }
    XKB_KEY_braille_dots_25678 = $10028f2;
  { U+28f3 BRAILLE PATTERN DOTS-125678  }
    XKB_KEY_braille_dots_125678 = $10028f3;
  { U+28f4 BRAILLE PATTERN DOTS-35678  }
    XKB_KEY_braille_dots_35678 = $10028f4;
  { U+28f5 BRAILLE PATTERN DOTS-135678  }
    XKB_KEY_braille_dots_135678 = $10028f5;
  { U+28f6 BRAILLE PATTERN DOTS-235678  }
    XKB_KEY_braille_dots_235678 = $10028f6;
  { U+28f7 BRAILLE PATTERN DOTS-1235678  }
    XKB_KEY_braille_dots_1235678 = $10028f7;
  { U+28f8 BRAILLE PATTERN DOTS-45678  }
    XKB_KEY_braille_dots_45678 = $10028f8;
  { U+28f9 BRAILLE PATTERN DOTS-145678  }
    XKB_KEY_braille_dots_145678 = $10028f9;
  { U+28fa BRAILLE PATTERN DOTS-245678  }
    XKB_KEY_braille_dots_245678 = $10028fa;
  { U+28fb BRAILLE PATTERN DOTS-1245678  }
    XKB_KEY_braille_dots_1245678 = $10028fb;
  { U+28fc BRAILLE PATTERN DOTS-345678  }
    XKB_KEY_braille_dots_345678 = $10028fc;
  { U+28fd BRAILLE PATTERN DOTS-1345678  }
    XKB_KEY_braille_dots_1345678 = $10028fd;
  { U+28fe BRAILLE PATTERN DOTS-2345678  }
    XKB_KEY_braille_dots_2345678 = $10028fe;
  { U+28ff BRAILLE PATTERN DOTS-12345678  }
    XKB_KEY_braille_dots_12345678 = $10028ff;
  {
   * Sinhala (http://unicode.org/charts/PDF/U0D80.pdf)
   * http://www.nongnu.org/sinhala/doc/transliteration/sinhala-transliteration_6.html
    }
  { U+0D82 SINHALA ANUSVARAYA  }
    XKB_KEY_Sinh_ng = $1000d82;
  { U+0D83 SINHALA VISARGAYA  }
    XKB_KEY_Sinh_h2 = $1000d83;
  { U+0D85 SINHALA AYANNA  }
    XKB_KEY_Sinh_a = $1000d85;
  { U+0D86 SINHALA AAYANNA  }
    XKB_KEY_Sinh_aa = $1000d86;
  { U+0D87 SINHALA AEYANNA  }
    XKB_KEY_Sinh_ae = $1000d87;
  { U+0D88 SINHALA AEEYANNA  }
    XKB_KEY_Sinh_aee = $1000d88;
  { U+0D89 SINHALA IYANNA  }
    XKB_KEY_Sinh_i = $1000d89;
  { U+0D8A SINHALA IIYANNA  }
    XKB_KEY_Sinh_ii = $1000d8a;
  { U+0D8B SINHALA UYANNA  }
    XKB_KEY_Sinh_u = $1000d8b;
  { U+0D8C SINHALA UUYANNA  }
    XKB_KEY_Sinh_uu = $1000d8c;
  { U+0D8D SINHALA IRUYANNA  }
    XKB_KEY_Sinh_ri = $1000d8d;
  { U+0D8E SINHALA IRUUYANNA  }
    XKB_KEY_Sinh_rii = $1000d8e;
  { U+0D8F SINHALA ILUYANNA  }
    XKB_KEY_Sinh_lu = $1000d8f;
  { U+0D90 SINHALA ILUUYANNA  }
    XKB_KEY_Sinh_luu = $1000d90;
  { U+0D91 SINHALA EYANNA  }
    XKB_KEY_Sinh_e = $1000d91;
  { U+0D92 SINHALA EEYANNA  }
    XKB_KEY_Sinh_ee = $1000d92;
  { U+0D93 SINHALA AIYANNA  }
    XKB_KEY_Sinh_ai = $1000d93;
  { U+0D94 SINHALA OYANNA  }
    XKB_KEY_Sinh_o = $1000d94;
  { U+0D95 SINHALA OOYANNA  }
    XKB_KEY_Sinh_oo = $1000d95;
  { U+0D96 SINHALA AUYANNA  }
    XKB_KEY_Sinh_au = $1000d96;
  { U+0D9A SINHALA KAYANNA  }
    XKB_KEY_Sinh_ka = $1000d9a;
  { U+0D9B SINHALA MAHA. KAYANNA  }
    XKB_KEY_Sinh_kha = $1000d9b;
  { U+0D9C SINHALA GAYANNA  }
    XKB_KEY_Sinh_ga = $1000d9c;
  { U+0D9D SINHALA MAHA. GAYANNA  }
    XKB_KEY_Sinh_gha = $1000d9d;
  { U+0D9E SINHALA KANTAJA NAASIKYAYA  }
    XKB_KEY_Sinh_ng2 = $1000d9e;
  { U+0D9F SINHALA SANYAKA GAYANNA  }
    XKB_KEY_Sinh_nga = $1000d9f;
  { U+0DA0 SINHALA CAYANNA  }
    XKB_KEY_Sinh_ca = $1000da0;
  { U+0DA1 SINHALA MAHA. CAYANNA  }
    XKB_KEY_Sinh_cha = $1000da1;
  { U+0DA2 SINHALA JAYANNA  }
    XKB_KEY_Sinh_ja = $1000da2;
  { U+0DA3 SINHALA MAHA. JAYANNA  }
    XKB_KEY_Sinh_jha = $1000da3;
  { U+0DA4 SINHALA TAALUJA NAASIKYAYA  }
    XKB_KEY_Sinh_nya = $1000da4;
  { U+0DA5 SINHALA TAALUJA SANYOOGA NAASIKYAYA  }
    XKB_KEY_Sinh_jnya = $1000da5;
  { U+0DA6 SINHALA SANYAKA JAYANNA  }
    XKB_KEY_Sinh_nja = $1000da6;
  { U+0DA7 SINHALA TTAYANNA  }
    XKB_KEY_Sinh_tta = $1000da7;
  { U+0DA8 SINHALA MAHA. TTAYANNA  }
    XKB_KEY_Sinh_ttha = $1000da8;
  { U+0DA9 SINHALA DDAYANNA  }
    XKB_KEY_Sinh_dda = $1000da9;
  { U+0DAA SINHALA MAHA. DDAYANNA  }
    XKB_KEY_Sinh_ddha = $1000daa;
  { U+0DAB SINHALA MUURDHAJA NAYANNA  }
    XKB_KEY_Sinh_nna = $1000dab;
  { U+0DAC SINHALA SANYAKA DDAYANNA  }
    XKB_KEY_Sinh_ndda = $1000dac;
  { U+0DAD SINHALA TAYANNA  }
    XKB_KEY_Sinh_tha = $1000dad;
  { U+0DAE SINHALA MAHA. TAYANNA  }
    XKB_KEY_Sinh_thha = $1000dae;
  { U+0DAF SINHALA DAYANNA  }
    XKB_KEY_Sinh_dha = $1000daf;
  { U+0DB0 SINHALA MAHA. DAYANNA  }
    XKB_KEY_Sinh_dhha = $1000db0;
  { U+0DB1 SINHALA DANTAJA NAYANNA  }
    XKB_KEY_Sinh_na = $1000db1;
  { U+0DB3 SINHALA SANYAKA DAYANNA  }
    XKB_KEY_Sinh_ndha = $1000db3;
  { U+0DB4 SINHALA PAYANNA  }
    XKB_KEY_Sinh_pa = $1000db4;
  { U+0DB5 SINHALA MAHA. PAYANNA  }
    XKB_KEY_Sinh_pha = $1000db5;
  { U+0DB6 SINHALA BAYANNA  }
    XKB_KEY_Sinh_ba = $1000db6;
  { U+0DB7 SINHALA MAHA. BAYANNA  }
    XKB_KEY_Sinh_bha = $1000db7;
  { U+0DB8 SINHALA MAYANNA  }
    XKB_KEY_Sinh_ma = $1000db8;
  { U+0DB9 SINHALA AMBA BAYANNA  }
    XKB_KEY_Sinh_mba = $1000db9;
  { U+0DBA SINHALA YAYANNA  }
    XKB_KEY_Sinh_ya = $1000dba;
  { U+0DBB SINHALA RAYANNA  }
    XKB_KEY_Sinh_ra = $1000dbb;
  { U+0DBD SINHALA DANTAJA LAYANNA  }
    XKB_KEY_Sinh_la = $1000dbd;
  { U+0DC0 SINHALA VAYANNA  }
    XKB_KEY_Sinh_va = $1000dc0;
  { U+0DC1 SINHALA TAALUJA SAYANNA  }
    XKB_KEY_Sinh_sha = $1000dc1;
  { U+0DC2 SINHALA MUURDHAJA SAYANNA  }
    XKB_KEY_Sinh_ssha = $1000dc2;
  { U+0DC3 SINHALA DANTAJA SAYANNA  }
    XKB_KEY_Sinh_sa = $1000dc3;
  { U+0DC4 SINHALA HAYANNA  }
    XKB_KEY_Sinh_ha = $1000dc4;
  { U+0DC5 SINHALA MUURDHAJA LAYANNA  }
    XKB_KEY_Sinh_lla = $1000dc5;
  { U+0DC6 SINHALA FAYANNA  }
    XKB_KEY_Sinh_fa = $1000dc6;
  { U+0DCA SINHALA AL-LAKUNA  }
    XKB_KEY_Sinh_al = $1000dca;
  { U+0DCF SINHALA AELA-PILLA  }
    XKB_KEY_Sinh_aa2 = $1000dcf;
  { U+0DD0 SINHALA AEDA-PILLA  }
    XKB_KEY_Sinh_ae2 = $1000dd0;
  { U+0DD1 SINHALA DIGA AEDA-PILLA  }
    XKB_KEY_Sinh_aee2 = $1000dd1;
  { U+0DD2 SINHALA IS-PILLA  }
    XKB_KEY_Sinh_i2 = $1000dd2;
  { U+0DD3 SINHALA DIGA IS-PILLA  }
    XKB_KEY_Sinh_ii2 = $1000dd3;
  { U+0DD4 SINHALA PAA-PILLA  }
    XKB_KEY_Sinh_u2 = $1000dd4;
  { U+0DD6 SINHALA DIGA PAA-PILLA  }
    XKB_KEY_Sinh_uu2 = $1000dd6;
  { U+0DD8 SINHALA GAETTA-PILLA  }
    XKB_KEY_Sinh_ru2 = $1000dd8;
  { U+0DD9 SINHALA KOMBUVA  }
    XKB_KEY_Sinh_e2 = $1000dd9;
  { U+0DDA SINHALA DIGA KOMBUVA  }
    XKB_KEY_Sinh_ee2 = $1000dda;
  { U+0DDB SINHALA KOMBU DEKA  }
    XKB_KEY_Sinh_ai2 = $1000ddb;
  { U+0DDC SINHALA KOMBUVA HAA AELA-PILLA }
    XKB_KEY_Sinh_o2 = $1000ddc;
  { U+0DDD SINHALA KOMBUVA HAA DIGA AELA-PILLA }
    XKB_KEY_Sinh_oo2 = $1000ddd;
  { U+0DDE SINHALA KOMBUVA HAA GAYANUKITTA  }
    XKB_KEY_Sinh_au2 = $1000dde;
  { U+0DDF SINHALA GAYANUKITTA  }
    XKB_KEY_Sinh_lu2 = $1000ddf;
  { U+0DF2 SINHALA DIGA GAETTA-PILLA  }
    XKB_KEY_Sinh_ruu2 = $1000df2;
  { U+0DF3 SINHALA DIGA GAYANUKITTA  }
    XKB_KEY_Sinh_luu2 = $1000df3;
  { U+0DF4 SINHALA KUNDDALIYA  }
    XKB_KEY_Sinh_kunddaliya = $1000df4;
  {
   * XFree86 vendor specific keysyms.
   *
   * The XFree86 keysym range is 0x10080001 - 0x1008FFFF.
   *
   * When adding new entries, the xc/lib/XKeysymDB file should also be
   * updated to make the new entries visible to Xlib.
    }
  {
   * ModeLock
   *
   * This one is old, and not really used any more since XKB offers this
   * functionality.
    }
  { Mode Switch Lock  }
    XKB_KEY_XF86ModeLock = $1008FF01;
  {
   * Note, 0x1008FF07 - 0x1008FF0F are free and should be used for misc new
   * keysyms that don't fit into any of the groups below.
   *
   * 0x1008FF64, 0x1008FF6F, 0x1008FF71, 0x1008FF83 are no longer used,
   * and should be used first for new keysyms.
   *
   * Check in keysymdef.h for generic symbols before adding new XFree86-specific
   * symbols here.
   *
   * X.Org will not be adding to the XF86 set of keysyms, though they have
   * been adopted and are considered a "standard" part of X keysym definitions.
   * XFree86 never properly commented these keysyms, so we have done our
   * best to explain the semantic meaning of these keys.
   *
   * XFree86 has removed their mail archives of the period, that might have
   * shed more light on some of these definitions. Until/unless we resurrect
   * these archives, these are from memory and usage.
    }
  { Backlight controls.  }
  { Monitor/panel brightness  }
    XKB_KEY_XF86MonBrightnessUp = $1008FF02;
  { Monitor/panel brightness  }
    XKB_KEY_XF86MonBrightnessDown = $1008FF03;
  { Keyboards may be lit      }
    XKB_KEY_XF86KbdLightOnOff = $1008FF04;
  { Keyboards may be lit      }
    XKB_KEY_XF86KbdBrightnessUp = $1008FF05;
  { Keyboards may be lit      }
    XKB_KEY_XF86KbdBrightnessDown = $1008FF06;
  {
   * Keys found on some "Internet" keyboards.
    }
  { System into standby mode    }
    XKB_KEY_XF86Standby = $1008FF10;
  { Volume control down         }
    XKB_KEY_XF86AudioLowerVolume = $1008FF11;
  { Mute sound from the system  }
    XKB_KEY_XF86AudioMute = $1008FF12;
  { Volume control up           }
    XKB_KEY_XF86AudioRaiseVolume = $1008FF13;
  { Start playing of audio >    }
    XKB_KEY_XF86AudioPlay = $1008FF14;
  { Stop playing audio          }
    XKB_KEY_XF86AudioStop = $1008FF15;
  { Previous track              }
    XKB_KEY_XF86AudioPrev = $1008FF16;
  { Next track                  }
    XKB_KEY_XF86AudioNext = $1008FF17;
  { Display user's home page    }
    XKB_KEY_XF86HomePage = $1008FF18;
  { Invoke user's mail program  }
    XKB_KEY_XF86Mail = $1008FF19;
  { Start application           }
    XKB_KEY_XF86Start = $1008FF1A;
  { Search                      }
    XKB_KEY_XF86Search = $1008FF1B;
  { Record audio application    }
    XKB_KEY_XF86AudioRecord = $1008FF1C;
  { These are sometimes found on PDA's (e.g. Palm, PocketPC or elsewhere)    }
  { Invoke calculator program   }
    XKB_KEY_XF86Calculator = $1008FF1D;
  { Invoke Memo taking program  }
    XKB_KEY_XF86Memo = $1008FF1E;
  { Invoke To Do List program   }
    XKB_KEY_XF86ToDoList = $1008FF1F;
  { Invoke Calendar program     }
    XKB_KEY_XF86Calendar = $1008FF20;
  { Deep sleep the system       }
    XKB_KEY_XF86PowerDown = $1008FF21;
  { Adjust screen contrast      }
    XKB_KEY_XF86ContrastAdjust = $1008FF22;
  { Rocker switches exist up    }
    XKB_KEY_XF86RockerUp = $1008FF23;
  { and down                    }
    XKB_KEY_XF86RockerDown = $1008FF24;
  { and let you press them      }
    XKB_KEY_XF86RockerEnter = $1008FF25;
  { Some more "Internet" keyboard symbols  }
  { Like back on a browser      }
    XKB_KEY_XF86Back = $1008FF26;
  { Like forward on a browser   }
    XKB_KEY_XF86Forward = $1008FF27;
  { Stop current operation      }
    XKB_KEY_XF86Stop = $1008FF28;
  { Refresh the page            }
    XKB_KEY_XF86Refresh = $1008FF29;
  { Power off system entirely   }
    XKB_KEY_XF86PowerOff = $1008FF2A;
  { Wake up system from sleep   }
    XKB_KEY_XF86WakeUp = $1008FF2B;
  { Eject device (e.g. DVD)     }
    XKB_KEY_XF86Eject = $1008FF2C;
  { Invoke screensaver          }
    XKB_KEY_XF86ScreenSaver = $1008FF2D;
  { Invoke web browser          }
    XKB_KEY_XF86WWW = $1008FF2E;
  { Put system to sleep         }
    XKB_KEY_XF86Sleep = $1008FF2F;
  { Show favorite locations     }
    XKB_KEY_XF86Favorites = $1008FF30;
  { Pause audio playing         }
    XKB_KEY_XF86AudioPause = $1008FF31;
  { Launch media collection app  }
    XKB_KEY_XF86AudioMedia = $1008FF32;
  { Display "My Computer" window  }
    XKB_KEY_XF86MyComputer = $1008FF33;
  { Display vendor home web site  }
    XKB_KEY_XF86VendorHome = $1008FF34;
  { Light bulb keys exist        }
    XKB_KEY_XF86LightBulb = $1008FF35;
  { Display shopping web site    }
    XKB_KEY_XF86Shop = $1008FF36;
  { Show history of web surfing  }
    XKB_KEY_XF86History = $1008FF37;
  { Open selected URL            }
    XKB_KEY_XF86OpenURL = $1008FF38;
  { Add URL to favorites list    }
    XKB_KEY_XF86AddFavorite = $1008FF39;
  { Show "hot" links             }
    XKB_KEY_XF86HotLinks = $1008FF3A;
  { Invoke brightness adj. UI    }
    XKB_KEY_XF86BrightnessAdjust = $1008FF3B;
  { Display financial site       }
    XKB_KEY_XF86Finance = $1008FF3C;
  { Display user's community     }
    XKB_KEY_XF86Community = $1008FF3D;
  { "rewind" audio track         }
    XKB_KEY_XF86AudioRewind = $1008FF3E;
  { ???  }
    XKB_KEY_XF86BackForward = $1008FF3F;
  { Launch Application           }
    XKB_KEY_XF86Launch0 = $1008FF40;
  { Launch Application           }
    XKB_KEY_XF86Launch1 = $1008FF41;
  { Launch Application           }
    XKB_KEY_XF86Launch2 = $1008FF42;
  { Launch Application           }
    XKB_KEY_XF86Launch3 = $1008FF43;
  { Launch Application           }
    XKB_KEY_XF86Launch4 = $1008FF44;
  { Launch Application           }
    XKB_KEY_XF86Launch5 = $1008FF45;
  { Launch Application           }
    XKB_KEY_XF86Launch6 = $1008FF46;
  { Launch Application           }
    XKB_KEY_XF86Launch7 = $1008FF47;
  { Launch Application           }
    XKB_KEY_XF86Launch8 = $1008FF48;
  { Launch Application           }
    XKB_KEY_XF86Launch9 = $1008FF49;
  { Launch Application           }
    XKB_KEY_XF86LaunchA = $1008FF4A;
  { Launch Application           }
    XKB_KEY_XF86LaunchB = $1008FF4B;
  { Launch Application           }
    XKB_KEY_XF86LaunchC = $1008FF4C;
  { Launch Application           }
    XKB_KEY_XF86LaunchD = $1008FF4D;
  { Launch Application           }
    XKB_KEY_XF86LaunchE = $1008FF4E;
  { Launch Application           }
    XKB_KEY_XF86LaunchF = $1008FF4F;
  { switch to application, left  }
    XKB_KEY_XF86ApplicationLeft = $1008FF50;
  { switch to application, right }
    XKB_KEY_XF86ApplicationRight = $1008FF51;
  { Launch bookreader            }
    XKB_KEY_XF86Book = $1008FF52;
  { Launch CD/DVD player         }
    XKB_KEY_XF86CD = $1008FF53;
  { Launch Calculater            }
    XKB_KEY_XF86Calculater = $1008FF54;
  { Clear window, screen         }
    XKB_KEY_XF86Clear = $1008FF55;
  { Close window                 }
    XKB_KEY_XF86Close = $1008FF56;
  { Copy selection               }
    XKB_KEY_XF86Copy = $1008FF57;
  { Cut selection                }
    XKB_KEY_XF86Cut = $1008FF58;
  { Output switch key            }
    XKB_KEY_XF86Display = $1008FF59;
  { Launch DOS (emulation)       }
    XKB_KEY_XF86DOS = $1008FF5A;
  { Open documents window        }
    XKB_KEY_XF86Documents = $1008FF5B;
  { Launch spread sheet          }
    XKB_KEY_XF86Excel = $1008FF5C;
  { Launch file explorer         }
    XKB_KEY_XF86Explorer = $1008FF5D;
  { Launch game                  }
    XKB_KEY_XF86Game = $1008FF5E;
  { Go to URL                    }
    XKB_KEY_XF86Go = $1008FF5F;
  { Logitch iTouch- don't use    }
    XKB_KEY_XF86iTouch = $1008FF60;
  { Log off system               }
    XKB_KEY_XF86LogOff = $1008FF61;
  { ??                           }
    XKB_KEY_XF86Market = $1008FF62;
  { enter meeting in calendar    }
    XKB_KEY_XF86Meeting = $1008FF63;
  { distingush keyboard from PB  }
    XKB_KEY_XF86MenuKB = $1008FF65;
  { distinuish PB from keyboard  }
    XKB_KEY_XF86MenuPB = $1008FF66;
  { Favourites                   }
    XKB_KEY_XF86MySites = $1008FF67;
  { New (folder, document...     }
    XKB_KEY_XF86New = $1008FF68;
  { News                         }
    XKB_KEY_XF86News = $1008FF69;
  { Office home (old Staroffice) }
    XKB_KEY_XF86OfficeHome = $1008FF6A;
  { Open                         }
    XKB_KEY_XF86Open = $1008FF6B;
  { ??  }
    XKB_KEY_XF86Option = $1008FF6C;
  { Paste                        }
    XKB_KEY_XF86Paste = $1008FF6D;
  { Launch phone; dial number    }
    XKB_KEY_XF86Phone = $1008FF6E;
  { Compaq's Q - don't use       }
    XKB_KEY_XF86Q = $1008FF70;
  { Reply e.g., mail             }
    XKB_KEY_XF86Reply = $1008FF72;
  { Reload web page, file, etc.  }
    XKB_KEY_XF86Reload = $1008FF73;
  { Rotate windows e.g. xrandr   }
    XKB_KEY_XF86RotateWindows = $1008FF74;
  { don't use                    }
    XKB_KEY_XF86RotationPB = $1008FF75;
  { don't use                    }
    XKB_KEY_XF86RotationKB = $1008FF76;
  { Save (file, document, state  }
    XKB_KEY_XF86Save = $1008FF77;
  { Scroll window/contents up    }
    XKB_KEY_XF86ScrollUp = $1008FF78;
  { Scrool window/contentd down  }
    XKB_KEY_XF86ScrollDown = $1008FF79;
  { Use XKB mousekeys instead    }
    XKB_KEY_XF86ScrollClick = $1008FF7A;
  { Send mail, file, object      }
    XKB_KEY_XF86Send = $1008FF7B;
  { Spell checker                }
    XKB_KEY_XF86Spell = $1008FF7C;
  { Split window or screen       }
    XKB_KEY_XF86SplitScreen = $1008FF7D;
  { Get support (??)             }
    XKB_KEY_XF86Support = $1008FF7E;
  { Show tasks  }
    XKB_KEY_XF86TaskPane = $1008FF7F;
  { Launch terminal emulator     }
    XKB_KEY_XF86Terminal = $1008FF80;
  { toolbox of desktop/app.      }
    XKB_KEY_XF86Tools = $1008FF81;
  { ??  }
    XKB_KEY_XF86Travel = $1008FF82;
  { ??  }
    XKB_KEY_XF86UserPB = $1008FF84;
  { ??  }
    XKB_KEY_XF86User1KB = $1008FF85;
  { ??  }
    XKB_KEY_XF86User2KB = $1008FF86;
  { Launch video player        }
    XKB_KEY_XF86Video = $1008FF87;
  { button from a mouse wheel  }
    XKB_KEY_XF86WheelButton = $1008FF88;
  { Launch word processor      }
    XKB_KEY_XF86Word = $1008FF89;
    XKB_KEY_XF86Xfer = $1008FF8A;
  { zoom in view, map, etc.    }
    XKB_KEY_XF86ZoomIn = $1008FF8B;
  { zoom out view, map, etc.   }
    XKB_KEY_XF86ZoomOut = $1008FF8C;
  { mark yourself as away      }
    XKB_KEY_XF86Away = $1008FF8D;
  { as in instant messaging    }
    XKB_KEY_XF86Messenger = $1008FF8E;
  { Launch web camera app.     }
    XKB_KEY_XF86WebCam = $1008FF8F;
  { Forward in mail            }
    XKB_KEY_XF86MailForward = $1008FF90;
  { Show pictures              }
    XKB_KEY_XF86Pictures = $1008FF91;
  { Launch music application   }
    XKB_KEY_XF86Music = $1008FF92;
  { Display battery information  }
    XKB_KEY_XF86Battery = $1008FF93;
  { Enable/disable Bluetooth     }
    XKB_KEY_XF86Bluetooth = $1008FF94;
  { Enable/disable WLAN          }
    XKB_KEY_XF86WLAN = $1008FF95;
  { Enable/disable UWB	     }
    XKB_KEY_XF86UWB = $1008FF96;
  { fast-forward audio track     }
    XKB_KEY_XF86AudioForward = $1008FF97;
  { toggle repeat mode           }
    XKB_KEY_XF86AudioRepeat = $1008FF98;
  { toggle shuffle mode          }
    XKB_KEY_XF86AudioRandomPlay = $1008FF99;
  { cycle through subtitle       }
    XKB_KEY_XF86Subtitle = $1008FF9A;
  { cycle through audio tracks   }
    XKB_KEY_XF86AudioCycleTrack = $1008FF9B;
  { cycle through angles         }
    XKB_KEY_XF86CycleAngle = $1008FF9C;
  { video: go one frame back     }
    XKB_KEY_XF86FrameBack = $1008FF9D;
  { video: go one frame forward  }
    XKB_KEY_XF86FrameForward = $1008FF9E;
  { display, or shows an entry for time seeking  }
    XKB_KEY_XF86Time = $1008FF9F;
  { Select button on joypads and remotes  }
    XKB_KEY_XF86Select = $1008FFA0;
  { Show a view options/properties  }
    XKB_KEY_XF86View = $1008FFA1;
  { Go to a top-level menu in a video  }
    XKB_KEY_XF86TopMenu = $1008FFA2;
  { Red button                   }
    XKB_KEY_XF86Red = $1008FFA3;
  { Green button                 }
    XKB_KEY_XF86Green = $1008FFA4;
  { Yellow button                }
    XKB_KEY_XF86Yellow = $1008FFA5;
  { Blue button                  }
    XKB_KEY_XF86Blue = $1008FFA6;
  { Sleep to RAM                 }
    XKB_KEY_XF86Suspend = $1008FFA7;
  { Sleep to disk                }
    XKB_KEY_XF86Hibernate = $1008FFA8;
  { Toggle between touchpad/trackstick  }
    XKB_KEY_XF86TouchpadToggle = $1008FFA9;
  { The touchpad got switched on  }
    XKB_KEY_XF86TouchpadOn = $1008FFB0;
  { The touchpad got switched off  }
    XKB_KEY_XF86TouchpadOff = $1008FFB1;
  { Mute the Mic from the system  }
    XKB_KEY_XF86AudioMicMute = $1008FFB2;
  { Keys for special action keys (hot keys)  }
  { Virtual terminals on some operating systems  }
    XKB_KEY_XF86Switch_VT_1 = $1008FE01;
    XKB_KEY_XF86Switch_VT_2 = $1008FE02;
    XKB_KEY_XF86Switch_VT_3 = $1008FE03;
    XKB_KEY_XF86Switch_VT_4 = $1008FE04;
    XKB_KEY_XF86Switch_VT_5 = $1008FE05;
    XKB_KEY_XF86Switch_VT_6 = $1008FE06;
    XKB_KEY_XF86Switch_VT_7 = $1008FE07;
    XKB_KEY_XF86Switch_VT_8 = $1008FE08;
    XKB_KEY_XF86Switch_VT_9 = $1008FE09;
    XKB_KEY_XF86Switch_VT_10 = $1008FE0A;
    XKB_KEY_XF86Switch_VT_11 = $1008FE0B;
    XKB_KEY_XF86Switch_VT_12 = $1008FE0C;
  { force ungrab                }
    XKB_KEY_XF86Ungrab = $1008FE20;
  { kill application with grab  }
    XKB_KEY_XF86ClearGrab = $1008FE21;
  { next video mode available   }
    XKB_KEY_XF86Next_VMode = $1008FE22;
  { prev. video mode available  }
    XKB_KEY_XF86Prev_VMode = $1008FE23;
  { print window tree to log    }
    XKB_KEY_XF86LogWindowTree = $1008FE24;
  { print all active grabs to log  }
    XKB_KEY_XF86LogGrabInfo = $1008FE25;
  {
   * Copyright (c) 1991, Oracle and/or its affiliates. All rights reserved.
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
    }
  {***********************************************************

  Copyright 1991, 1998  The Open Group

  Permission to use, copy, modify, distribute, and sell this software and its
  documentation for any purpose is hereby granted without fee, provided that
  the above copyright notice appear in all copies and that both that
  copyright notice and this permission notice appear in supporting
  documentation.

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
  AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

  Except as contained in this notice, the name of The Open Group shall not be
  used in advertising or otherwise to promote the sale, use or other dealings
  in this Software without prior written authorization from The Open Group.

  ********************************************************** }
  {
   * Floating Accent
    }
    XKB_KEY_SunFA_Grave = $1005FF00;
    XKB_KEY_SunFA_Circum = $1005FF01;
    XKB_KEY_SunFA_Tilde = $1005FF02;
    XKB_KEY_SunFA_Acute = $1005FF03;
    XKB_KEY_SunFA_Diaeresis = $1005FF04;
    XKB_KEY_SunFA_Cedilla = $1005FF05;
  {
   * Miscellaneous Functions
    }
  { Labeled F11  }
    XKB_KEY_SunF36 = $1005FF10;
  { Labeled F12  }
    XKB_KEY_SunF37 = $1005FF11;
    XKB_KEY_SunSys_Req = $1005FF60;
  { Same as XK_Print  }
    XKB_KEY_SunPrint_Screen = $0000FF61;
  {
   * International & Multi-Key Character Composition
    }
  { Same as XK_Multi_key  }
    XKB_KEY_SunCompose = $0000FF20;
  { Same as XK_Mode_switch  }
    XKB_KEY_SunAltGraph = $0000FF7E;
  {
   * Cursor Control
    }
  { Same as XK_Prior  }
    XKB_KEY_SunPageUp = $0000FF55;
  { Same as XK_Next  }
    XKB_KEY_SunPageDown = $0000FF56;
  {
   * Open Look Functions
    }
  { Same as XK_Undo  }
    XKB_KEY_SunUndo = $0000FF65;
  { Same as XK_Redo  }
    XKB_KEY_SunAgain = $0000FF66;
  { Same as XK_Find  }
    XKB_KEY_SunFind = $0000FF68;
  { Same as XK_Cancel  }
    XKB_KEY_SunStop = $0000FF69;
    XKB_KEY_SunProps = $1005FF70;
    XKB_KEY_SunFront = $1005FF71;
    XKB_KEY_SunCopy = $1005FF72;
    XKB_KEY_SunOpen = $1005FF73;
    XKB_KEY_SunPaste = $1005FF74;
    XKB_KEY_SunCut = $1005FF75;
    XKB_KEY_SunPowerSwitch = $1005FF76;
    XKB_KEY_SunAudioLowerVolume = $1005FF77;
    XKB_KEY_SunAudioMute = $1005FF78;
    XKB_KEY_SunAudioRaiseVolume = $1005FF79;
    XKB_KEY_SunVideoDegauss = $1005FF7A;
    XKB_KEY_SunVideoLowerBrightness = $1005FF7B;
    XKB_KEY_SunVideoRaiseBrightness = $1005FF7C;
    XKB_KEY_SunPowerSwitchShift = $1005FF7D;
  {**********************************************************

  Copyright 1988, 1998  The Open Group

  Permission to use, copy, modify, distribute, and sell this software and its
  documentation for any purpose is hereby granted without fee, provided that
  the above copyright notice appear in all copies and that both that
  copyright notice and this permission notice appear in supporting
  documentation.

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
  AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

  Except as contained in this notice, the name of The Open Group shall not be
  used in advertising or otherwise to promote the sale, use or other dealings
  in this Software without prior written authorization from The Open Group.


  Copyright 1988 by Digital Equipment Corporation, Maynard, Massachusetts.

                          All Rights Reserved

  Permission to use, copy, modify, and distribute this software and its
  documentation for any purpose and without fee is hereby granted,
  provided that the above copyright notice appear in all copies and that
  both that copyright notice and this permission notice appear in
  supporting documentation, and that the name of Digital not be
  used in advertising or publicity pertaining to distribution of the
  software without specific, written prior permission.

  DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
  DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
  ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
  WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
  SOFTWARE.

  ***************************************************************** }
  {
   * DEC private keysyms
   * (29th bit set)
    }
  { two-key compose sequence initiators, chosen to map to Latin1 characters  }
    XKB_KEY_Dring_accent = $1000FEB0;
    XKB_KEY_Dcircumflex_accent = $1000FE5E;
    XKB_KEY_Dcedilla_accent = $1000FE2C;
    XKB_KEY_Dacute_accent = $1000FE27;
    XKB_KEY_Dgrave_accent = $1000FE60;
    XKB_KEY_Dtilde = $1000FE7E;
    XKB_KEY_Ddiaeresis = $1000FE22;
  { special keysym for LK2** "Remove" key on editing keypad  }
  { Remove  }
    XKB_KEY_DRemove = $1000FF00;
  {

  Copyright 1987, 1998  The Open Group

  Permission to use, copy, modify, distribute, and sell this software and its
  documentation for any purpose is hereby granted without fee, provided that
  the above copyright notice appear in all copies and that both that
  copyright notice and this permission notice appear in supporting
  documentation.

  The above copyright notice and this permission notice shall be included
  in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR
  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.

  Except as contained in this notice, the name of The Open Group shall
  not be used in advertising or otherwise to promote the sale, use or
  other dealings in this Software without prior written authorization
  from The Open Group.

  Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts,

                          All Rights Reserved

  Permission to use, copy, modify, and distribute this software and its
  documentation for any purpose and without fee is hereby granted,
  provided that the above copyright notice appear in all copies and that
  both that copyright notice and this permission notice appear in
  supporting documentation, and that the names of Hewlett Packard
  or Digital not be
  used in advertising or publicity pertaining to distribution of the
  software without specific, written prior permission.

  DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
  DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
  ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
  WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
  SOFTWARE.

  HEWLETT-PACKARD MAKES NO WARRANTY OF ANY KIND WITH REGARD
  TO THIS SOFWARE, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE.  Hewlett-Packard shall not be liable for errors
  contained herein or direct, indirect, special, incidental or
  consequential damages in connection with the furnishing,
  performance, or use of this material.

   }
    XKB_KEY_hpClearLine = $1000FF6F;
    XKB_KEY_hpInsertLine = $1000FF70;
    XKB_KEY_hpDeleteLine = $1000FF71;
    XKB_KEY_hpInsertChar = $1000FF72;
    XKB_KEY_hpDeleteChar = $1000FF73;
    XKB_KEY_hpBackTab = $1000FF74;
    XKB_KEY_hpKP_BackTab = $1000FF75;
    XKB_KEY_hpModelock1 = $1000FF48;
    XKB_KEY_hpModelock2 = $1000FF49;
    XKB_KEY_hpReset = $1000FF6C;
    XKB_KEY_hpSystem = $1000FF6D;
    XKB_KEY_hpUser = $1000FF6E;
    XKB_KEY_hpmute_acute = $100000A8;
    XKB_KEY_hpmute_grave = $100000A9;
    XKB_KEY_hpmute_asciicircum = $100000AA;
    XKB_KEY_hpmute_diaeresis = $100000AB;
    XKB_KEY_hpmute_asciitilde = $100000AC;
    XKB_KEY_hplira = $100000AF;
    XKB_KEY_hpguilder = $100000BE;
    XKB_KEY_hpYdiaeresis = $100000EE;
    XKB_KEY_hpIO = $100000EE;
    XKB_KEY_hplongminus = $100000F6;
    XKB_KEY_hpblock = $100000FC;
    XKB_KEY_osfCopy = $1004FF02;
    XKB_KEY_osfCut = $1004FF03;
    XKB_KEY_osfPaste = $1004FF04;
    XKB_KEY_osfBackTab = $1004FF07;
    XKB_KEY_osfBackSpace = $1004FF08;
    XKB_KEY_osfClear = $1004FF0B;
    XKB_KEY_osfEscape = $1004FF1B;
    XKB_KEY_osfAddMode = $1004FF31;
    XKB_KEY_osfPrimaryPaste = $1004FF32;
    XKB_KEY_osfQuickPaste = $1004FF33;
    XKB_KEY_osfPageLeft = $1004FF40;
    XKB_KEY_osfPageUp = $1004FF41;
    XKB_KEY_osfPageDown = $1004FF42;
    XKB_KEY_osfPageRight = $1004FF43;
    XKB_KEY_osfActivate = $1004FF44;
    XKB_KEY_osfMenuBar = $1004FF45;
    XKB_KEY_osfLeft = $1004FF51;
    XKB_KEY_osfUp = $1004FF52;
    XKB_KEY_osfRight = $1004FF53;
    XKB_KEY_osfDown = $1004FF54;
    XKB_KEY_osfEndLine = $1004FF57;
    XKB_KEY_osfBeginLine = $1004FF58;
    XKB_KEY_osfEndData = $1004FF59;
    XKB_KEY_osfBeginData = $1004FF5A;
    XKB_KEY_osfPrevMenu = $1004FF5B;
    XKB_KEY_osfNextMenu = $1004FF5C;
    XKB_KEY_osfPrevField = $1004FF5D;
    XKB_KEY_osfNextField = $1004FF5E;
    XKB_KEY_osfSelect = $1004FF60;
    XKB_KEY_osfInsert = $1004FF63;
    XKB_KEY_osfUndo = $1004FF65;
    XKB_KEY_osfMenu = $1004FF67;
    XKB_KEY_osfCancel = $1004FF69;
    XKB_KEY_osfHelp = $1004FF6A;
    XKB_KEY_osfSelectAll = $1004FF71;
    XKB_KEY_osfDeselectAll = $1004FF72;
    XKB_KEY_osfReselect = $1004FF73;
    XKB_KEY_osfExtend = $1004FF74;
    XKB_KEY_osfRestore = $1004FF78;
    XKB_KEY_osfDelete = $1004FFFF;
  {*************************************************************
   * The use of the following macros is deprecated.
   * They are listed below only for backwards compatibility.
    }
    XKB_KEY_Reset = $1000FF6C;
    XKB_KEY_System = $1000FF6D;
    XKB_KEY_User = $1000FF6E;
    XKB_KEY_ClearLine = $1000FF6F;
    XKB_KEY_InsertLine = $1000FF70;
    XKB_KEY_DeleteLine = $1000FF71;
    XKB_KEY_InsertChar = $1000FF72;
    XKB_KEY_DeleteChar = $1000FF73;
    XKB_KEY_BackTab = $1000FF74;
    XKB_KEY_KP_BackTab = $1000FF75;
    XKB_KEY_Ext16bit_L = $1000FF76;
    XKB_KEY_Ext16bit_R = $1000FF77;
    XKB_KEY_mute_acute = $100000a8;
    XKB_KEY_mute_grave = $100000a9;
    XKB_KEY_mute_asciicircum = $100000aa;
    XKB_KEY_mute_diaeresis = $100000ab;
    XKB_KEY_mute_asciitilde = $100000ac;
    XKB_KEY_lira = $100000af;
    XKB_KEY_guilder = $100000be;
    XKB_KEY_IO = $100000ee;
    XKB_KEY_longminus = $100000f6;
    XKB_KEY_block = $100000fc;

