unit single_pixel_buffer_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_single_pixel_buffer_manager_v1 = Pointer;
  Pwp_single_pixel_buffer_manager_v1_listener = ^Twp_single_pixel_buffer_manager_v1_listener;
  Twp_single_pixel_buffer_manager_v1_listener = record
  end;



  TWpSinglePixelBufferManagerV1 = class;


  IWpSinglePixelBufferManagerV1Listener = interface
  ['IWpSinglePixelBufferManagerV1Listener']
  end;




  TWpSinglePixelBufferManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_U32_RGBA_BUFFER = 1;
  public
    destructor Destroy; override;
    function CreateU32RgbaBuffer(AR: DWord; AG: DWord; AB: DWord; AA: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer;
    function AddListener(AIntf: IWpSinglePixelBufferManagerV1Listener): LongInt;
  end;






var
  wp_single_pixel_buffer_manager_v1_interface: Twl_interface;
  WP_SINGLE_PIXEL_BUFFER_MANAGER_V1_INTERFACE_NAME: String = 'wp_single_pixel_buffer_manager_v1';



implementation

var
  vIntf_wp_single_pixel_buffer_manager_v1_Listener: Twp_single_pixel_buffer_manager_v1_listener;



destructor TWpSinglePixelBufferManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpSinglePixelBufferManagerV1.CreateU32RgbaBuffer(AR: DWord; AG: DWord; AB: DWord; AA: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_U32_RGBA_BUFFER, @wl_buffer_interface, nil, AR, AG, AB, AA);
  if AProxyClass = nil then
    AProxyClass := TWlBuffer;
  Result := TWlBuffer(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlBuffer) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlBuffer]);
end;

function TWpSinglePixelBufferManagerV1.AddListener(AIntf: IWpSinglePixelBufferManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_single_pixel_buffer_manager_v1_Listener, @FUserDataRec);
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
    (@wl_buffer_interface),
    (nil),
    (nil),
    (nil),
    (nil)
  );

  wp_single_pixel_buffer_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_u32_rgba_buffer'; signature: 'nuuuu'; types: @pInterfaces[8])
  );

initialization


  wp_single_pixel_buffer_manager_v1_interface.name := PChar(WP_SINGLE_PIXEL_BUFFER_MANAGER_V1_INTERFACE_NAME);
  wp_single_pixel_buffer_manager_v1_interface.version := 1;
  wp_single_pixel_buffer_manager_v1_interface.method_count := 2;
  wp_single_pixel_buffer_manager_v1_interface.methods := @wp_single_pixel_buffer_manager_v1_requests;
  wp_single_pixel_buffer_manager_v1_interface.event_count := 0;
  wp_single_pixel_buffer_manager_v1_interface.events := nil;

end.
