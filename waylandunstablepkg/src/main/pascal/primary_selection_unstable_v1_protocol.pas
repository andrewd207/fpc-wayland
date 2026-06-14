unit primary_selection_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_primary_selection_device_manager_v1 = Pointer;
  Pwp_primary_selection_device_v1 = Pointer;
  Pwp_primary_selection_offer_v1 = Pointer;
  Pwp_primary_selection_source_v1 = Pointer;
  Pwp_primary_selection_device_manager_v1_listener = ^Twp_primary_selection_device_manager_v1_listener;
  Twp_primary_selection_device_manager_v1_listener = record
  end;

  Pwp_primary_selection_device_v1_listener = ^Twp_primary_selection_device_v1_listener;
  Twp_primary_selection_device_v1_listener = record
    data_offer : procedure(data: Pointer; AWpPrimarySelectionDeviceV1: Pwp_primary_selection_device_v1; AOffer: Pwp_primary_selection_offer_v1); cdecl;
    selection : procedure(data: Pointer; AWpPrimarySelectionDeviceV1: Pwp_primary_selection_device_v1; AId: Pwp_primary_selection_offer_v1); cdecl;
  end;

  Pwp_primary_selection_offer_v1_listener = ^Twp_primary_selection_offer_v1_listener;
  Twp_primary_selection_offer_v1_listener = record
    offer : procedure(data: Pointer; AWpPrimarySelectionOfferV1: Pwp_primary_selection_offer_v1; AMimeType: Pchar); cdecl;
  end;

  Pwp_primary_selection_source_v1_listener = ^Twp_primary_selection_source_v1_listener;
  Twp_primary_selection_source_v1_listener = record
    send : procedure(data: Pointer; AWpPrimarySelectionSourceV1: Pwp_primary_selection_source_v1; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
    cancelled : procedure(data: Pointer; AWpPrimarySelectionSourceV1: Pwp_primary_selection_source_v1); cdecl;
  end;



  TWpPrimarySelectionDeviceManagerV1 = class;
  TWpPrimarySelectionDeviceV1 = class;
  TWpPrimarySelectionOfferV1 = class;
  TWpPrimarySelectionSourceV1 = class;


  IWpPrimarySelectionDeviceManagerV1Listener = interface
  ['IWpPrimarySelectionDeviceManagerV1Listener']
  end;

  IWpPrimarySelectionDeviceV1Listener = interface
  ['IWpPrimarySelectionDeviceV1Listener']
    procedure wp_primary_selection_device_v1_data_offer(AWpPrimarySelectionDeviceV1: TWpPrimarySelectionDeviceV1; AOffer: TWpPrimarySelectionOfferV1);
    procedure wp_primary_selection_device_v1_selection(AWpPrimarySelectionDeviceV1: TWpPrimarySelectionDeviceV1; AId: TWpPrimarySelectionOfferV1);
  end;

  IWpPrimarySelectionOfferV1Listener = interface
  ['IWpPrimarySelectionOfferV1Listener']
    procedure wp_primary_selection_offer_v1_offer(AWpPrimarySelectionOfferV1: TWpPrimarySelectionOfferV1; AMimeType: String);
  end;

  IWpPrimarySelectionSourceV1Listener = interface
  ['IWpPrimarySelectionSourceV1Listener']
    procedure wp_primary_selection_source_v1_send(AWpPrimarySelectionSourceV1: TWpPrimarySelectionSourceV1; AMimeType: String; AFd: LongInt{fd});
    procedure wp_primary_selection_source_v1_cancelled(AWpPrimarySelectionSourceV1: TWpPrimarySelectionSourceV1);
  end;




  TWpPrimarySelectionDeviceManagerV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE_SOURCE = 0;
    const _GET_DEVICE = 1;
    const _DESTROY = 2;
  public
    function CreateSource(AProxyClass: TWLProxyObjectClass = nil {TWpPrimarySelectionSourceV1}): TWpPrimarySelectionSourceV1;
    function GetDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpPrimarySelectionDeviceV1}): TWpPrimarySelectionDeviceV1;
    destructor Destroy; override;
    function AddListener(AIntf: IWpPrimarySelectionDeviceManagerV1Listener): LongInt;
  end;

  TWpPrimarySelectionDeviceV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_SELECTION = 0;
    const _DESTROY = 1;
  public
    procedure SetSelection(ASource: TWpPrimarySelectionSourceV1; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWpPrimarySelectionDeviceV1Listener): LongInt;
  end;

  TWpPrimarySelectionOfferV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _RECEIVE = 0;
    const _DESTROY = 1;
  public
    procedure Receive(AMimeType: String; AFd: LongInt{fd});
    destructor Destroy; override;
    function AddListener(AIntf: IWpPrimarySelectionOfferV1Listener): LongInt;
  end;

  TWpPrimarySelectionSourceV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _OFFER = 0;
    const _DESTROY = 1;
  public
    procedure Offer(AMimeType: String);
    destructor Destroy; override;
    function AddListener(AIntf: IWpPrimarySelectionSourceV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_primary_selection_device_manager_v1_interface: Twl_interface;
  WP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_INTERFACE_NAME: String = 'zwp_primary_selection_device_manager_v1';
  wp_primary_selection_device_v1_interface: Twl_interface;
  WP_PRIMARY_SELECTION_DEVICE_V1_INTERFACE_NAME: String = 'zwp_primary_selection_device_v1';
  wp_primary_selection_offer_v1_interface: Twl_interface;
  WP_PRIMARY_SELECTION_OFFER_V1_INTERFACE_NAME: String = 'zwp_primary_selection_offer_v1';
  wp_primary_selection_source_v1_interface: Twl_interface;
  WP_PRIMARY_SELECTION_SOURCE_V1_INTERFACE_NAME: String = 'zwp_primary_selection_source_v1';



implementation

var
  vIntf_wp_primary_selection_device_manager_v1_Listener: Twp_primary_selection_device_manager_v1_listener;
  vIntf_wp_primary_selection_device_v1_Listener: Twp_primary_selection_device_v1_listener;
  vIntf_wp_primary_selection_offer_v1_Listener: Twp_primary_selection_offer_v1_listener;
  vIntf_wp_primary_selection_source_v1_Listener: Twp_primary_selection_source_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpPrimarySelectionDeviceManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

function TWpPrimarySelectionDeviceManagerV1.CreateSource(AProxyClass: TWLProxyObjectClass = nil {TWpPrimarySelectionSourceV1}): TWpPrimarySelectionSourceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_SOURCE, @wp_primary_selection_source_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpPrimarySelectionSourceV1;
  Result := TWpPrimarySelectionSourceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpPrimarySelectionSourceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpPrimarySelectionSourceV1]);
end;

function TWpPrimarySelectionDeviceManagerV1.GetDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpPrimarySelectionDeviceV1}): TWpPrimarySelectionDeviceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_DEVICE, @wp_primary_selection_device_v1_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpPrimarySelectionDeviceV1;
  Result := TWpPrimarySelectionDeviceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpPrimarySelectionDeviceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpPrimarySelectionDeviceV1]);
end;

destructor TWpPrimarySelectionDeviceManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPrimarySelectionDeviceManagerV1.AddListener(AIntf: IWpPrimarySelectionDeviceManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_primary_selection_device_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpPrimarySelectionDeviceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

procedure TWpPrimarySelectionDeviceV1.SetSelection(ASource: TWpPrimarySelectionSourceV1; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_SELECTION, ASource.Proxy, ASerial);
end;

destructor TWpPrimarySelectionDeviceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPrimarySelectionDeviceV1.AddListener(AIntf: IWpPrimarySelectionDeviceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_primary_selection_device_v1_Listener, @FUserDataRec);
end;
constructor TWpPrimarySelectionOfferV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

procedure TWpPrimarySelectionOfferV1.Receive(AMimeType: String; AFd: LongInt{fd});
begin
  wl_proxy_marshal(FProxy, _RECEIVE, PChar(AMimeType), AFd);
end;

destructor TWpPrimarySelectionOfferV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPrimarySelectionOfferV1.AddListener(AIntf: IWpPrimarySelectionOfferV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_primary_selection_offer_v1_Listener, @FUserDataRec);
end;
constructor TWpPrimarySelectionSourceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

procedure TWpPrimarySelectionSourceV1.Offer(AMimeType: String);
begin
  wl_proxy_marshal(FProxy, _OFFER, PChar(AMimeType));
end;

destructor TWpPrimarySelectionSourceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPrimarySelectionSourceV1.AddListener(AIntf: IWpPrimarySelectionSourceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_primary_selection_source_v1_Listener, @FUserDataRec);
end;




procedure wp_primary_selection_device_v1_data_offer_Intf(AData: PWLUserData; Awp_primary_selection_device_v1: Pwp_primary_selection_device_v1; AOffer: Pwp_primary_selection_offer_v1); cdecl;
var
  AIntf: IWpPrimarySelectionDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPrimarySelectionDeviceV1Listener(AData^.ListenerUserData);
  AIntf.wp_primary_selection_device_v1_data_offer(TWpPrimarySelectionDeviceV1(AData^.PascalObject),  TWpPrimarySelectionOfferV1.Create(AOffer));
end;

procedure wp_primary_selection_device_v1_selection_Intf(AData: PWLUserData; Awp_primary_selection_device_v1: Pwp_primary_selection_device_v1; AId: Pwp_primary_selection_offer_v1); cdecl;
var
  AIntf: IWpPrimarySelectionDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPrimarySelectionDeviceV1Listener(AData^.ListenerUserData);
  AIntf.wp_primary_selection_device_v1_selection(TWpPrimarySelectionDeviceV1(AData^.PascalObject),  TWpPrimarySelectionOfferV1(TWLProxyObject.WLToObj(AId)));
end;

procedure wp_primary_selection_offer_v1_offer_Intf(AData: PWLUserData; Awp_primary_selection_offer_v1: Pwp_primary_selection_offer_v1; AMimeType: Pchar); cdecl;
var
  AIntf: IWpPrimarySelectionOfferV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPrimarySelectionOfferV1Listener(AData^.ListenerUserData);
  AIntf.wp_primary_selection_offer_v1_offer(TWpPrimarySelectionOfferV1(AData^.PascalObject), AMimeType);
end;

procedure wp_primary_selection_source_v1_send_Intf(AData: PWLUserData; Awp_primary_selection_source_v1: Pwp_primary_selection_source_v1; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
var
  AIntf: IWpPrimarySelectionSourceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPrimarySelectionSourceV1Listener(AData^.ListenerUserData);
  AIntf.wp_primary_selection_source_v1_send(TWpPrimarySelectionSourceV1(AData^.PascalObject), AMimeType, AFd);
end;

procedure wp_primary_selection_source_v1_cancelled_Intf(AData: PWLUserData; Awp_primary_selection_source_v1: Pwp_primary_selection_source_v1); cdecl;
var
  AIntf: IWpPrimarySelectionSourceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPrimarySelectionSourceV1Listener(AData^.ListenerUserData);
  AIntf.wp_primary_selection_source_v1_cancelled(TWpPrimarySelectionSourceV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..13] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_primary_selection_source_v1_interface),
    (@wp_primary_selection_device_v1_interface),
    (@wl_seat_interface),
    (@wp_primary_selection_source_v1_interface),
    (nil),
    (@wp_primary_selection_offer_v1_interface)
  );

  wp_primary_selection_device_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'create_source'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_device'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_primary_selection_device_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_selection'; signature: '?ou'; types: @pInterfaces[11]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_primary_selection_device_v1_events: array[0..1] of Twl_message = (
    (name: 'data_offer'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'selection'; signature: '?o'; types: @pInterfaces[13])
  );
  wp_primary_selection_offer_v1_requests: array[0..1] of Twl_message = (
    (name: 'receive'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_primary_selection_offer_v1_events: array[0..0] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0])
  );
  wp_primary_selection_source_v1_requests: array[0..1] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_primary_selection_source_v1_events: array[0..1] of Twl_message = (
    (name: 'send'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'cancelled'; signature: ''; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_wp_primary_selection_device_v1_Listener.data_offer) := @wp_primary_selection_device_v1_data_offer_Intf;
  Pointer(vIntf_wp_primary_selection_device_v1_Listener.selection) := @wp_primary_selection_device_v1_selection_Intf;
  Pointer(vIntf_wp_primary_selection_offer_v1_Listener.offer) := @wp_primary_selection_offer_v1_offer_Intf;
  Pointer(vIntf_wp_primary_selection_source_v1_Listener.send) := @wp_primary_selection_source_v1_send_Intf;
  Pointer(vIntf_wp_primary_selection_source_v1_Listener.cancelled) := @wp_primary_selection_source_v1_cancelled_Intf;


  wp_primary_selection_device_manager_v1_interface.name := PChar(WP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_INTERFACE_NAME);
  wp_primary_selection_device_manager_v1_interface.version := 1;
  wp_primary_selection_device_manager_v1_interface.method_count := 3;
  wp_primary_selection_device_manager_v1_interface.methods := @wp_primary_selection_device_manager_v1_requests;
  wp_primary_selection_device_manager_v1_interface.event_count := 0;
  wp_primary_selection_device_manager_v1_interface.events := nil;

  wp_primary_selection_device_v1_interface.name := PChar(WP_PRIMARY_SELECTION_DEVICE_V1_INTERFACE_NAME);
  wp_primary_selection_device_v1_interface.version := 1;
  wp_primary_selection_device_v1_interface.method_count := 2;
  wp_primary_selection_device_v1_interface.methods := @wp_primary_selection_device_v1_requests;
  wp_primary_selection_device_v1_interface.event_count := 2;
  wp_primary_selection_device_v1_interface.events := @wp_primary_selection_device_v1_events;

  wp_primary_selection_offer_v1_interface.name := PChar(WP_PRIMARY_SELECTION_OFFER_V1_INTERFACE_NAME);
  wp_primary_selection_offer_v1_interface.version := 1;
  wp_primary_selection_offer_v1_interface.method_count := 2;
  wp_primary_selection_offer_v1_interface.methods := @wp_primary_selection_offer_v1_requests;
  wp_primary_selection_offer_v1_interface.event_count := 1;
  wp_primary_selection_offer_v1_interface.events := @wp_primary_selection_offer_v1_events;

  wp_primary_selection_source_v1_interface.name := PChar(WP_PRIMARY_SELECTION_SOURCE_V1_INTERFACE_NAME);
  wp_primary_selection_source_v1_interface.version := 1;
  wp_primary_selection_source_v1_interface.method_count := 2;
  wp_primary_selection_source_v1_interface.methods := @wp_primary_selection_source_v1_requests;
  wp_primary_selection_source_v1_interface.event_count := 2;
  wp_primary_selection_source_v1_interface.events := @wp_primary_selection_source_v1_events;

end;

end.
