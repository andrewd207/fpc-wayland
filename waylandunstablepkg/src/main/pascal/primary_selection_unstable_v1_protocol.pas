unit primary_selection_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_primary_selection_device_manager_v1 = Pointer;
  Pzwp_primary_selection_device_v1 = Pointer;
  Pzwp_primary_selection_offer_v1 = Pointer;
  Pzwp_primary_selection_source_v1 = Pointer;
  Pzwp_primary_selection_device_manager_v1_listener = ^Tzwp_primary_selection_device_manager_v1_listener;
  Tzwp_primary_selection_device_manager_v1_listener = record
  end;

  Pzwp_primary_selection_device_v1_listener = ^Tzwp_primary_selection_device_v1_listener;
  Tzwp_primary_selection_device_v1_listener = record
    data_offer : procedure(data: Pointer; AZwpPrimarySelectionDeviceV1: Pzwp_primary_selection_device_v1; AOffer: Pzwp_primary_selection_offer_v1); cdecl;
    selection : procedure(data: Pointer; AZwpPrimarySelectionDeviceV1: Pzwp_primary_selection_device_v1; AId: Pzwp_primary_selection_offer_v1); cdecl;
  end;

  Pzwp_primary_selection_offer_v1_listener = ^Tzwp_primary_selection_offer_v1_listener;
  Tzwp_primary_selection_offer_v1_listener = record
    offer : procedure(data: Pointer; AZwpPrimarySelectionOfferV1: Pzwp_primary_selection_offer_v1; AMimeType: Pchar); cdecl;
  end;

  Pzwp_primary_selection_source_v1_listener = ^Tzwp_primary_selection_source_v1_listener;
  Tzwp_primary_selection_source_v1_listener = record
    send : procedure(data: Pointer; AZwpPrimarySelectionSourceV1: Pzwp_primary_selection_source_v1; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
    cancelled : procedure(data: Pointer; AZwpPrimarySelectionSourceV1: Pzwp_primary_selection_source_v1); cdecl;
  end;



  TZwpPrimarySelectionDeviceManagerV1 = class;
  TZwpPrimarySelectionDeviceV1 = class;
  TZwpPrimarySelectionOfferV1 = class;
  TZwpPrimarySelectionSourceV1 = class;


  IZwpPrimarySelectionDeviceManagerV1Listener = interface
  ['IZwpPrimarySelectionDeviceManagerV1Listener']
  end;

  IZwpPrimarySelectionDeviceV1Listener = interface
  ['IZwpPrimarySelectionDeviceV1Listener']
    procedure zwp_primary_selection_device_v1_data_offer(AZwpPrimarySelectionDeviceV1: TZwpPrimarySelectionDeviceV1; AOffer: TZwpPrimarySelectionOfferV1);
    procedure zwp_primary_selection_device_v1_selection(AZwpPrimarySelectionDeviceV1: TZwpPrimarySelectionDeviceV1; AId: TZwpPrimarySelectionOfferV1);
  end;

  IZwpPrimarySelectionOfferV1Listener = interface
  ['IZwpPrimarySelectionOfferV1Listener']
    procedure zwp_primary_selection_offer_v1_offer(AZwpPrimarySelectionOfferV1: TZwpPrimarySelectionOfferV1; AMimeType: String);
  end;

  IZwpPrimarySelectionSourceV1Listener = interface
  ['IZwpPrimarySelectionSourceV1Listener']
    procedure zwp_primary_selection_source_v1_send(AZwpPrimarySelectionSourceV1: TZwpPrimarySelectionSourceV1; AMimeType: String; AFd: LongInt{fd});
    procedure zwp_primary_selection_source_v1_cancelled(AZwpPrimarySelectionSourceV1: TZwpPrimarySelectionSourceV1);
  end;




  TZwpPrimarySelectionDeviceManagerV1 = class(TWLProxyObject)
  private
    const _CREATE_SOURCE = 0;
    const _GET_DEVICE = 1;
    const _DESTROY = 2;
  public
    function CreateSource(AProxyClass: TWLProxyObjectClass = nil {TZwpPrimarySelectionSourceV1}): TZwpPrimarySelectionSourceV1;
    function GetDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpPrimarySelectionDeviceV1}): TZwpPrimarySelectionDeviceV1;
    destructor Destroy; override;
    function AddListener(AIntf: IZwpPrimarySelectionDeviceManagerV1Listener): LongInt;
  end;

  TZwpPrimarySelectionDeviceV1 = class(TWLProxyObject)
  private
    const _SET_SELECTION = 0;
    const _DESTROY = 1;
  public
    procedure SetSelection(ASource: TZwpPrimarySelectionSourceV1; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IZwpPrimarySelectionDeviceV1Listener): LongInt;
  end;

  TZwpPrimarySelectionOfferV1 = class(TWLProxyObject)
  private
    const _RECEIVE = 0;
    const _DESTROY = 1;
  public
    procedure Receive(AMimeType: String; AFd: LongInt{fd});
    destructor Destroy; override;
    function AddListener(AIntf: IZwpPrimarySelectionOfferV1Listener): LongInt;
  end;

  TZwpPrimarySelectionSourceV1 = class(TWLProxyObject)
  private
    const _OFFER = 0;
    const _DESTROY = 1;
  public
    procedure Offer(AMimeType: String);
    destructor Destroy; override;
    function AddListener(AIntf: IZwpPrimarySelectionSourceV1Listener): LongInt;
  end;






var
  zwp_primary_selection_device_manager_v1_interface: Twl_interface;
  zwp_primary_selection_device_v1_interface: Twl_interface;
  zwp_primary_selection_offer_v1_interface: Twl_interface;
  zwp_primary_selection_source_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_primary_selection_device_manager_v1_Listener: Tzwp_primary_selection_device_manager_v1_listener;
  vIntf_zwp_primary_selection_device_v1_Listener: Tzwp_primary_selection_device_v1_listener;
  vIntf_zwp_primary_selection_offer_v1_Listener: Tzwp_primary_selection_offer_v1_listener;
  vIntf_zwp_primary_selection_source_v1_Listener: Tzwp_primary_selection_source_v1_listener;



function TZwpPrimarySelectionDeviceManagerV1.CreateSource(AProxyClass: TWLProxyObjectClass = nil {TZwpPrimarySelectionSourceV1}): TZwpPrimarySelectionSourceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_SOURCE, @zwp_primary_selection_source_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TZwpPrimarySelectionSourceV1;
  Result := TZwpPrimarySelectionSourceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpPrimarySelectionSourceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpPrimarySelectionSourceV1]);
end;

function TZwpPrimarySelectionDeviceManagerV1.GetDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpPrimarySelectionDeviceV1}): TZwpPrimarySelectionDeviceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_DEVICE, @zwp_primary_selection_device_v1_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpPrimarySelectionDeviceV1;
  Result := TZwpPrimarySelectionDeviceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpPrimarySelectionDeviceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpPrimarySelectionDeviceV1]);
end;

destructor TZwpPrimarySelectionDeviceManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPrimarySelectionDeviceManagerV1.AddListener(AIntf: IZwpPrimarySelectionDeviceManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_primary_selection_device_manager_v1_Listener, @FUserDataRec);
end;
procedure TZwpPrimarySelectionDeviceV1.SetSelection(ASource: TZwpPrimarySelectionSourceV1; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_SELECTION, ASource.Proxy, ASerial);
end;

destructor TZwpPrimarySelectionDeviceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPrimarySelectionDeviceV1.AddListener(AIntf: IZwpPrimarySelectionDeviceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_primary_selection_device_v1_Listener, @FUserDataRec);
end;
procedure TZwpPrimarySelectionOfferV1.Receive(AMimeType: String; AFd: LongInt{fd});
begin
  wl_proxy_marshal(FProxy, _RECEIVE, PChar(AMimeType), AFd);
end;

destructor TZwpPrimarySelectionOfferV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPrimarySelectionOfferV1.AddListener(AIntf: IZwpPrimarySelectionOfferV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_primary_selection_offer_v1_Listener, @FUserDataRec);
end;
procedure TZwpPrimarySelectionSourceV1.Offer(AMimeType: String);
begin
  wl_proxy_marshal(FProxy, _OFFER, PChar(AMimeType));
end;

destructor TZwpPrimarySelectionSourceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPrimarySelectionSourceV1.AddListener(AIntf: IZwpPrimarySelectionSourceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_primary_selection_source_v1_Listener, @FUserDataRec);
end;




procedure zwp_primary_selection_device_v1_data_offer_Intf(AData: PWLUserData; Azwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; AOffer: Pzwp_primary_selection_offer_v1); cdecl;
var
  AIntf: IZwpPrimarySelectionDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPrimarySelectionDeviceV1Listener(AData^.ListenerUserData);
  AIntf.zwp_primary_selection_device_v1_data_offer(TZwpPrimarySelectionDeviceV1(AData^.PascalObject),  TZwpPrimarySelectionOfferV1.Create(AOffer));
end;

procedure zwp_primary_selection_device_v1_selection_Intf(AData: PWLUserData; Azwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; AId: Pzwp_primary_selection_offer_v1); cdecl;
var
  AIntf: IZwpPrimarySelectionDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPrimarySelectionDeviceV1Listener(AData^.ListenerUserData);
  AIntf.zwp_primary_selection_device_v1_selection(TZwpPrimarySelectionDeviceV1(AData^.PascalObject),  TZwpPrimarySelectionOfferV1(TWLProxyObject.WLToObj(AId)));
end;

procedure zwp_primary_selection_offer_v1_offer_Intf(AData: PWLUserData; Azwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; AMimeType: Pchar); cdecl;
var
  AIntf: IZwpPrimarySelectionOfferV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPrimarySelectionOfferV1Listener(AData^.ListenerUserData);
  AIntf.zwp_primary_selection_offer_v1_offer(TZwpPrimarySelectionOfferV1(AData^.PascalObject), AMimeType);
end;

procedure zwp_primary_selection_source_v1_send_Intf(AData: PWLUserData; Azwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
var
  AIntf: IZwpPrimarySelectionSourceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPrimarySelectionSourceV1Listener(AData^.ListenerUserData);
  AIntf.zwp_primary_selection_source_v1_send(TZwpPrimarySelectionSourceV1(AData^.PascalObject), AMimeType, AFd);
end;

procedure zwp_primary_selection_source_v1_cancelled_Intf(AData: PWLUserData; Azwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1); cdecl;
var
  AIntf: IZwpPrimarySelectionSourceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPrimarySelectionSourceV1Listener(AData^.ListenerUserData);
  AIntf.zwp_primary_selection_source_v1_cancelled(TZwpPrimarySelectionSourceV1(AData^.PascalObject));
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
    (@zwp_primary_selection_source_v1_interface),
    (@zwp_primary_selection_device_v1_interface),
    (@wl_seat_interface),
    (@zwp_primary_selection_source_v1_interface),
    (nil),
    (@zwp_primary_selection_offer_v1_interface)
  );

  zwp_primary_selection_device_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'create_source'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_device'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_device_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_selection'; signature: '?ou'; types: @pInterfaces[11]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_device_v1_events: array[0..1] of Twl_message = (
    (name: 'data_offer'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'selection'; signature: '?o'; types: @pInterfaces[13])
  );
  zwp_primary_selection_offer_v1_requests: array[0..1] of Twl_message = (
    (name: 'receive'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_offer_v1_events: array[0..0] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0])
  );
  zwp_primary_selection_source_v1_requests: array[0..1] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_source_v1_events: array[0..1] of Twl_message = (
    (name: 'send'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'cancelled'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_primary_selection_device_v1_Listener.data_offer) := @zwp_primary_selection_device_v1_data_offer_Intf;
  Pointer(vIntf_zwp_primary_selection_device_v1_Listener.selection) := @zwp_primary_selection_device_v1_selection_Intf;
  Pointer(vIntf_zwp_primary_selection_offer_v1_Listener.offer) := @zwp_primary_selection_offer_v1_offer_Intf;
  Pointer(vIntf_zwp_primary_selection_source_v1_Listener.send) := @zwp_primary_selection_source_v1_send_Intf;
  Pointer(vIntf_zwp_primary_selection_source_v1_Listener.cancelled) := @zwp_primary_selection_source_v1_cancelled_Intf;


  zwp_primary_selection_device_manager_v1_interface.name := 'zwp_primary_selection_device_manager_v1';
  zwp_primary_selection_device_manager_v1_interface.version := 1;
  zwp_primary_selection_device_manager_v1_interface.method_count := 3;
  zwp_primary_selection_device_manager_v1_interface.methods := @zwp_primary_selection_device_manager_v1_requests;
  zwp_primary_selection_device_manager_v1_interface.event_count := 0;
  zwp_primary_selection_device_manager_v1_interface.events := nil;

  zwp_primary_selection_device_v1_interface.name := 'zwp_primary_selection_device_v1';
  zwp_primary_selection_device_v1_interface.version := 1;
  zwp_primary_selection_device_v1_interface.method_count := 2;
  zwp_primary_selection_device_v1_interface.methods := @zwp_primary_selection_device_v1_requests;
  zwp_primary_selection_device_v1_interface.event_count := 2;
  zwp_primary_selection_device_v1_interface.events := @zwp_primary_selection_device_v1_events;

  zwp_primary_selection_offer_v1_interface.name := 'zwp_primary_selection_offer_v1';
  zwp_primary_selection_offer_v1_interface.version := 1;
  zwp_primary_selection_offer_v1_interface.method_count := 2;
  zwp_primary_selection_offer_v1_interface.methods := @zwp_primary_selection_offer_v1_requests;
  zwp_primary_selection_offer_v1_interface.event_count := 1;
  zwp_primary_selection_offer_v1_interface.events := @zwp_primary_selection_offer_v1_events;

  zwp_primary_selection_source_v1_interface.name := 'zwp_primary_selection_source_v1';
  zwp_primary_selection_source_v1_interface.version := 1;
  zwp_primary_selection_source_v1_interface.method_count := 2;
  zwp_primary_selection_source_v1_interface.methods := @zwp_primary_selection_source_v1_requests;
  zwp_primary_selection_source_v1_interface.event_count := 2;
  zwp_primary_selection_source_v1_interface.events := @zwp_primary_selection_source_v1_events;

end.
