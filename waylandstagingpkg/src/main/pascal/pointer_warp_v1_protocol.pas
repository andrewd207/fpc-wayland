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
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerWarpV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _WARP_POINTER = 1;
  public
    destructor Destroy; override;
    procedure WarpPointer(ASurface: TWlSurface; APointer: TWlPointer; AX: Twl_fixed; AY: Twl_fixed; ASerial: DWord);
    function AddListener(AIntf: IWpPointerWarpV1Listener): LongInt;
  end;






var
  wp_pointer_warp_v1_interface: Twl_interface;
  WP_POINTER_WARP_V1_INTERFACE_NAME: String = 'wp_pointer_warp_v1';



implementation

var
  vwp_pointer_warp_v1_registered: Boolean = False;
  vIntf_wp_pointer_warp_v1_Listener: Twp_pointer_warp_v1_listener;



constructor TWpPointerWarpV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpPointerWarpV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerWarpV1;
begin
  RegisterInterface;
  Result := TWpPointerWarpV1.Create(ARegistry.Bind(AName, @wp_pointer_warp_v1_interface, AVersion));
end;

destructor TWpPointerWarpV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpPointerWarpV1.WarpPointer(ASurface: TWlSurface; APointer: TWlPointer; AX: Twl_fixed; AY: Twl_fixed; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _WARP_POINTER, ASurface.Proxy, APointer.Proxy, AX.AsFixed24_8, AY.AsFixed24_8, ASerial);
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

class procedure TWpPointerWarpV1.RegisterInterface;
begin
  if vwp_pointer_warp_v1_registered then Exit;
  vwp_pointer_warp_v1_registered := True;
  wp_pointer_warp_v1_interface.name := PChar(WP_POINTER_WARP_V1_INTERFACE_NAME);
  wp_pointer_warp_v1_interface.version := 1;
  wp_pointer_warp_v1_interface.method_count := 2;
  wp_pointer_warp_v1_interface.methods := @wp_pointer_warp_v1_requests;
  wp_pointer_warp_v1_interface.event_count := 0;
  wp_pointer_warp_v1_interface.events := nil;
end;


end.
