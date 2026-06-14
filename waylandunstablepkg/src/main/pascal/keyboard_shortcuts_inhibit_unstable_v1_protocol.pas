unit keyboard_shortcuts_inhibit_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_keyboard_shortcuts_inhibit_manager_v1 = Pointer;
  Pzwp_keyboard_shortcuts_inhibitor_v1 = Pointer;
const
  ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_ERROR_ALREADY_INHIBITED = 0; // the shortcuts are already inhibited for this surface

type
  Pzwp_keyboard_shortcuts_inhibit_manager_v1_listener = ^Tzwp_keyboard_shortcuts_inhibit_manager_v1_listener;
  Tzwp_keyboard_shortcuts_inhibit_manager_v1_listener = record
  end;

  Pzwp_keyboard_shortcuts_inhibitor_v1_listener = ^Tzwp_keyboard_shortcuts_inhibitor_v1_listener;
  Tzwp_keyboard_shortcuts_inhibitor_v1_listener = record
    active : procedure(data: Pointer; AZwpKeyboardShortcutsInhibitorV1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
    inactive : procedure(data: Pointer; AZwpKeyboardShortcutsInhibitorV1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
  end;



  TZwpKeyboardShortcutsInhibitManagerV1 = class;
  TZwpKeyboardShortcutsInhibitorV1 = class;


  IZwpKeyboardShortcutsInhibitManagerV1Listener = interface
  ['IZwpKeyboardShortcutsInhibitManagerV1Listener']
  end;

  IZwpKeyboardShortcutsInhibitorV1Listener = interface
  ['IZwpKeyboardShortcutsInhibitorV1Listener']
    procedure zwp_keyboard_shortcuts_inhibitor_v1_active(AZwpKeyboardShortcutsInhibitorV1: TZwpKeyboardShortcutsInhibitorV1);
    procedure zwp_keyboard_shortcuts_inhibitor_v1_inactive(AZwpKeyboardShortcutsInhibitorV1: TZwpKeyboardShortcutsInhibitorV1);
  end;




  TZwpKeyboardShortcutsInhibitManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _INHIBIT_SHORTCUTS = 1;
  public
    destructor Destroy; override;
    function InhibitShortcuts(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpKeyboardShortcutsInhibitorV1}): TZwpKeyboardShortcutsInhibitorV1;
    function AddListener(AIntf: IZwpKeyboardShortcutsInhibitManagerV1Listener): LongInt;
  end;

  TZwpKeyboardShortcutsInhibitorV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpKeyboardShortcutsInhibitorV1Listener): LongInt;
  end;






var
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface: Twl_interface;
  zwp_keyboard_shortcuts_inhibitor_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_keyboard_shortcuts_inhibit_manager_v1_Listener: Tzwp_keyboard_shortcuts_inhibit_manager_v1_listener;
  vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener: Tzwp_keyboard_shortcuts_inhibitor_v1_listener;



destructor TZwpKeyboardShortcutsInhibitManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpKeyboardShortcutsInhibitManagerV1.InhibitShortcuts(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpKeyboardShortcutsInhibitorV1}): TZwpKeyboardShortcutsInhibitorV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _INHIBIT_SHORTCUTS, @zwp_keyboard_shortcuts_inhibitor_v1_interface, nil, ASurface.Proxy, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpKeyboardShortcutsInhibitorV1;
  Result := TZwpKeyboardShortcutsInhibitorV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpKeyboardShortcutsInhibitorV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpKeyboardShortcutsInhibitorV1]);
end;

function TZwpKeyboardShortcutsInhibitManagerV1.AddListener(AIntf: IZwpKeyboardShortcutsInhibitManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_keyboard_shortcuts_inhibit_manager_v1_Listener, @FUserDataRec);
end;
destructor TZwpKeyboardShortcutsInhibitorV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpKeyboardShortcutsInhibitorV1.AddListener(AIntf: IZwpKeyboardShortcutsInhibitorV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener, @FUserDataRec);
end;




procedure zwp_keyboard_shortcuts_inhibitor_v1_active_Intf(AData: PWLUserData; Azwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
var
  AIntf: IZwpKeyboardShortcutsInhibitorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpKeyboardShortcutsInhibitorV1Listener(AData^.ListenerUserData);
  AIntf.zwp_keyboard_shortcuts_inhibitor_v1_active(TZwpKeyboardShortcutsInhibitorV1(AData^.PascalObject));
end;

procedure zwp_keyboard_shortcuts_inhibitor_v1_inactive_Intf(AData: PWLUserData; Azwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
var
  AIntf: IZwpKeyboardShortcutsInhibitorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpKeyboardShortcutsInhibitorV1Listener(AData^.ListenerUserData);
  AIntf.zwp_keyboard_shortcuts_inhibitor_v1_inactive(TZwpKeyboardShortcutsInhibitorV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..10] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zwp_keyboard_shortcuts_inhibitor_v1_interface),
    (@wl_surface_interface),
    (@wl_seat_interface)
  );

  zwp_keyboard_shortcuts_inhibit_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'inhibit_shortcuts'; signature: 'noo'; types: @pInterfaces[8])
  );
  zwp_keyboard_shortcuts_inhibitor_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_keyboard_shortcuts_inhibitor_v1_events: array[0..1] of Twl_message = (
    (name: 'active'; signature: ''; types: @pInterfaces[0]),
    (name: 'inactive'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener.active) := @zwp_keyboard_shortcuts_inhibitor_v1_active_Intf;
  Pointer(vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener.inactive) := @zwp_keyboard_shortcuts_inhibitor_v1_inactive_Intf;


  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.name := 'zwp_keyboard_shortcuts_inhibit_manager_v1';
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.version := 1;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.method_count := 2;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.methods := @zwp_keyboard_shortcuts_inhibit_manager_v1_requests;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.event_count := 0;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.events := nil;

  zwp_keyboard_shortcuts_inhibitor_v1_interface.name := 'zwp_keyboard_shortcuts_inhibitor_v1';
  zwp_keyboard_shortcuts_inhibitor_v1_interface.version := 1;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.method_count := 1;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.methods := @zwp_keyboard_shortcuts_inhibitor_v1_requests;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.event_count := 2;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.events := @zwp_keyboard_shortcuts_inhibitor_v1_events;

end.
