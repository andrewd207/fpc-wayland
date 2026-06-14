unit xdg_toplevel_tag_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, xdg_shell_protocol;


type
  Pxdg_toplevel_tag_manager_v1 = Pointer;
  Pxdg_toplevel_tag_manager_v1_listener = ^Txdg_toplevel_tag_manager_v1_listener;
  Txdg_toplevel_tag_manager_v1_listener = record
  end;



  TXdgToplevelTagManagerV1 = class;


  IXdgToplevelTagManagerV1Listener = interface
  ['IXdgToplevelTagManagerV1Listener']
  end;




  TXdgToplevelTagManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_TOPLEVEL_TAG = 1;
    const _SET_TOPLEVEL_DESCRIPTION = 2;
  public
    destructor Destroy; override;
    procedure SetToplevelTag(AToplevel: TXdgToplevel; ATag: String);
    procedure SetToplevelDescription(AToplevel: TXdgToplevel; ADescription: String);
    function AddListener(AIntf: IXdgToplevelTagManagerV1Listener): LongInt;
  end;






var
  xdg_toplevel_tag_manager_v1_interface: Twl_interface;



implementation

var
  vIntf_xdg_toplevel_tag_manager_v1_Listener: Txdg_toplevel_tag_manager_v1_listener;



destructor TXdgToplevelTagManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgToplevelTagManagerV1.SetToplevelTag(AToplevel: TXdgToplevel; ATag: String);
begin
  wl_proxy_marshal(FProxy, _SET_TOPLEVEL_TAG, AToplevel.Proxy, PChar(ATag));
end;

procedure TXdgToplevelTagManagerV1.SetToplevelDescription(AToplevel: TXdgToplevel; ADescription: String);
begin
  wl_proxy_marshal(FProxy, _SET_TOPLEVEL_DESCRIPTION, AToplevel.Proxy, PChar(ADescription));
end;

function TXdgToplevelTagManagerV1.AddListener(AIntf: IXdgToplevelTagManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_toplevel_tag_manager_v1_Listener, @FUserDataRec);
end;






const
  pInterfaces: array[0..11] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@xdg_toplevel_interface),
    (nil),
    (@xdg_toplevel_interface),
    (nil)
  );

  xdg_toplevel_tag_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_toplevel_tag'; signature: 'os'; types: @pInterfaces[8]),
    (name: 'set_toplevel_description'; signature: 'os'; types: @pInterfaces[10])
  );

initialization


  xdg_toplevel_tag_manager_v1_interface.name := 'xdg_toplevel_tag_manager_v1';
  xdg_toplevel_tag_manager_v1_interface.version := 1;
  xdg_toplevel_tag_manager_v1_interface.method_count := 3;
  xdg_toplevel_tag_manager_v1_interface.methods := @xdg_toplevel_tag_manager_v1_requests;
  xdg_toplevel_tag_manager_v1_interface.event_count := 0;
  xdg_toplevel_tag_manager_v1_interface.events := nil;

end.
