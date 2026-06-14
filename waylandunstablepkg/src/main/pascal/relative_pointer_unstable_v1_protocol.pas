unit relative_pointer_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_relative_pointer_manager_v1 = Pointer;
  Pwp_relative_pointer_v1 = Pointer;
  Pwp_relative_pointer_manager_v1_listener = ^Twp_relative_pointer_manager_v1_listener;
  Twp_relative_pointer_manager_v1_listener = record
  end;

  Pwp_relative_pointer_v1_listener = ^Twp_relative_pointer_v1_listener;
  Twp_relative_pointer_v1_listener = record
    relative_motion : procedure(data: Pointer; AWpRelativePointerV1: Pwp_relative_pointer_v1; AUtimeHi: DWord; AUtimeLo: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; ADxUnaccel: Longint{24.8}; ADyUnaccel: Longint{24.8}); cdecl;
  end;



  TWpRelativePointerManagerV1 = class;
  TWpRelativePointerV1 = class;


  IWpRelativePointerManagerV1Listener = interface
  ['IWpRelativePointerManagerV1Listener']
  end;

  IWpRelativePointerV1Listener = interface
  ['IWpRelativePointerV1Listener']
    procedure wp_relative_pointer_v1_relative_motion(AWpRelativePointerV1: TWpRelativePointerV1; AUtimeHi: DWord; AUtimeLo: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; ADxUnaccel: Longint{24.8}; ADyUnaccel: Longint{24.8});
  end;




  TWpRelativePointerManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_RELATIVE_POINTER = 1;
  public
    destructor Destroy; override;
    function GetRelativePointer(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpRelativePointerV1}): TWpRelativePointerV1;
    function AddListener(AIntf: IWpRelativePointerManagerV1Listener): LongInt;
  end;

  TWpRelativePointerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpRelativePointerV1Listener): LongInt;
  end;






var
  wp_relative_pointer_manager_v1_interface: Twl_interface;
  WP_RELATIVE_POINTER_MANAGER_V1_INTERFACE_NAME: String = 'zwp_relative_pointer_manager_v1';
  wp_relative_pointer_v1_interface: Twl_interface;
  WP_RELATIVE_POINTER_V1_INTERFACE_NAME: String = 'zwp_relative_pointer_v1';



implementation

var
  vIntf_wp_relative_pointer_manager_v1_Listener: Twp_relative_pointer_manager_v1_listener;
  vIntf_wp_relative_pointer_v1_Listener: Twp_relative_pointer_v1_listener;



destructor TWpRelativePointerManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpRelativePointerManagerV1.GetRelativePointer(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpRelativePointerV1}): TWpRelativePointerV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_RELATIVE_POINTER, @wp_relative_pointer_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpRelativePointerV1;
  Result := TWpRelativePointerV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpRelativePointerV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpRelativePointerV1]);
end;

function TWpRelativePointerManagerV1.AddListener(AIntf: IWpRelativePointerManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_relative_pointer_manager_v1_Listener, @FUserDataRec);
end;
destructor TWpRelativePointerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpRelativePointerV1.AddListener(AIntf: IWpRelativePointerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_relative_pointer_v1_Listener, @FUserDataRec);
end;




procedure wp_relative_pointer_v1_relative_motion_Intf(AData: PWLUserData; Awp_relative_pointer_v1: Pwp_relative_pointer_v1; AUtimeHi: DWord; AUtimeLo: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; ADxUnaccel: Longint{24.8}; ADyUnaccel: Longint{24.8}); cdecl;
var
  AIntf: IWpRelativePointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpRelativePointerV1Listener(AData^.ListenerUserData);
  AIntf.wp_relative_pointer_v1_relative_motion(TWpRelativePointerV1(AData^.PascalObject), AUtimeHi, AUtimeLo, ADx, ADy, ADxUnaccel, ADyUnaccel);
end;



const
  pInterfaces: array[0..9] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_relative_pointer_v1_interface),
    (@wl_pointer_interface)
  );

  wp_relative_pointer_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_relative_pointer'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_relative_pointer_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_relative_pointer_v1_events: array[0..0] of Twl_message = (
    (name: 'relative_motion'; signature: 'uuffff'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_wp_relative_pointer_v1_Listener.relative_motion) := @wp_relative_pointer_v1_relative_motion_Intf;


  wp_relative_pointer_manager_v1_interface.name := PChar(WP_RELATIVE_POINTER_MANAGER_V1_INTERFACE_NAME);
  wp_relative_pointer_manager_v1_interface.version := 1;
  wp_relative_pointer_manager_v1_interface.method_count := 2;
  wp_relative_pointer_manager_v1_interface.methods := @wp_relative_pointer_manager_v1_requests;
  wp_relative_pointer_manager_v1_interface.event_count := 0;
  wp_relative_pointer_manager_v1_interface.events := nil;

  wp_relative_pointer_v1_interface.name := PChar(WP_RELATIVE_POINTER_V1_INTERFACE_NAME);
  wp_relative_pointer_v1_interface.version := 1;
  wp_relative_pointer_v1_interface.method_count := 1;
  wp_relative_pointer_v1_interface.methods := @wp_relative_pointer_v1_requests;
  wp_relative_pointer_v1_interface.event_count := 1;
  wp_relative_pointer_v1_interface.events := @wp_relative_pointer_v1_events;

end.
