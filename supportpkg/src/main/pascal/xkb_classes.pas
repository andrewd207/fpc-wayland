unit xkb_classes;
{$mode objfpc}{$h+}

interface

uses
  Classes, sysutils,libxkbcommon, BaseUnix;

type

  { TXKBHelper }

  TXKBHelper = class
  public
    class var ShiftKeys: array[TShiftStateEnum] of DWord;
  private
    class var Inited: Boolean;
  private
    FContext: Pxkb_context;
    FKeymap: Pxkb_keymap;
    FLastSym: xkb_keysym_t;
    FState: Pxkb_state;
    FComposeTable: Pxkb_compose_table;
    FComposeState: Pxkb_compose_state;
    FShiftState: TShiftState;
    function GetLocale: String;
  public
    constructor Create(Afd: LongInt; ASize: Integer);
    procedure UpdateKeyState(AModsDepressed, AModsLatched, AModsLocked, AGroup: LongWord);
    function ModState: TShiftState;
    function Feed(AKeySym: xkb_keysym_t): xkb_compose_feed_result;
    procedure ResetCompose;
    function LookupSym: xkb_keysym_t;
    function LookupUtf8: UTF8String;
    function ComposeStatus: xkb_compose_status;
    function KeySymToUtf8(AKeySym: xkb_keysym_t): UTF8String;
    function KeyCodeName(AKeyCode: xkb_keycode_t): String;
    function KeyGetSyms(AKey: LongWord; ASyms: PPxkb_keysym_t): Integer;
    property LastSym: xkb_keysym_t read FLastSym;

  end;

implementation


{ TXKBHelper }

function TXKBHelper.GetLocale: String;
begin
  Result := GetEnvironmentVariable('LC_ALL');
  if Result = '' then
    Result := GetEnvironmentVariable('LC_CTYPE');
  if Result = '' then
    Result := GetEnvironmentVariable('LANG');
  if Result = '' then
    Result := 'C';
end;

constructor TXKBHelper.Create(Afd: LongInt; ASize: Integer);
var
  lMemMap: Pointer;
  r: DWord;
begin
  lMemMap:= Fpmmap(nil, ASize, PROT_READ, MAP_SHARED, Afd, 0); //
  if lMemMap = MAP_FAILED then
  begin
    exit;
  end;
  FContext := xkb_context_new(XKB_CONTEXT_NO_FLAGS);
  FKeymap := xkb_keymap_new_from_string(FContext, lMemMap, XKB_KEYMAP_FORMAT_TEXT_V1, XKB_KEYMAP_COMPILE_NO_FLAGS);
  Fpmunmap(lMemMap, ASize);
  FState:=xkb_state_new(FKeymap);
  FComposeTable := xkb_compose_table_new_from_locale(FContext, Pchar(GetLocale), XKB_COMPOSE_COMPILE_NO_FLAGS);
  FComposeState := xkb_compose_state_new(FComposeTable, XKB_COMPOSE_STATE_NO_FLAGS);

  if not Inited then
  begin
    r := xkb_keymap_mod_get_index(FKeymap, 'Shift');
    ShiftKeys[ssShift] := 1 shl r;
    r := xkb_keymap_mod_get_index(FKeymap, 'Control');
    ShiftKeys[ssCtrl] := 1 shl r;
    r := xkb_keymap_mod_get_index(FKeymap, 'Mod1');
    ShiftKeys[ssAlt] := 1 shl r;
    r := xkb_keymap_mod_get_index(FKeymap, 'Mod4');
    ShiftKeys[ssSuper] := 1 shl r;
    r := xkb_keymap_mod_get_index(FKeymap, 'Mod2');
    ShiftKeys[ssNum] := 1 shl r;
    r := xkb_keymap_mod_get_index(FKeymap, 'Lock');
    ShiftKeys[ssCaps] := 1 shl r;
    Inited:=True;
  end;
end;

procedure TXKBHelper.UpdateKeyState(AModsDepressed, AModsLatched, AModsLocked,
  AGroup: LongWord);
var
  lMask: DWord;
  s: TShiftStateEnum;
begin
  xkb_state_update_mask(FState, AModsDepressed, AModsLatched, AmodsLocked, 0,0, AGroup);
  lMask := xkb_state_serialize_mods(FState, xkb_state_component(
    DWORD(XKB_STATE_MODS_DEPRESSED) or DWORD(XKB_STATE_LAYOUT_DEPRESSED) or
    DWORD(XKB_STATE_MODS_LATCHED)   or DWORD(XKB_STATE_LAYOUT_LATCHED)
    or DWORD(XKB_STATE_MODS_LOCKED)   or DWORD(XKB_STATE_LAYOUT_LOCKED)
    ));

  for s in TShiftState do
  begin
    if ShiftKeys[s] = 0 then
      continue;
    if ShiftKeys[s] and lMask <> 0 then
    begin
      Include(FShiftState, s);
      //WriteLn('Added :', s);
    end
    else
    begin
      Exclude(FShiftState, s);

      //WriteLn('Removed :', s);
    end;
  end;

end;

function TXKBHelper.ModState: TShiftState;
begin
  REsult := FShiftState;
end;

function TXKBHelper.Feed(AKeySym: xkb_keysym_t): xkb_compose_feed_result;
begin
  Result := xkb_compose_state_feed(FComposeState, AKeySym);
  FLastSym := AKeySym;
end;

procedure TXKBHelper.ResetCompose;
begin
  xkb_compose_state_reset(FComposeState);
end;

function TXKBHelper.LookupSym: xkb_keysym_t;
begin
  // state is  *not* XKB_COMPOSE_COMPOSED then it will return XKB_KEY_NoSymbol;
  Result := xkb_compose_state_get_one_sym(FComposeState);
end;

function TXKBHelper.LookupUtf8: UTF8String;
var
  lSize: Integer;
begin
  SetLength(Result, 128);
  lSize := xkb_compose_state_get_utf8(FComposeState, @Result[1], Length(Result));
  SetLength(Result, lSize);
end;

function TXKBHelper.ComposeStatus: xkb_compose_status;
begin
  Result := xkb_compose_state_get_status(FComposeState);
end;

function TXKBHelper.KeySymToUtf8(AKeySym: xkb_keysym_t): UTF8String;
var
  lSize: Integer;
begin
  repeat
    SetLength(Result, Length(Result)+4);
    lSize :=  xkb_keysym_to_utf8(AKeySym, @Result[1], Length(Result));
    if lSize = 0 then
      Exit(''); // invalid string
  until lSize > 0;
  SetLength(Result, lSize);
end;

function TXKBHelper.KeyCodeName(AKeyCode: xkb_keycode_t): String;
begin
  Result := xkb_keymap_key_get_name(FKeymap, AKeyCode);
end;

function TXKBHelper.KeyGetSyms(AKey: LongWord; ASyms: PPxkb_keysym_t): Integer;
begin
  Result := xkb_state_key_get_syms(FState, AKey, ASyms);
end;

end.
