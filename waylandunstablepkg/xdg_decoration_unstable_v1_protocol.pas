unit xdg_decoration_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, xdg_shell_unstable_v6_protocol;


type
  Pzxdg_decoration_manager_v1 = Pointer;
  Pzxdg_toplevel_decoration_v1 = Pointer;
  Pzxdg_decoration_manager_v1_listener = ^Tzxdg_decoration_manager_v1_listener;
  Tzxdg_decoration_manager_v1_listener = record
  end;

const
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_UNCONFIGURED_BUFFER = 0; // xdg_toplevel has a buffer attached before configure
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ALREADY_CONSTRUCTED = 1; // xdg_toplevel already has a decoration object
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ORPHANED = 2; // xdg_toplevel destroyed before the decoration object
  ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE = 1; // no server-side window decoration
  ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE = 2; // server-side window decoration

type
  Pzxdg_toplevel_decoration_v1_listener = ^Tzxdg_toplevel_decoration_v1_listener;
  Tzxdg_toplevel_decoration_v1_listener = record
    configure : procedure(data: Pointer; AZxdgToplevelDecorationV1: Pzxdg_toplevel_decoration_v1; AMode: DWord); cdecl;
  end;



  TZxdgDecorationManagerV1 = class;
  TZxdgToplevelDecorationV1 = class;


  IZxdgDecorationManagerV1Listener = interface
  ['IZxdgDecorationManagerV1Listener']
  end;

  IZxdgToplevelDecorationV1Listener = interface
  ['IZxdgToplevelDecorationV1Listener']
    procedure zxdg_toplevel_decoration_v1_configure(AZxdgToplevelDecorationV1: TZxdgToplevelDecorationV1; AMode: DWord);
  end;




  { TZxdgDecorationManagerV1 }

  TZxdgDecorationManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_TOPLEVEL_DECORATION = 1;
  public
    destructor Destroy; override;
    function GetToplevelDecoration(AToplevel: TZxdgToplevelV6; AProxyClass: TWLProxyObjectClass = nil {TZxdgToplevelDecorationV1}): TZxdgToplevelDecorationV1;
    function AddListener(AIntf: IZxdgDecorationManagerV1Listener): LongInt;
  end;

  TZxdgToplevelDecorationV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_MODE = 1;
    const _UNSET_MODE = 2;
  public
    destructor Destroy; override;
    procedure SetMode(AMode: DWord);
    procedure UnsetMode;
    function AddListener(AIntf: IZxdgToplevelDecorationV1Listener): LongInt;
  end;






var
  zxdg_decoration_manager_v1_interface: Twl_interface;
  zxdg_toplevel_decoration_v1_interface: Twl_interface;



implementation

var
  vIntf_zxdg_decoration_manager_v1_Listener: Tzxdg_decoration_manager_v1_listener;
  vIntf_zxdg_toplevel_decoration_v1_Listener: Tzxdg_toplevel_decoration_v1_listener;



destructor TZxdgDecorationManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgDecorationManagerV1.GetToplevelDecoration(
  AToplevel: TZxdgToplevelV6; AProxyClass: TWLProxyObjectClass
  ): TZxdgToplevelDecorationV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOPLEVEL_DECORATION, @zxdg_toplevel_decoration_v1_interface, nil, AToplevel.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZxdgToplevelDecorationV1;
  Result := TZxdgToplevelDecorationV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZxdgToplevelDecorationV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgToplevelDecorationV1]);
end;

function TZxdgDecorationManagerV1.AddListener(AIntf: IZxdgDecorationManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_decoration_manager_v1_Listener, @FUserDataRec);
end;
destructor TZxdgToplevelDecorationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZxdgToplevelDecorationV1.SetMode(AMode: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_MODE, AMode);
end;

procedure TZxdgToplevelDecorationV1.UnsetMode;
begin
  wl_proxy_marshal(FProxy, _UNSET_MODE);
end;

function TZxdgToplevelDecorationV1.AddListener(AIntf: IZxdgToplevelDecorationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_toplevel_decoration_v1_Listener, @FUserDataRec);
end;




procedure zxdg_toplevel_decoration_v1_configure_Intf(AData: PWLUserData; Azxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; AMode: DWord); cdecl;
var
  AIntf: IZxdgToplevelDecorationV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgToplevelDecorationV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_toplevel_decoration_v1_configure(TZxdgToplevelDecorationV1(AData^.PascalObject), AMode);
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
    (@zxdg_toplevel_decoration_v1_interface),
    (@zxdg_toplevel_v6_interface)
  );

  zxdg_decoration_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel_decoration'; signature: 'no'; types: @pInterfaces[8])
  );
  zxdg_toplevel_decoration_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_mode'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'unset_mode'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_toplevel_decoration_v1_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_toplevel_decoration_v1_Listener.configure) := @zxdg_toplevel_decoration_v1_configure_Intf;


  zxdg_decoration_manager_v1_interface.name := 'zxdg_decoration_manager_v1';
  zxdg_decoration_manager_v1_interface.version := 1;
  zxdg_decoration_manager_v1_interface.method_count := 2;
  zxdg_decoration_manager_v1_interface.methods := @zxdg_decoration_manager_v1_requests;
  zxdg_decoration_manager_v1_interface.event_count := 0;
  zxdg_decoration_manager_v1_interface.events := nil;

  zxdg_toplevel_decoration_v1_interface.name := 'zxdg_toplevel_decoration_v1';
  zxdg_toplevel_decoration_v1_interface.version := 1;
  zxdg_toplevel_decoration_v1_interface.method_count := 3;
  zxdg_toplevel_decoration_v1_interface.methods := @zxdg_toplevel_decoration_v1_requests;
  zxdg_toplevel_decoration_v1_interface.event_count := 1;
  zxdg_toplevel_decoration_v1_interface.events := @zxdg_toplevel_decoration_v1_events;

end.
