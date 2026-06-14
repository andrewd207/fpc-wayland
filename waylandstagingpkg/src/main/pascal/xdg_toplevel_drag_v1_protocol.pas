unit xdg_toplevel_drag_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, xdg_shell_protocol;


type
  Pxdg_toplevel_drag_manager_v1 = Pointer;
  Pxdg_toplevel_drag_v1 = Pointer;
const
  XDG_TOPLEVEL_DRAG_MANAGER_V1_ERROR_INVALID_SOURCE = 0; // data_source already used for toplevel drag

type
  Pxdg_toplevel_drag_manager_v1_listener = ^Txdg_toplevel_drag_manager_v1_listener;
  Txdg_toplevel_drag_manager_v1_listener = record
  end;

const
  XDG_TOPLEVEL_DRAG_V1_ERROR_TOPLEVEL_ATTACHED = 0; // valid toplevel already attached
  XDG_TOPLEVEL_DRAG_V1_ERROR_ONGOING_DRAG = 1; // drag has not ended

type
  Pxdg_toplevel_drag_v1_listener = ^Txdg_toplevel_drag_v1_listener;
  Txdg_toplevel_drag_v1_listener = record
  end;



  TXdgToplevelDragManagerV1 = class;
  TXdgToplevelDragV1 = class;


  IXdgToplevelDragManagerV1Listener = interface
  ['IXdgToplevelDragManagerV1Listener']
  end;

  IXdgToplevelDragV1Listener = interface
  ['IXdgToplevelDragV1Listener']
  end;




  TXdgToplevelDragManagerV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_XDG_TOPLEVEL_DRAG = 1;
  public
    destructor Destroy; override;
    function GetXdgToplevelDrag(ADataSource: TWlDataSource; AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelDragV1}): TXdgToplevelDragV1;
    function AddListener(AIntf: IXdgToplevelDragManagerV1Listener): LongInt;
  end;

  TXdgToplevelDragV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _ATTACH = 1;
  public
    destructor Destroy; override;
    procedure Attach(AToplevel: TXdgToplevel; AXOffset: LongInt; AYOffset: LongInt);
    function AddListener(AIntf: IXdgToplevelDragV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  xdg_toplevel_drag_manager_v1_interface: Twl_interface;
  XDG_TOPLEVEL_DRAG_MANAGER_V1_INTERFACE_NAME: String = 'xdg_toplevel_drag_manager_v1';
  xdg_toplevel_drag_v1_interface: Twl_interface;
  XDG_TOPLEVEL_DRAG_V1_INTERFACE_NAME: String = 'xdg_toplevel_drag_v1';



implementation

var
  vIntf_xdg_toplevel_drag_manager_v1_Listener: Txdg_toplevel_drag_manager_v1_listener;
  vIntf_xdg_toplevel_drag_v1_Listener: Txdg_toplevel_drag_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TXdgToplevelDragManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TXdgToplevelDragManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgToplevelDragManagerV1.GetXdgToplevelDrag(ADataSource: TWlDataSource; AProxyClass: TWLProxyObjectClass = nil {TXdgToplevelDragV1}): TXdgToplevelDragV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_TOPLEVEL_DRAG, @xdg_toplevel_drag_v1_interface, nil, ADataSource.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgToplevelDragV1;
  Result := TXdgToplevelDragV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgToplevelDragV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgToplevelDragV1]);
end;

function TXdgToplevelDragManagerV1.AddListener(AIntf: IXdgToplevelDragManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_drag_manager_v1_Listener, @FUserDataRec);
end;
constructor TXdgToplevelDragV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TXdgToplevelDragV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgToplevelDragV1.Attach(AToplevel: TXdgToplevel; AXOffset: LongInt; AYOffset: LongInt);
begin
  wl_proxy_marshal(FProxy, _ATTACH, AToplevel.Proxy, AXOffset, AYOffset);
end;

function TXdgToplevelDragV1.AddListener(AIntf: IXdgToplevelDragV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_drag_v1_Listener, @FUserDataRec);
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
    (@xdg_toplevel_drag_v1_interface),
    (@wl_data_source_interface),
    (@xdg_toplevel_interface),
    (nil),
    (nil)
  );

  xdg_toplevel_drag_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_xdg_toplevel_drag'; signature: 'no'; types: @pInterfaces[8])
  );
  xdg_toplevel_drag_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'attach'; signature: 'oii'; types: @pInterfaces[10])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;


  xdg_toplevel_drag_manager_v1_interface.name := PChar(XDG_TOPLEVEL_DRAG_MANAGER_V1_INTERFACE_NAME);
  xdg_toplevel_drag_manager_v1_interface.version := 1;
  xdg_toplevel_drag_manager_v1_interface.method_count := 2;
  xdg_toplevel_drag_manager_v1_interface.methods := @xdg_toplevel_drag_manager_v1_requests;
  xdg_toplevel_drag_manager_v1_interface.event_count := 0;
  xdg_toplevel_drag_manager_v1_interface.events := nil;

  xdg_toplevel_drag_v1_interface.name := PChar(XDG_TOPLEVEL_DRAG_V1_INTERFACE_NAME);
  xdg_toplevel_drag_v1_interface.version := 1;
  xdg_toplevel_drag_v1_interface.method_count := 2;
  xdg_toplevel_drag_v1_interface.methods := @xdg_toplevel_drag_v1_requests;
  xdg_toplevel_drag_v1_interface.event_count := 0;
  xdg_toplevel_drag_v1_interface.events := nil;

end;

end.
