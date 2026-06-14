unit fifo_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_fifo_manager_v1 = Pointer;
  Pwp_fifo_v1 = Pointer;
const
  WP_FIFO_MANAGER_V1_ERROR_ALREADY_EXISTS = 0; // fifo manager already exists for surface

type
  Pwp_fifo_manager_v1_listener = ^Twp_fifo_manager_v1_listener;
  Twp_fifo_manager_v1_listener = record
  end;

const
  WP_FIFO_V1_ERROR_SURFACE_DESTROYED = 0; // the associated surface no longer exists

type
  Pwp_fifo_v1_listener = ^Twp_fifo_v1_listener;
  Twp_fifo_v1_listener = record
  end;



  TWpFifoManagerV1 = class;
  TWpFifoV1 = class;


  IWpFifoManagerV1Listener = interface
  ['IWpFifoManagerV1Listener']
  end;

  IWpFifoV1Listener = interface
  ['IWpFifoV1Listener']
  end;




  TWpFifoManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_FIFO = 1;
  public
    destructor Destroy; override;
    function GetFifo(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpFifoV1}): TWpFifoV1;
    function AddListener(AIntf: IWpFifoManagerV1Listener): LongInt;
  end;

  TWpFifoV1 = class(TWLProxyObject)
  private
    const _SET_BARRIER = 0;
    const _WAIT_BARRIER = 1;
    const _DESTROY = 2;
  public
    procedure SetBarrier;
    procedure WaitBarrier;
    destructor Destroy; override;
    function AddListener(AIntf: IWpFifoV1Listener): LongInt;
  end;






var
  wp_fifo_manager_v1_interface: Twl_interface;
  wp_fifo_v1_interface: Twl_interface;



implementation

var
  vIntf_wp_fifo_manager_v1_Listener: Twp_fifo_manager_v1_listener;
  vIntf_wp_fifo_v1_Listener: Twp_fifo_v1_listener;



destructor TWpFifoManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpFifoManagerV1.GetFifo(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpFifoV1}): TWpFifoV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_FIFO, @wp_fifo_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpFifoV1;
  Result := TWpFifoV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpFifoV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpFifoV1]);
end;

function TWpFifoManagerV1.AddListener(AIntf: IWpFifoManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_fifo_manager_v1_Listener, @FUserDataRec);
end;
procedure TWpFifoV1.SetBarrier;
begin
  wl_proxy_marshal(FProxy, _SET_BARRIER);
end;

procedure TWpFifoV1.WaitBarrier;
begin
  wl_proxy_marshal(FProxy, _WAIT_BARRIER);
end;

destructor TWpFifoV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpFifoV1.AddListener(AIntf: IWpFifoV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_fifo_v1_Listener, @FUserDataRec);
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
    (@wp_fifo_v1_interface),
    (@wl_surface_interface)
  );

  wp_fifo_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_fifo'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_fifo_v1_requests: array[0..2] of Twl_message = (
    (name: 'set_barrier'; signature: ''; types: @pInterfaces[0]),
    (name: 'wait_barrier'; signature: ''; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  wp_fifo_manager_v1_interface.name := 'wp_fifo_manager_v1';
  wp_fifo_manager_v1_interface.version := 1;
  wp_fifo_manager_v1_interface.method_count := 2;
  wp_fifo_manager_v1_interface.methods := @wp_fifo_manager_v1_requests;
  wp_fifo_manager_v1_interface.event_count := 0;
  wp_fifo_manager_v1_interface.events := nil;

  wp_fifo_v1_interface.name := 'wp_fifo_v1';
  wp_fifo_v1_interface.version := 1;
  wp_fifo_v1_interface.method_count := 3;
  wp_fifo_v1_interface.methods := @wp_fifo_v1_requests;
  wp_fifo_v1_interface.event_count := 0;
  wp_fifo_v1_interface.events := nil;

end.
