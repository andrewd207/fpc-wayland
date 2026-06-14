unit ext_data_control_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pext_data_control_manager_v1 = Pointer;
  Pext_data_control_device_v1 = Pointer;
  Pext_data_control_source_v1 = Pointer;
  Pext_data_control_offer_v1 = Pointer;
  Pext_data_control_manager_v1_listener = ^Text_data_control_manager_v1_listener;
  Text_data_control_manager_v1_listener = record
  end;

const
  EXT_DATA_CONTROL_DEVICE_V1_ERROR_USED_SOURCE = 1; // source given to set_selection or set_primary_selection was already used before

type
  Pext_data_control_device_v1_listener = ^Text_data_control_device_v1_listener;
  Text_data_control_device_v1_listener = record
    data_offer : procedure(data: Pointer; AExtDataControlDeviceV1: Pext_data_control_device_v1; AId: Pext_data_control_offer_v1); cdecl;
    selection : procedure(data: Pointer; AExtDataControlDeviceV1: Pext_data_control_device_v1; AId: Pext_data_control_offer_v1); cdecl;
    finished : procedure(data: Pointer; AExtDataControlDeviceV1: Pext_data_control_device_v1); cdecl;
    primary_selection : procedure(data: Pointer; AExtDataControlDeviceV1: Pext_data_control_device_v1; AId: Pext_data_control_offer_v1); cdecl;
  end;

const
  EXT_DATA_CONTROL_SOURCE_V1_ERROR_INVALID_OFFER = 1; // offer sent after ext_data_control_device.set_selection

type
  Pext_data_control_source_v1_listener = ^Text_data_control_source_v1_listener;
  Text_data_control_source_v1_listener = record
    send : procedure(data: Pointer; AExtDataControlSourceV1: Pext_data_control_source_v1; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
    cancelled : procedure(data: Pointer; AExtDataControlSourceV1: Pext_data_control_source_v1); cdecl;
  end;

  Pext_data_control_offer_v1_listener = ^Text_data_control_offer_v1_listener;
  Text_data_control_offer_v1_listener = record
    offer : procedure(data: Pointer; AExtDataControlOfferV1: Pext_data_control_offer_v1; AMimeType: Pchar); cdecl;
  end;



  TExtDataControlManagerV1 = class;
  TExtDataControlDeviceV1 = class;
  TExtDataControlSourceV1 = class;
  TExtDataControlOfferV1 = class;


  IExtDataControlManagerV1Listener = interface
  ['IExtDataControlManagerV1Listener']
  end;

  IExtDataControlDeviceV1Listener = interface
  ['IExtDataControlDeviceV1Listener']
    procedure ext_data_control_device_v1_data_offer(AExtDataControlDeviceV1: TExtDataControlDeviceV1; AId: TExtDataControlOfferV1);
    procedure ext_data_control_device_v1_selection(AExtDataControlDeviceV1: TExtDataControlDeviceV1; AId: TExtDataControlOfferV1);
    procedure ext_data_control_device_v1_finished(AExtDataControlDeviceV1: TExtDataControlDeviceV1);
    procedure ext_data_control_device_v1_primary_selection(AExtDataControlDeviceV1: TExtDataControlDeviceV1; AId: TExtDataControlOfferV1);
  end;

  IExtDataControlSourceV1Listener = interface
  ['IExtDataControlSourceV1Listener']
    procedure ext_data_control_source_v1_send(AExtDataControlSourceV1: TExtDataControlSourceV1; AMimeType: String; AFd: LongInt{fd});
    procedure ext_data_control_source_v1_cancelled(AExtDataControlSourceV1: TExtDataControlSourceV1);
  end;

  IExtDataControlOfferV1Listener = interface
  ['IExtDataControlOfferV1Listener']
    procedure ext_data_control_offer_v1_offer(AExtDataControlOfferV1: TExtDataControlOfferV1; AMimeType: String);
  end;




  TExtDataControlManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE_DATA_SOURCE = 0;
    const _GET_DATA_DEVICE = 1;
    const _DESTROY = 2;
  public
    function CreateDataSource(AProxyClass: TWLProxyObjectClass = nil {TExtDataControlSourceV1}): TExtDataControlSourceV1;
    function GetDataDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TExtDataControlDeviceV1}): TExtDataControlDeviceV1;
    destructor Destroy; override;
    function AddListener(AIntf: IExtDataControlManagerV1Listener): LongInt;
  end;

  TExtDataControlDeviceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlDeviceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_SELECTION = 0;
    const _DESTROY = 1;
    const _SET_PRIMARY_SELECTION = 2;
  public
    procedure SetSelection(ASource: TExtDataControlSourceV1);
    destructor Destroy; override;
    procedure SetPrimarySelection(ASource: TExtDataControlSourceV1);
    function AddListener(AIntf: IExtDataControlDeviceV1Listener): LongInt;
  end;

  TExtDataControlSourceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlSourceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _OFFER = 0;
    const _DESTROY = 1;
  public
    procedure Offer(AMimeType: String);
    destructor Destroy; override;
    function AddListener(AIntf: IExtDataControlSourceV1Listener): LongInt;
  end;

  TExtDataControlOfferV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlOfferV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _RECEIVE = 0;
    const _DESTROY = 1;
  public
    procedure Receive(AMimeType: String; AFd: LongInt{fd});
    destructor Destroy; override;
    function AddListener(AIntf: IExtDataControlOfferV1Listener): LongInt;
  end;






var
  ext_data_control_manager_v1_interface: Twl_interface;
  EXT_DATA_CONTROL_MANAGER_V1_INTERFACE_NAME: String = 'ext_data_control_manager_v1';
  ext_data_control_device_v1_interface: Twl_interface;
  EXT_DATA_CONTROL_DEVICE_V1_INTERFACE_NAME: String = 'ext_data_control_device_v1';
  ext_data_control_source_v1_interface: Twl_interface;
  EXT_DATA_CONTROL_SOURCE_V1_INTERFACE_NAME: String = 'ext_data_control_source_v1';
  ext_data_control_offer_v1_interface: Twl_interface;
  EXT_DATA_CONTROL_OFFER_V1_INTERFACE_NAME: String = 'ext_data_control_offer_v1';



implementation

var
  vext_data_control_manager_v1_registered: Boolean = False;
  vIntf_ext_data_control_manager_v1_Listener: Text_data_control_manager_v1_listener;
  vext_data_control_device_v1_registered: Boolean = False;
  vIntf_ext_data_control_device_v1_Listener: Text_data_control_device_v1_listener;
  vext_data_control_source_v1_registered: Boolean = False;
  vIntf_ext_data_control_source_v1_Listener: Text_data_control_source_v1_listener;
  vext_data_control_offer_v1_registered: Boolean = False;
  vIntf_ext_data_control_offer_v1_Listener: Text_data_control_offer_v1_listener;



constructor TExtDataControlManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtDataControlManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlManagerV1;
begin
  RegisterInterface;
  Result := TExtDataControlManagerV1.Create(ARegistry.Bind(AName, @ext_data_control_manager_v1_interface, AVersion));
end;

function TExtDataControlManagerV1.CreateDataSource(AProxyClass: TWLProxyObjectClass = nil {TExtDataControlSourceV1}): TExtDataControlSourceV1;
var
  id: Pwl_proxy;
begin
  TExtDataControlSourceV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_DATA_SOURCE, @ext_data_control_source_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TExtDataControlSourceV1;
  Result := TExtDataControlSourceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TExtDataControlSourceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtDataControlSourceV1]);
end;

function TExtDataControlManagerV1.GetDataDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TExtDataControlDeviceV1}): TExtDataControlDeviceV1;
var
  id: Pwl_proxy;
begin
  TExtDataControlDeviceV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_DATA_DEVICE, @ext_data_control_device_v1_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtDataControlDeviceV1;
  Result := TExtDataControlDeviceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TExtDataControlDeviceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtDataControlDeviceV1]);
end;

destructor TExtDataControlManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtDataControlManagerV1.AddListener(AIntf: IExtDataControlManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_data_control_manager_v1_Listener, @FUserDataRec);
end;
constructor TExtDataControlDeviceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtDataControlDeviceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlDeviceV1;
begin
  RegisterInterface;
  Result := TExtDataControlDeviceV1.Create(ARegistry.Bind(AName, @ext_data_control_device_v1_interface, AVersion));
end;

procedure TExtDataControlDeviceV1.SetSelection(ASource: TExtDataControlSourceV1);
begin
  wl_proxy_marshal(FProxy, _SET_SELECTION, ASource.Proxy);
end;

destructor TExtDataControlDeviceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TExtDataControlDeviceV1.SetPrimarySelection(ASource: TExtDataControlSourceV1);
begin
  wl_proxy_marshal(FProxy, _SET_PRIMARY_SELECTION, ASource.Proxy);
end;

function TExtDataControlDeviceV1.AddListener(AIntf: IExtDataControlDeviceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_data_control_device_v1_Listener, @FUserDataRec);
end;
constructor TExtDataControlSourceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtDataControlSourceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlSourceV1;
begin
  RegisterInterface;
  Result := TExtDataControlSourceV1.Create(ARegistry.Bind(AName, @ext_data_control_source_v1_interface, AVersion));
end;

procedure TExtDataControlSourceV1.Offer(AMimeType: String);
begin
  wl_proxy_marshal(FProxy, _OFFER, PChar(AMimeType));
end;

destructor TExtDataControlSourceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtDataControlSourceV1.AddListener(AIntf: IExtDataControlSourceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_data_control_source_v1_Listener, @FUserDataRec);
end;
constructor TExtDataControlOfferV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtDataControlOfferV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtDataControlOfferV1;
begin
  RegisterInterface;
  Result := TExtDataControlOfferV1.Create(ARegistry.Bind(AName, @ext_data_control_offer_v1_interface, AVersion));
end;

procedure TExtDataControlOfferV1.Receive(AMimeType: String; AFd: LongInt{fd});
begin
  wl_proxy_marshal(FProxy, _RECEIVE, PChar(AMimeType), AFd);
end;

destructor TExtDataControlOfferV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtDataControlOfferV1.AddListener(AIntf: IExtDataControlOfferV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_data_control_offer_v1_Listener, @FUserDataRec);
end;




procedure ext_data_control_device_v1_data_offer_Intf(AData: PWLUserData; Aext_data_control_device_v1: Pext_data_control_device_v1; AId: Pext_data_control_offer_v1); cdecl;
var
  AIntf: IExtDataControlDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtDataControlDeviceV1Listener(AData^.ListenerUserData);
  AIntf.ext_data_control_device_v1_data_offer(TExtDataControlDeviceV1(AData^.PascalObject),  TExtDataControlOfferV1.Create(AId));
end;

procedure ext_data_control_device_v1_selection_Intf(AData: PWLUserData; Aext_data_control_device_v1: Pext_data_control_device_v1; AId: Pext_data_control_offer_v1); cdecl;
var
  AIntf: IExtDataControlDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtDataControlDeviceV1Listener(AData^.ListenerUserData);
  AIntf.ext_data_control_device_v1_selection(TExtDataControlDeviceV1(AData^.PascalObject),  TExtDataControlOfferV1(TWLProxyObject.WLToObj(AId)));
end;

procedure ext_data_control_device_v1_finished_Intf(AData: PWLUserData; Aext_data_control_device_v1: Pext_data_control_device_v1); cdecl;
var
  AIntf: IExtDataControlDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtDataControlDeviceV1Listener(AData^.ListenerUserData);
  AIntf.ext_data_control_device_v1_finished(TExtDataControlDeviceV1(AData^.PascalObject));
end;

procedure ext_data_control_device_v1_primary_selection_Intf(AData: PWLUserData; Aext_data_control_device_v1: Pext_data_control_device_v1; AId: Pext_data_control_offer_v1); cdecl;
var
  AIntf: IExtDataControlDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtDataControlDeviceV1Listener(AData^.ListenerUserData);
  AIntf.ext_data_control_device_v1_primary_selection(TExtDataControlDeviceV1(AData^.PascalObject),  TExtDataControlOfferV1(TWLProxyObject.WLToObj(AId)));
end;

procedure ext_data_control_source_v1_send_Intf(AData: PWLUserData; Aext_data_control_source_v1: Pext_data_control_source_v1; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
var
  AIntf: IExtDataControlSourceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtDataControlSourceV1Listener(AData^.ListenerUserData);
  AIntf.ext_data_control_source_v1_send(TExtDataControlSourceV1(AData^.PascalObject), AMimeType, AFd);
end;

procedure ext_data_control_source_v1_cancelled_Intf(AData: PWLUserData; Aext_data_control_source_v1: Pext_data_control_source_v1); cdecl;
var
  AIntf: IExtDataControlSourceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtDataControlSourceV1Listener(AData^.ListenerUserData);
  AIntf.ext_data_control_source_v1_cancelled(TExtDataControlSourceV1(AData^.PascalObject));
end;

procedure ext_data_control_offer_v1_offer_Intf(AData: PWLUserData; Aext_data_control_offer_v1: Pext_data_control_offer_v1; AMimeType: Pchar); cdecl;
var
  AIntf: IExtDataControlOfferV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtDataControlOfferV1Listener(AData^.ListenerUserData);
  AIntf.ext_data_control_offer_v1_offer(TExtDataControlOfferV1(AData^.PascalObject), AMimeType);
end;



const
  pInterfaces: array[0..14] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@ext_data_control_source_v1_interface),
    (@ext_data_control_device_v1_interface),
    (@wl_seat_interface),
    (@ext_data_control_source_v1_interface),
    (@ext_data_control_source_v1_interface),
    (@ext_data_control_offer_v1_interface),
    (@ext_data_control_offer_v1_interface)
  );

  ext_data_control_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'create_data_source'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_data_device'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_data_control_device_v1_requests: array[0..2] of Twl_message = (
    (name: 'set_selection'; signature: '?o'; types: @pInterfaces[11]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_primary_selection'; signature: '?o'; types: @pInterfaces[12])
  );
  ext_data_control_device_v1_events: array[0..3] of Twl_message = (
    (name: 'data_offer'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'selection'; signature: '?o'; types: @pInterfaces[13]),
    (name: 'finished'; signature: ''; types: @pInterfaces[0]),
    (name: 'primary_selection'; signature: '?o'; types: @pInterfaces[14])
  );
  ext_data_control_source_v1_requests: array[0..1] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_data_control_source_v1_events: array[0..1] of Twl_message = (
    (name: 'send'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'cancelled'; signature: ''; types: @pInterfaces[0])
  );
  ext_data_control_offer_v1_requests: array[0..1] of Twl_message = (
    (name: 'receive'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_data_control_offer_v1_events: array[0..0] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0])
  );

class procedure TExtDataControlManagerV1.RegisterInterface;
begin
  if vext_data_control_manager_v1_registered then Exit;
  vext_data_control_manager_v1_registered := True;
  ext_data_control_manager_v1_interface.name := PChar(EXT_DATA_CONTROL_MANAGER_V1_INTERFACE_NAME);
  ext_data_control_manager_v1_interface.version := 1;
  ext_data_control_manager_v1_interface.method_count := 3;
  ext_data_control_manager_v1_interface.methods := @ext_data_control_manager_v1_requests;
  ext_data_control_manager_v1_interface.event_count := 0;
  ext_data_control_manager_v1_interface.events := nil;
end;

class procedure TExtDataControlDeviceV1.RegisterInterface;
begin
  if vext_data_control_device_v1_registered then Exit;
  vext_data_control_device_v1_registered := True;
  Pointer(vIntf_ext_data_control_device_v1_Listener.data_offer) := @ext_data_control_device_v1_data_offer_Intf;
  Pointer(vIntf_ext_data_control_device_v1_Listener.selection) := @ext_data_control_device_v1_selection_Intf;
  Pointer(vIntf_ext_data_control_device_v1_Listener.finished) := @ext_data_control_device_v1_finished_Intf;
  Pointer(vIntf_ext_data_control_device_v1_Listener.primary_selection) := @ext_data_control_device_v1_primary_selection_Intf;
  ext_data_control_device_v1_interface.name := PChar(EXT_DATA_CONTROL_DEVICE_V1_INTERFACE_NAME);
  ext_data_control_device_v1_interface.version := 1;
  ext_data_control_device_v1_interface.method_count := 3;
  ext_data_control_device_v1_interface.methods := @ext_data_control_device_v1_requests;
  ext_data_control_device_v1_interface.event_count := 4;
  ext_data_control_device_v1_interface.events := @ext_data_control_device_v1_events;
end;

class procedure TExtDataControlSourceV1.RegisterInterface;
begin
  if vext_data_control_source_v1_registered then Exit;
  vext_data_control_source_v1_registered := True;
  Pointer(vIntf_ext_data_control_source_v1_Listener.send) := @ext_data_control_source_v1_send_Intf;
  Pointer(vIntf_ext_data_control_source_v1_Listener.cancelled) := @ext_data_control_source_v1_cancelled_Intf;
  ext_data_control_source_v1_interface.name := PChar(EXT_DATA_CONTROL_SOURCE_V1_INTERFACE_NAME);
  ext_data_control_source_v1_interface.version := 1;
  ext_data_control_source_v1_interface.method_count := 2;
  ext_data_control_source_v1_interface.methods := @ext_data_control_source_v1_requests;
  ext_data_control_source_v1_interface.event_count := 2;
  ext_data_control_source_v1_interface.events := @ext_data_control_source_v1_events;
end;

class procedure TExtDataControlOfferV1.RegisterInterface;
begin
  if vext_data_control_offer_v1_registered then Exit;
  vext_data_control_offer_v1_registered := True;
  Pointer(vIntf_ext_data_control_offer_v1_Listener.offer) := @ext_data_control_offer_v1_offer_Intf;
  ext_data_control_offer_v1_interface.name := PChar(EXT_DATA_CONTROL_OFFER_V1_INTERFACE_NAME);
  ext_data_control_offer_v1_interface.version := 1;
  ext_data_control_offer_v1_interface.method_count := 2;
  ext_data_control_offer_v1_interface.methods := @ext_data_control_offer_v1_requests;
  ext_data_control_offer_v1_interface.event_count := 1;
  ext_data_control_offer_v1_interface.events := @ext_data_control_offer_v1_events;
end;


end.
