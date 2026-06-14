unit xdg_activation_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_activation_v1 = Pointer;
  Pxdg_activation_token_v1 = Pointer;
  Pxdg_activation_v1_listener = ^Txdg_activation_v1_listener;
  Txdg_activation_v1_listener = record
  end;

const
  XDG_ACTIVATION_TOKEN_V1_ERROR_ALREADY_USED = 0; // The token has already been used previously

type
  Pxdg_activation_token_v1_listener = ^Txdg_activation_token_v1_listener;
  Txdg_activation_token_v1_listener = record
    done : procedure(data: Pointer; AXdgActivationTokenV1: Pxdg_activation_token_v1; AToken: Pchar); cdecl;
  end;



  TXdgActivationV1 = class;
  TXdgActivationTokenV1 = class;


  IXdgActivationV1Listener = interface
  ['IXdgActivationV1Listener']
  end;

  IXdgActivationTokenV1Listener = interface
  ['IXdgActivationTokenV1Listener']
    procedure xdg_activation_token_v1_done(AXdgActivationTokenV1: TXdgActivationTokenV1; AToken: String);
  end;




  TXdgActivationV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_ACTIVATION_TOKEN = 1;
    const _ACTIVATE = 2;
  public
    destructor Destroy; override;
    function GetActivationToken(AProxyClass: TWLProxyObjectClass = nil {TXdgActivationTokenV1}): TXdgActivationTokenV1;
    procedure Activate(AToken: String; ASurface: TWlSurface);
    function AddListener(AIntf: IXdgActivationV1Listener): LongInt;
  end;

  TXdgActivationTokenV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_SERIAL = 0;
    const _SET_APP_ID = 1;
    const _SET_SURFACE = 2;
    const _COMMIT = 3;
    const _DESTROY = 4;
  public
    procedure SetSerial(ASerial: DWord; ASeat: TWlSeat);
    procedure SetAppId(AAppId: String);
    procedure SetSurface(ASurface: TWlSurface);
    procedure Commit;
    destructor Destroy; override;
    function AddListener(AIntf: IXdgActivationTokenV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  xdg_activation_v1_interface: Twl_interface;
  XDG_ACTIVATION_V1_INTERFACE_NAME: String = 'xdg_activation_v1';
  xdg_activation_token_v1_interface: Twl_interface;
  XDG_ACTIVATION_TOKEN_V1_INTERFACE_NAME: String = 'xdg_activation_token_v1';



implementation

var
  vIntf_xdg_activation_v1_Listener: Txdg_activation_v1_listener;
  vIntf_xdg_activation_token_v1_Listener: Txdg_activation_token_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TXdgActivationV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TXdgActivationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgActivationV1.GetActivationToken(AProxyClass: TWLProxyObjectClass = nil {TXdgActivationTokenV1}): TXdgActivationTokenV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_ACTIVATION_TOKEN, @xdg_activation_token_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TXdgActivationTokenV1;
  Result := TXdgActivationTokenV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgActivationTokenV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgActivationTokenV1]);
end;

procedure TXdgActivationV1.Activate(AToken: String; ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _ACTIVATE, PChar(AToken), ASurface.Proxy);
end;

function TXdgActivationV1.AddListener(AIntf: IXdgActivationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_activation_v1_Listener, @FUserDataRec);
end;
constructor TXdgActivationTokenV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

procedure TXdgActivationTokenV1.SetSerial(ASerial: DWord; ASeat: TWlSeat);
begin
  wl_proxy_marshal(FProxy, _SET_SERIAL, ASerial, ASeat.Proxy);
end;

procedure TXdgActivationTokenV1.SetAppId(AAppId: String);
begin
  wl_proxy_marshal(FProxy, _SET_APP_ID, PChar(AAppId));
end;

procedure TXdgActivationTokenV1.SetSurface(ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _SET_SURFACE, ASurface.Proxy);
end;

procedure TXdgActivationTokenV1.Commit;
begin
  wl_proxy_marshal(FProxy, _COMMIT);
end;

destructor TXdgActivationTokenV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgActivationTokenV1.AddListener(AIntf: IXdgActivationTokenV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_activation_token_v1_Listener, @FUserDataRec);
end;




procedure xdg_activation_token_v1_done_Intf(AData: PWLUserData; Axdg_activation_token_v1: Pxdg_activation_token_v1; AToken: Pchar); cdecl;
var
  AIntf: IXdgActivationTokenV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgActivationTokenV1Listener(AData^.ListenerUserData);
  AIntf.xdg_activation_token_v1_done(TXdgActivationTokenV1(AData^.PascalObject), AToken);
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
    (@xdg_activation_token_v1_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (@wl_seat_interface),
    (@wl_surface_interface)
  );

  xdg_activation_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_activation_token'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'activate'; signature: 'so'; types: @pInterfaces[9])
  );
  xdg_activation_token_v1_requests: array[0..4] of Twl_message = (
    (name: 'set_serial'; signature: 'uo'; types: @pInterfaces[11]),
    (name: 'set_app_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_surface'; signature: 'o'; types: @pInterfaces[13]),
    (name: 'commit'; signature: ''; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  xdg_activation_token_v1_events: array[0..0] of Twl_message = (
    (name: 'done'; signature: 's'; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_xdg_activation_token_v1_Listener.done) := @xdg_activation_token_v1_done_Intf;


  xdg_activation_v1_interface.name := PChar(XDG_ACTIVATION_V1_INTERFACE_NAME);
  xdg_activation_v1_interface.version := 1;
  xdg_activation_v1_interface.method_count := 3;
  xdg_activation_v1_interface.methods := @xdg_activation_v1_requests;
  xdg_activation_v1_interface.event_count := 0;
  xdg_activation_v1_interface.events := nil;

  xdg_activation_token_v1_interface.name := PChar(XDG_ACTIVATION_TOKEN_V1_INTERFACE_NAME);
  xdg_activation_token_v1_interface.version := 1;
  xdg_activation_token_v1_interface.method_count := 5;
  xdg_activation_token_v1_interface.methods := @xdg_activation_token_v1_requests;
  xdg_activation_token_v1_interface.event_count := 1;
  xdg_activation_token_v1_interface.events := @xdg_activation_token_v1_events;

end;

end.
