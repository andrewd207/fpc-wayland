unit pointer_warp_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_pointer_warp_v1 = Pointer;
  Pwp_pointer_warp_v1_listener = ^Twp_pointer_warp_v1_listener;
  Twp_pointer_warp_v1_listener = record
  end;



  TWpPointerWarpV1 = class;


  IWpPointerWarpV1Listener = interface
  ['IWpPointerWarpV1Listener']
  end;




  TWpPointerWarpV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _WARP_POINTER = 1;
  public
    destructor Destroy; override;
    procedure WarpPointer(ASurface: TWlSurface; APointer: TWlPointer; AX: Longint{24.8}; AY: Longint{24.8}; ASerial: DWord);
    function AddListener(AIntf: IWpPointerWarpV1Listener): LongInt;
  end;






var
  wp_pointer_warp_v1_interface: Twl_interface;



implementation

var
  vIntf_wp_pointer_warp_v1_Listener: Twp_pointer_warp_v1_listener;



destructor TWpPointerWarpV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpPointerWarpV1.WarpPointer(ASurface: TWlSurface; APointer: TWlPointer; AX: Longint{24.8}; AY: Longint{24.8}; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _WARP_POINTER, ASurface.Proxy, APointer.Proxy, AX, AY, ASerial);
end;

function TWpPointerWarpV1.AddListener(AIntf: IWpPointerWarpV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_pointer_warp_v1_Listener, @FUserDataRec);
end;






const
  pInterfaces: array[0..12] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (@wl_pointer_interface),
    (nil),
    (nil),
    (nil)
  );

  wp_pointer_warp_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'warp_pointer'; signature: 'ooffu'; types: @pInterfaces[8])
  );

initialization


  wp_pointer_warp_v1_interface.name := 'wp_pointer_warp_v1';
  wp_pointer_warp_v1_interface.version := 1;
  wp_pointer_warp_v1_interface.method_count := 2;
  wp_pointer_warp_v1_interface.methods := @wp_pointer_warp_v1_requests;
  wp_pointer_warp_v1_interface.event_count := 0;
  wp_pointer_warp_v1_interface.events := nil;

end.
