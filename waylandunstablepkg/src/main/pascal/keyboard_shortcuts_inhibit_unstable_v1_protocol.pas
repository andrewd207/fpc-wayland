unit keyboard_shortcuts_inhibit_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_keyboard_shortcuts_inhibit_manager_v1 = Pointer;
  Pwp_keyboard_shortcuts_inhibitor_v1 = Pointer;
const
  WP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_ERROR_ALREADY_INHIBITED = 0; // the shortcuts are already inhibited for this surface

type
  Pwp_keyboard_shortcuts_inhibit_manager_v1_listener = ^Twp_keyboard_shortcuts_inhibit_manager_v1_listener;
  Twp_keyboard_shortcuts_inhibit_manager_v1_listener = record
  end;

  Pwp_keyboard_shortcuts_inhibitor_v1_listener = ^Twp_keyboard_shortcuts_inhibitor_v1_listener;
  Twp_keyboard_shortcuts_inhibitor_v1_listener = record
    active : procedure(data: Pointer; AWpKeyboardShortcutsInhibitorV1: Pwp_keyboard_shortcuts_inhibitor_v1); cdecl;
    inactive : procedure(data: Pointer; AWpKeyboardShortcutsInhibitorV1: Pwp_keyboard_shortcuts_inhibitor_v1); cdecl;
  end;



  TWpKeyboardShortcutsInhibitManagerV1 = class;
  TWpKeyboardShortcutsInhibitorV1 = class;


  IWpKeyboardShortcutsInhibitManagerV1Listener = interface
  ['IWpKeyboardShortcutsInhibitManagerV1Listener']
  end;

  IWpKeyboardShortcutsInhibitorV1Listener = interface
  ['IWpKeyboardShortcutsInhibitorV1Listener']
    procedure wp_keyboard_shortcuts_inhibitor_v1_active(AWpKeyboardShortcutsInhibitorV1: TWpKeyboardShortcutsInhibitorV1);
    procedure wp_keyboard_shortcuts_inhibitor_v1_inactive(AWpKeyboardShortcutsInhibitorV1: TWpKeyboardShortcutsInhibitorV1);
  end;




  TWpKeyboardShortcutsInhibitManagerV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _INHIBIT_SHORTCUTS = 1;
  public
    destructor Destroy; override;
    function InhibitShortcuts(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpKeyboardShortcutsInhibitorV1}): TWpKeyboardShortcutsInhibitorV1;
    function AddListener(AIntf: IWpKeyboardShortcutsInhibitManagerV1Listener): LongInt;
  end;

  TWpKeyboardShortcutsInhibitorV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpKeyboardShortcutsInhibitorV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_keyboard_shortcuts_inhibit_manager_v1_interface: Twl_interface;
  WP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_INTERFACE_NAME: String = 'zwp_keyboard_shortcuts_inhibit_manager_v1';
  wp_keyboard_shortcuts_inhibitor_v1_interface: Twl_interface;
  WP_KEYBOARD_SHORTCUTS_INHIBITOR_V1_INTERFACE_NAME: String = 'zwp_keyboard_shortcuts_inhibitor_v1';



implementation

var
  vIntf_wp_keyboard_shortcuts_inhibit_manager_v1_Listener: Twp_keyboard_shortcuts_inhibit_manager_v1_listener;
  vIntf_wp_keyboard_shortcuts_inhibitor_v1_Listener: Twp_keyboard_shortcuts_inhibitor_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpKeyboardShortcutsInhibitManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpKeyboardShortcutsInhibitManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpKeyboardShortcutsInhibitManagerV1.InhibitShortcuts(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpKeyboardShortcutsInhibitorV1}): TWpKeyboardShortcutsInhibitorV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _INHIBIT_SHORTCUTS, @wp_keyboard_shortcuts_inhibitor_v1_interface, nil, ASurface.Proxy, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpKeyboardShortcutsInhibitorV1;
  Result := TWpKeyboardShortcutsInhibitorV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpKeyboardShortcutsInhibitorV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpKeyboardShortcutsInhibitorV1]);
end;

function TWpKeyboardShortcutsInhibitManagerV1.AddListener(AIntf: IWpKeyboardShortcutsInhibitManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_keyboard_shortcuts_inhibit_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpKeyboardShortcutsInhibitorV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpKeyboardShortcutsInhibitorV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpKeyboardShortcutsInhibitorV1.AddListener(AIntf: IWpKeyboardShortcutsInhibitorV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_keyboard_shortcuts_inhibitor_v1_Listener, @FUserDataRec);
end;




procedure wp_keyboard_shortcuts_inhibitor_v1_active_Intf(AData: PWLUserData; Awp_keyboard_shortcuts_inhibitor_v1: Pwp_keyboard_shortcuts_inhibitor_v1); cdecl;
var
  AIntf: IWpKeyboardShortcutsInhibitorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpKeyboardShortcutsInhibitorV1Listener(AData^.ListenerUserData);
  AIntf.wp_keyboard_shortcuts_inhibitor_v1_active(TWpKeyboardShortcutsInhibitorV1(AData^.PascalObject));
end;

procedure wp_keyboard_shortcuts_inhibitor_v1_inactive_Intf(AData: PWLUserData; Awp_keyboard_shortcuts_inhibitor_v1: Pwp_keyboard_shortcuts_inhibitor_v1); cdecl;
var
  AIntf: IWpKeyboardShortcutsInhibitorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpKeyboardShortcutsInhibitorV1Listener(AData^.ListenerUserData);
  AIntf.wp_keyboard_shortcuts_inhibitor_v1_inactive(TWpKeyboardShortcutsInhibitorV1(AData^.PascalObject));
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
    (@wp_keyboard_shortcuts_inhibitor_v1_interface),
    (@wl_surface_interface),
    (@wl_seat_interface)
  );

  wp_keyboard_shortcuts_inhibit_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'inhibit_shortcuts'; signature: 'noo'; types: @pInterfaces[8])
  );
  wp_keyboard_shortcuts_inhibitor_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_keyboard_shortcuts_inhibitor_v1_events: array[0..1] of Twl_message = (
    (name: 'active'; signature: ''; types: @pInterfaces[0]),
    (name: 'inactive'; signature: ''; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_wp_keyboard_shortcuts_inhibitor_v1_Listener.active) := @wp_keyboard_shortcuts_inhibitor_v1_active_Intf;
  Pointer(vIntf_wp_keyboard_shortcuts_inhibitor_v1_Listener.inactive) := @wp_keyboard_shortcuts_inhibitor_v1_inactive_Intf;


  wp_keyboard_shortcuts_inhibit_manager_v1_interface.name := PChar(WP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_INTERFACE_NAME);
  wp_keyboard_shortcuts_inhibit_manager_v1_interface.version := 1;
  wp_keyboard_shortcuts_inhibit_manager_v1_interface.method_count := 2;
  wp_keyboard_shortcuts_inhibit_manager_v1_interface.methods := @wp_keyboard_shortcuts_inhibit_manager_v1_requests;
  wp_keyboard_shortcuts_inhibit_manager_v1_interface.event_count := 0;
  wp_keyboard_shortcuts_inhibit_manager_v1_interface.events := nil;

  wp_keyboard_shortcuts_inhibitor_v1_interface.name := PChar(WP_KEYBOARD_SHORTCUTS_INHIBITOR_V1_INTERFACE_NAME);
  wp_keyboard_shortcuts_inhibitor_v1_interface.version := 1;
  wp_keyboard_shortcuts_inhibitor_v1_interface.method_count := 1;
  wp_keyboard_shortcuts_inhibitor_v1_interface.methods := @wp_keyboard_shortcuts_inhibitor_v1_requests;
  wp_keyboard_shortcuts_inhibitor_v1_interface.event_count := 2;
  wp_keyboard_shortcuts_inhibitor_v1_interface.events := @wp_keyboard_shortcuts_inhibitor_v1_events;

end;

end.
