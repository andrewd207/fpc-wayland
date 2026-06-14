unit xwayland_shell_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxwayland_shell_v1 = Pointer;
  Pxwayland_surface_v1 = Pointer;
const
  XWAYLAND_SHELL_V1_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pxwayland_shell_v1_listener = ^Txwayland_shell_v1_listener;
  Txwayland_shell_v1_listener = record
  end;

const
  XWAYLAND_SURFACE_V1_ERROR_ALREADY_ASSOCIATED = 0; // given wl_surface is already associated with an X11 window
  XWAYLAND_SURFACE_V1_ERROR_INVALID_SERIAL = 1; // serial was not valid

type
  Pxwayland_surface_v1_listener = ^Txwayland_surface_v1_listener;
  Txwayland_surface_v1_listener = record
  end;



  TXwaylandShellV1 = class;
  TXwaylandSurfaceV1 = class;


  IXwaylandShellV1Listener = interface
  ['IXwaylandShellV1Listener']
  end;

  IXwaylandSurfaceV1Listener = interface
  ['IXwaylandSurfaceV1Listener']
  end;




  TXwaylandShellV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_XWAYLAND_SURFACE = 1;
  public
    destructor Destroy; override;
    function GetXwaylandSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXwaylandSurfaceV1}): TXwaylandSurfaceV1;
    function AddListener(AIntf: IXwaylandShellV1Listener): LongInt;
  end;

  TXwaylandSurfaceV1 = class(TWLProxyObject)
  private
    const _SET_SERIAL = 0;
    const _DESTROY = 1;
  public
    procedure SetSerial(ASerialLo: DWord; ASerialHi: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IXwaylandSurfaceV1Listener): LongInt;
  end;






var
  xwayland_shell_v1_interface: Twl_interface;
  XWAYLAND_SHELL_V1_INTERFACE_NAME: String = 'xwayland_shell_v1';
  xwayland_surface_v1_interface: Twl_interface;
  XWAYLAND_SURFACE_V1_INTERFACE_NAME: String = 'xwayland_surface_v1';



implementation

var
  vIntf_xwayland_shell_v1_Listener: Txwayland_shell_v1_listener;
  vIntf_xwayland_surface_v1_Listener: Txwayland_surface_v1_listener;



destructor TXwaylandShellV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXwaylandShellV1.GetXwaylandSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXwaylandSurfaceV1}): TXwaylandSurfaceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XWAYLAND_SURFACE, @xwayland_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXwaylandSurfaceV1;
  Result := TXwaylandSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXwaylandSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXwaylandSurfaceV1]);
end;

function TXwaylandShellV1.AddListener(AIntf: IXwaylandShellV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xwayland_shell_v1_Listener, @FUserDataRec);
end;
procedure TXwaylandSurfaceV1.SetSerial(ASerialLo: DWord; ASerialHi: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_SERIAL, ASerialLo, ASerialHi);
end;

destructor TXwaylandSurfaceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXwaylandSurfaceV1.AddListener(AIntf: IXwaylandSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xwayland_surface_v1_Listener, @FUserDataRec);
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
    (@xwayland_surface_v1_interface),
    (@wl_surface_interface)
  );

  xwayland_shell_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_xwayland_surface'; signature: 'no'; types: @pInterfaces[8])
  );
  xwayland_surface_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_serial'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  xwayland_shell_v1_interface.name := PChar(XWAYLAND_SHELL_V1_INTERFACE_NAME);
  xwayland_shell_v1_interface.version := 1;
  xwayland_shell_v1_interface.method_count := 2;
  xwayland_shell_v1_interface.methods := @xwayland_shell_v1_requests;
  xwayland_shell_v1_interface.event_count := 0;
  xwayland_shell_v1_interface.events := nil;

  xwayland_surface_v1_interface.name := PChar(XWAYLAND_SURFACE_V1_INTERFACE_NAME);
  xwayland_surface_v1_interface.version := 1;
  xwayland_surface_v1_interface.method_count := 2;
  xwayland_surface_v1_interface.methods := @xwayland_surface_v1_requests;
  xwayland_surface_v1_interface.event_count := 0;
  xwayland_surface_v1_interface.events := nil;

end.
