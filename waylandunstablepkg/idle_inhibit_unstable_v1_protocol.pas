unit idle_inhibit_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_idle_inhibit_manager_v1 = Pointer;
  Pzwp_idle_inhibitor_v1 = Pointer;
  Pzwp_idle_inhibit_manager_v1_listener = ^Tzwp_idle_inhibit_manager_v1_listener;
  Tzwp_idle_inhibit_manager_v1_listener = record
  end;

  Pzwp_idle_inhibitor_v1_listener = ^Tzwp_idle_inhibitor_v1_listener;
  Tzwp_idle_inhibitor_v1_listener = record
  end;



  TZwpIdleInhibitManagerV1 = class;
  TZwpIdleInhibitorV1 = class;


  IZwpIdleInhibitManagerV1Listener = interface
  ['IZwpIdleInhibitManagerV1Listener']
  end;

  IZwpIdleInhibitorV1Listener = interface
  ['IZwpIdleInhibitorV1Listener']
  end;




  TZwpIdleInhibitManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_INHIBITOR = 1;
  public
    destructor Destroy; override;
    function CreateInhibitor(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpIdleInhibitorV1}): TZwpIdleInhibitorV1;
    function AddListener(AIntf: IZwpIdleInhibitManagerV1Listener): LongInt;
  end;

  TZwpIdleInhibitorV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpIdleInhibitorV1Listener): LongInt;
  end;






var
  zwp_idle_inhibit_manager_v1_interface: Twl_interface;
  zwp_idle_inhibitor_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_idle_inhibit_manager_v1_Listener: Tzwp_idle_inhibit_manager_v1_listener;
  vIntf_zwp_idle_inhibitor_v1_Listener: Tzwp_idle_inhibitor_v1_listener;



destructor TZwpIdleInhibitManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpIdleInhibitManagerV1.CreateInhibitor(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpIdleInhibitorV1}): TZwpIdleInhibitorV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_INHIBITOR, @zwp_idle_inhibitor_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpIdleInhibitorV1;
  if not AProxyClass.InheritsFrom(TZwpIdleInhibitorV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpIdleInhibitorV1]);
  Result := TZwpIdleInhibitorV1(AProxyClass.Create(id));
end;

function TZwpIdleInhibitManagerV1.AddListener(AIntf: IZwpIdleInhibitManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_idle_inhibit_manager_v1_Listener, @FUserDataRec);
end;
destructor TZwpIdleInhibitorV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpIdleInhibitorV1.AddListener(AIntf: IZwpIdleInhibitorV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_idle_inhibitor_v1_Listener, @FUserDataRec);
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
    (@zwp_idle_inhibitor_v1_interface),
    (@wl_surface_interface)
  );

  zwp_idle_inhibit_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_inhibitor'; signature: 'no'; types: @pInterfaces[8])
  );
  zwp_idle_inhibitor_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  zwp_idle_inhibit_manager_v1_interface.name := 'zwp_idle_inhibit_manager_v1';
  zwp_idle_inhibit_manager_v1_interface.version := 1;
  zwp_idle_inhibit_manager_v1_interface.method_count := 2;
  zwp_idle_inhibit_manager_v1_interface.methods := @zwp_idle_inhibit_manager_v1_requests;
  zwp_idle_inhibit_manager_v1_interface.event_count := 0;
  zwp_idle_inhibit_manager_v1_interface.events := nil;

  zwp_idle_inhibitor_v1_interface.name := 'zwp_idle_inhibitor_v1';
  zwp_idle_inhibitor_v1_interface.version := 1;
  zwp_idle_inhibitor_v1_interface.method_count := 1;
  zwp_idle_inhibitor_v1_interface.methods := @zwp_idle_inhibitor_v1_requests;
  zwp_idle_inhibitor_v1_interface.event_count := 0;
  zwp_idle_inhibitor_v1_interface.events := nil;

end.
