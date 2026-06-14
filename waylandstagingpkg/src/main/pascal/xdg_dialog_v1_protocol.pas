unit xdg_dialog_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, xdg_shell_protocol;


type
  Pxdg_wm_dialog_v1 = Pointer;
  Pxdg_dialog_v1 = Pointer;
const
  XDG_WM_DIALOG_V1_ERROR_ALREADY_USED = 0; // the xdg_toplevel object has already been used to create a xdg_dialog_v1

type
  Pxdg_wm_dialog_v1_listener = ^Txdg_wm_dialog_v1_listener;
  Txdg_wm_dialog_v1_listener = record
  end;

  Pxdg_dialog_v1_listener = ^Txdg_dialog_v1_listener;
  Txdg_dialog_v1_listener = record
  end;



  TXdgWmDialogV1 = class;
  TXdgDialogV1 = class;


  IXdgWmDialogV1Listener = interface
  ['IXdgWmDialogV1Listener']
  end;

  IXdgDialogV1Listener = interface
  ['IXdgDialogV1Listener']
  end;




  TXdgWmDialogV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgWmDialogV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_XDG_DIALOG = 1;
  public
    destructor Destroy; override;
    function GetXdgDialog(AToplevel: TXdgToplevel; AProxyClass: TWLProxyObjectClass = nil {TXdgDialogV1}): TXdgDialogV1;
    function AddListener(AIntf: IXdgWmDialogV1Listener): LongInt;
  end;

  TXdgDialogV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgDialogV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_MODAL = 1;
    const _UNSET_MODAL = 2;
  public
    destructor Destroy; override;
    procedure SetModal;
    procedure UnsetModal;
    function AddListener(AIntf: IXdgDialogV1Listener): LongInt;
  end;






var
  xdg_wm_dialog_v1_interface: Twl_interface;
  XDG_WM_DIALOG_V1_INTERFACE_NAME: String = 'xdg_wm_dialog_v1';
  xdg_dialog_v1_interface: Twl_interface;
  XDG_DIALOG_V1_INTERFACE_NAME: String = 'xdg_dialog_v1';



implementation

var
  vxdg_wm_dialog_v1_registered: Boolean = False;
  vIntf_xdg_wm_dialog_v1_Listener: Txdg_wm_dialog_v1_listener;
  vxdg_dialog_v1_registered: Boolean = False;
  vIntf_xdg_dialog_v1_Listener: Txdg_dialog_v1_listener;



constructor TXdgWmDialogV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgWmDialogV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgWmDialogV1;
begin
  RegisterInterface;
  Result := TXdgWmDialogV1.Create(ARegistry.Bind(AName, @xdg_wm_dialog_v1_interface, AVersion));
end;

destructor TXdgWmDialogV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgWmDialogV1.GetXdgDialog(AToplevel: TXdgToplevel; AProxyClass: TWLProxyObjectClass = nil {TXdgDialogV1}): TXdgDialogV1;
var
  id: Pwl_proxy;
begin
  TXdgDialogV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_XDG_DIALOG, @xdg_dialog_v1_interface, nil, AToplevel.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgDialogV1;
  Result := TXdgDialogV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgDialogV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgDialogV1]);
end;

function TXdgWmDialogV1.AddListener(AIntf: IXdgWmDialogV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_wm_dialog_v1_Listener, @FUserDataRec);
end;
constructor TXdgDialogV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgDialogV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgDialogV1;
begin
  RegisterInterface;
  Result := TXdgDialogV1.Create(ARegistry.Bind(AName, @xdg_dialog_v1_interface, AVersion));
end;

destructor TXdgDialogV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgDialogV1.SetModal;
begin
  wl_proxy_marshal(FProxy, _SET_MODAL);
end;

procedure TXdgDialogV1.UnsetModal;
begin
  wl_proxy_marshal(FProxy, _UNSET_MODAL);
end;

function TXdgDialogV1.AddListener(AIntf: IXdgDialogV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_dialog_v1_Listener, @FUserDataRec);
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
    (@xdg_dialog_v1_interface),
    (@xdg_toplevel_interface)
  );

  xdg_wm_dialog_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_xdg_dialog'; signature: 'no'; types: @pInterfaces[8])
  );
  xdg_dialog_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_modal'; signature: ''; types: @pInterfaces[0]),
    (name: 'unset_modal'; signature: ''; types: @pInterfaces[0])
  );

class procedure TXdgWmDialogV1.RegisterInterface;
begin
  if vxdg_wm_dialog_v1_registered then Exit;
  vxdg_wm_dialog_v1_registered := True;
  xdg_wm_dialog_v1_interface.name := PChar(XDG_WM_DIALOG_V1_INTERFACE_NAME);
  xdg_wm_dialog_v1_interface.version := 1;
  xdg_wm_dialog_v1_interface.method_count := 2;
  xdg_wm_dialog_v1_interface.methods := @xdg_wm_dialog_v1_requests;
  xdg_wm_dialog_v1_interface.event_count := 0;
  xdg_wm_dialog_v1_interface.events := nil;
end;

class procedure TXdgDialogV1.RegisterInterface;
begin
  if vxdg_dialog_v1_registered then Exit;
  vxdg_dialog_v1_registered := True;
  xdg_dialog_v1_interface.name := PChar(XDG_DIALOG_V1_INTERFACE_NAME);
  xdg_dialog_v1_interface.version := 1;
  xdg_dialog_v1_interface.method_count := 3;
  xdg_dialog_v1_interface.methods := @xdg_dialog_v1_requests;
  xdg_dialog_v1_interface.event_count := 0;
  xdg_dialog_v1_interface.events := nil;
end;


end.
