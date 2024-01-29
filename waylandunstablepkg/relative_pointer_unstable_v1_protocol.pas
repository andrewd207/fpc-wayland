unit relative_pointer_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_relative_pointer_manager_v1 = Pointer;
  Pzwp_relative_pointer_v1 = Pointer;
  Pzwp_relative_pointer_manager_v1_listener = ^Tzwp_relative_pointer_manager_v1_listener;
  Tzwp_relative_pointer_manager_v1_listener = record
  end;

  Pzwp_relative_pointer_v1_listener = ^Tzwp_relative_pointer_v1_listener;
  Tzwp_relative_pointer_v1_listener = record
    relative_motion : procedure(data: Pointer; AZwpRelativePointerV1: Pzwp_relative_pointer_v1; AUtimeHi: DWord; AUtimeLo: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; ADxUnaccel: Longint{24.8}; ADyUnaccel: Longint{24.8}); cdecl;
  end;



  TZwpRelativePointerManagerV1 = class;
  TZwpRelativePointerV1 = class;


  IZwpRelativePointerManagerV1Listener = interface
  ['IZwpRelativePointerManagerV1Listener']
  end;

  IZwpRelativePointerV1Listener = interface
  ['IZwpRelativePointerV1Listener']
    procedure zwp_relative_pointer_v1_relative_motion(AZwpRelativePointerV1: TZwpRelativePointerV1; AUtimeHi: DWord; AUtimeLo: DWord; ADx: Twl_fixed; ADy: Twl_fixed; ADxUnaccel: Twl_fixed; ADyUnaccel: Twl_fixed);
  end;




  TZwpRelativePointerManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_RELATIVE_POINTER = 1;
  public
    destructor Destroy; override;
    function GetRelativePointer(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpRelativePointerV1}): TZwpRelativePointerV1;
    function AddListener(AIntf: IZwpRelativePointerManagerV1Listener): LongInt;
  end;

  TZwpRelativePointerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpRelativePointerV1Listener): LongInt;
  end;






var
  zwp_relative_pointer_manager_v1_interface: Twl_interface;
  zwp_relative_pointer_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_relative_pointer_manager_v1_Listener: Tzwp_relative_pointer_manager_v1_listener;
  vIntf_zwp_relative_pointer_v1_Listener: Tzwp_relative_pointer_v1_listener;



destructor TZwpRelativePointerManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpRelativePointerManagerV1.GetRelativePointer(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpRelativePointerV1}): TZwpRelativePointerV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_RELATIVE_POINTER, @zwp_relative_pointer_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpRelativePointerV1;
  if not AProxyClass.InheritsFrom(TZwpRelativePointerV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpRelativePointerV1]);
  Result := TZwpRelativePointerV1(AProxyClass.Create(id));
end;

function TZwpRelativePointerManagerV1.AddListener(AIntf: IZwpRelativePointerManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_relative_pointer_manager_v1_Listener, @FUserDataRec);
end;
destructor TZwpRelativePointerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpRelativePointerV1.AddListener(AIntf: IZwpRelativePointerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_relative_pointer_v1_Listener, @FUserDataRec);
end;




procedure zwp_relative_pointer_v1_relative_motion_Intf(AData: PWLUserData; Azwp_relative_pointer_v1: Pzwp_relative_pointer_v1; AUtimeHi: DWord; AUtimeLo: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; ADxUnaccel: Longint{24.8}; ADyUnaccel: Longint{24.8}); cdecl;
var
  AIntf: IZwpRelativePointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpRelativePointerV1Listener(AData^.ListenerUserData);
  AIntf.zwp_relative_pointer_v1_relative_motion(TZwpRelativePointerV1(AData^.PascalObject), AUtimeHi, AUtimeLo, Twl_fixed(ADx), Twl_fixed(ADy), Twl_fixed(ADxUnaccel), Twl_fixed(ADyUnaccel));
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
    (@zwp_relative_pointer_v1_interface),
    (@wl_pointer_interface)
  );

  zwp_relative_pointer_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_relative_pointer'; signature: 'no'; types: @pInterfaces[8])
  );
  zwp_relative_pointer_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_relative_pointer_v1_events: array[0..0] of Twl_message = (
    (name: 'relative_motion'; signature: 'uuffff'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_relative_pointer_v1_Listener.relative_motion) := @zwp_relative_pointer_v1_relative_motion_Intf;


  zwp_relative_pointer_manager_v1_interface.name := 'zwp_relative_pointer_manager_v1';
  zwp_relative_pointer_manager_v1_interface.version := 1;
  zwp_relative_pointer_manager_v1_interface.method_count := 2;
  zwp_relative_pointer_manager_v1_interface.methods := @zwp_relative_pointer_manager_v1_requests;
  zwp_relative_pointer_manager_v1_interface.event_count := 0;
  zwp_relative_pointer_manager_v1_interface.events := nil;

  zwp_relative_pointer_v1_interface.name := 'zwp_relative_pointer_v1';
  zwp_relative_pointer_v1_interface.version := 1;
  zwp_relative_pointer_v1_interface.method_count := 1;
  zwp_relative_pointer_v1_interface.methods := @zwp_relative_pointer_v1_requests;
  zwp_relative_pointer_v1_interface.event_count := 1;
  zwp_relative_pointer_v1_interface.events := @zwp_relative_pointer_v1_events;

end.
