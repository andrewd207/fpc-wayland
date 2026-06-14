unit xdg_system_bell_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_system_bell_v1 = Pointer;
  Pxdg_system_bell_v1_listener = ^Txdg_system_bell_v1_listener;
  Txdg_system_bell_v1_listener = record
  end;



  TXdgSystemBellV1 = class;


  IXdgSystemBellV1Listener = interface
  ['IXdgSystemBellV1Listener']
  end;




  TXdgSystemBellV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _RING = 1;
  public
    destructor Destroy; override;
    procedure Ring(ASurface: TWlSurface);
    function AddListener(AIntf: IXdgSystemBellV1Listener): LongInt;
  end;






var
  xdg_system_bell_v1_interface: Twl_interface;



implementation

var
  vIntf_xdg_system_bell_v1_Listener: Txdg_system_bell_v1_listener;



destructor TXdgSystemBellV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgSystemBellV1.Ring(ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _RING, ASurface.Proxy);
end;

function TXdgSystemBellV1.AddListener(AIntf: IXdgSystemBellV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_system_bell_v1_Listener, @FUserDataRec);
end;






const
  pInterfaces: array[0..8] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface)
  );

  xdg_system_bell_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'ring'; signature: '?o'; types: @pInterfaces[8])
  );

initialization


  xdg_system_bell_v1_interface.name := 'xdg_system_bell_v1';
  xdg_system_bell_v1_interface.version := 1;
  xdg_system_bell_v1_interface.method_count := 2;
  xdg_system_bell_v1_interface.methods := @xdg_system_bell_v1_requests;
  xdg_system_bell_v1_interface.event_count := 0;
  xdg_system_bell_v1_interface.events := nil;

end.
