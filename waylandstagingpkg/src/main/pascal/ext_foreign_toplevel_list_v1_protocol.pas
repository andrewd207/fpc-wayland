unit ext_foreign_toplevel_list_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pext_foreign_toplevel_list_v1 = Pointer;
  Pext_foreign_toplevel_handle_v1 = Pointer;
  Pext_foreign_toplevel_list_v1_listener = ^Text_foreign_toplevel_list_v1_listener;
  Text_foreign_toplevel_list_v1_listener = record
    toplevel : procedure(data: Pointer; AExtForeignToplevelListV1: Pext_foreign_toplevel_list_v1; AToplevel: Pext_foreign_toplevel_handle_v1); cdecl;
    finished : procedure(data: Pointer; AExtForeignToplevelListV1: Pext_foreign_toplevel_list_v1); cdecl;
  end;

  Pext_foreign_toplevel_handle_v1_listener = ^Text_foreign_toplevel_handle_v1_listener;
  Text_foreign_toplevel_handle_v1_listener = record
    closed : procedure(data: Pointer; AExtForeignToplevelHandleV1: Pext_foreign_toplevel_handle_v1); cdecl;
    done : procedure(data: Pointer; AExtForeignToplevelHandleV1: Pext_foreign_toplevel_handle_v1); cdecl;
    title : procedure(data: Pointer; AExtForeignToplevelHandleV1: Pext_foreign_toplevel_handle_v1; ATitle: Pchar); cdecl;
    app_id : procedure(data: Pointer; AExtForeignToplevelHandleV1: Pext_foreign_toplevel_handle_v1; AAppId: Pchar); cdecl;
    identifier : procedure(data: Pointer; AExtForeignToplevelHandleV1: Pext_foreign_toplevel_handle_v1; AIdentifier: Pchar); cdecl;
  end;



  TExtForeignToplevelListV1 = class;
  TExtForeignToplevelHandleV1 = class;


  IExtForeignToplevelListV1Listener = interface
  ['IExtForeignToplevelListV1Listener']
    procedure ext_foreign_toplevel_list_v1_toplevel(AExtForeignToplevelListV1: TExtForeignToplevelListV1; AToplevel: TExtForeignToplevelHandleV1);
    procedure ext_foreign_toplevel_list_v1_finished(AExtForeignToplevelListV1: TExtForeignToplevelListV1);
  end;

  IExtForeignToplevelHandleV1Listener = interface
  ['IExtForeignToplevelHandleV1Listener']
    procedure ext_foreign_toplevel_handle_v1_closed(AExtForeignToplevelHandleV1: TExtForeignToplevelHandleV1);
    procedure ext_foreign_toplevel_handle_v1_done(AExtForeignToplevelHandleV1: TExtForeignToplevelHandleV1);
    procedure ext_foreign_toplevel_handle_v1_title(AExtForeignToplevelHandleV1: TExtForeignToplevelHandleV1; ATitle: String);
    procedure ext_foreign_toplevel_handle_v1_app_id(AExtForeignToplevelHandleV1: TExtForeignToplevelHandleV1; AAppId: String);
    procedure ext_foreign_toplevel_handle_v1_identifier(AExtForeignToplevelHandleV1: TExtForeignToplevelHandleV1; AIdentifier: String);
  end;




  TExtForeignToplevelListV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _STOP = 0;
    const _DESTROY = 1;
  public
    procedure Stop;
    destructor Destroy; override;
    function AddListener(AIntf: IExtForeignToplevelListV1Listener): LongInt;
  end;

  TExtForeignToplevelHandleV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IExtForeignToplevelHandleV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  ext_foreign_toplevel_list_v1_interface: Twl_interface;
  EXT_FOREIGN_TOPLEVEL_LIST_V1_INTERFACE_NAME: String = 'ext_foreign_toplevel_list_v1';
  ext_foreign_toplevel_handle_v1_interface: Twl_interface;
  EXT_FOREIGN_TOPLEVEL_HANDLE_V1_INTERFACE_NAME: String = 'ext_foreign_toplevel_handle_v1';



implementation

var
  vIntf_ext_foreign_toplevel_list_v1_Listener: Text_foreign_toplevel_list_v1_listener;
  vIntf_ext_foreign_toplevel_handle_v1_Listener: Text_foreign_toplevel_handle_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TExtForeignToplevelListV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

procedure TExtForeignToplevelListV1.Stop;
begin
  wl_proxy_marshal(FProxy, _STOP);
end;

destructor TExtForeignToplevelListV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtForeignToplevelListV1.AddListener(AIntf: IExtForeignToplevelListV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_foreign_toplevel_list_v1_Listener, @FUserDataRec);
end;
constructor TExtForeignToplevelHandleV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TExtForeignToplevelHandleV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtForeignToplevelHandleV1.AddListener(AIntf: IExtForeignToplevelHandleV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_foreign_toplevel_handle_v1_Listener, @FUserDataRec);
end;




procedure ext_foreign_toplevel_list_v1_toplevel_Intf(AData: PWLUserData; Aext_foreign_toplevel_list_v1: Pext_foreign_toplevel_list_v1; AToplevel: Pext_foreign_toplevel_handle_v1); cdecl;
var
  AIntf: IExtForeignToplevelListV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtForeignToplevelListV1Listener(AData^.ListenerUserData);
  AIntf.ext_foreign_toplevel_list_v1_toplevel(TExtForeignToplevelListV1(AData^.PascalObject),  TExtForeignToplevelHandleV1.Create(AToplevel));
end;

procedure ext_foreign_toplevel_list_v1_finished_Intf(AData: PWLUserData; Aext_foreign_toplevel_list_v1: Pext_foreign_toplevel_list_v1); cdecl;
var
  AIntf: IExtForeignToplevelListV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtForeignToplevelListV1Listener(AData^.ListenerUserData);
  AIntf.ext_foreign_toplevel_list_v1_finished(TExtForeignToplevelListV1(AData^.PascalObject));
end;

procedure ext_foreign_toplevel_handle_v1_closed_Intf(AData: PWLUserData; Aext_foreign_toplevel_handle_v1: Pext_foreign_toplevel_handle_v1); cdecl;
var
  AIntf: IExtForeignToplevelHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtForeignToplevelHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_foreign_toplevel_handle_v1_closed(TExtForeignToplevelHandleV1(AData^.PascalObject));
end;

procedure ext_foreign_toplevel_handle_v1_done_Intf(AData: PWLUserData; Aext_foreign_toplevel_handle_v1: Pext_foreign_toplevel_handle_v1); cdecl;
var
  AIntf: IExtForeignToplevelHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtForeignToplevelHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_foreign_toplevel_handle_v1_done(TExtForeignToplevelHandleV1(AData^.PascalObject));
end;

procedure ext_foreign_toplevel_handle_v1_title_Intf(AData: PWLUserData; Aext_foreign_toplevel_handle_v1: Pext_foreign_toplevel_handle_v1; ATitle: Pchar); cdecl;
var
  AIntf: IExtForeignToplevelHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtForeignToplevelHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_foreign_toplevel_handle_v1_title(TExtForeignToplevelHandleV1(AData^.PascalObject), ATitle);
end;

procedure ext_foreign_toplevel_handle_v1_app_id_Intf(AData: PWLUserData; Aext_foreign_toplevel_handle_v1: Pext_foreign_toplevel_handle_v1; AAppId: Pchar); cdecl;
var
  AIntf: IExtForeignToplevelHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtForeignToplevelHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_foreign_toplevel_handle_v1_app_id(TExtForeignToplevelHandleV1(AData^.PascalObject), AAppId);
end;

procedure ext_foreign_toplevel_handle_v1_identifier_Intf(AData: PWLUserData; Aext_foreign_toplevel_handle_v1: Pext_foreign_toplevel_handle_v1; AIdentifier: Pchar); cdecl;
var
  AIntf: IExtForeignToplevelHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtForeignToplevelHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_foreign_toplevel_handle_v1_identifier(TExtForeignToplevelHandleV1(AData^.PascalObject), AIdentifier);
end;



const
  pInterfaces: array[0..7] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil)
  );

  ext_foreign_toplevel_list_v1_requests: array[0..1] of Twl_message = (
    (name: 'stop'; signature: ''; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_foreign_toplevel_list_v1_events: array[0..1] of Twl_message = (
    (name: 'toplevel'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'finished'; signature: ''; types: @pInterfaces[0])
  );
  ext_foreign_toplevel_handle_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_foreign_toplevel_handle_v1_events: array[0..4] of Twl_message = (
    (name: 'closed'; signature: ''; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'title'; signature: 's'; types: @pInterfaces[0]),
    (name: 'app_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'identifier'; signature: 's'; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_ext_foreign_toplevel_list_v1_Listener.toplevel) := @ext_foreign_toplevel_list_v1_toplevel_Intf;
  Pointer(vIntf_ext_foreign_toplevel_list_v1_Listener.finished) := @ext_foreign_toplevel_list_v1_finished_Intf;
  Pointer(vIntf_ext_foreign_toplevel_handle_v1_Listener.closed) := @ext_foreign_toplevel_handle_v1_closed_Intf;
  Pointer(vIntf_ext_foreign_toplevel_handle_v1_Listener.done) := @ext_foreign_toplevel_handle_v1_done_Intf;
  Pointer(vIntf_ext_foreign_toplevel_handle_v1_Listener.title) := @ext_foreign_toplevel_handle_v1_title_Intf;
  Pointer(vIntf_ext_foreign_toplevel_handle_v1_Listener.app_id) := @ext_foreign_toplevel_handle_v1_app_id_Intf;
  Pointer(vIntf_ext_foreign_toplevel_handle_v1_Listener.identifier) := @ext_foreign_toplevel_handle_v1_identifier_Intf;


  ext_foreign_toplevel_list_v1_interface.name := PChar(EXT_FOREIGN_TOPLEVEL_LIST_V1_INTERFACE_NAME);
  ext_foreign_toplevel_list_v1_interface.version := 1;
  ext_foreign_toplevel_list_v1_interface.method_count := 2;
  ext_foreign_toplevel_list_v1_interface.methods := @ext_foreign_toplevel_list_v1_requests;
  ext_foreign_toplevel_list_v1_interface.event_count := 2;
  ext_foreign_toplevel_list_v1_interface.events := @ext_foreign_toplevel_list_v1_events;

  ext_foreign_toplevel_handle_v1_interface.name := PChar(EXT_FOREIGN_TOPLEVEL_HANDLE_V1_INTERFACE_NAME);
  ext_foreign_toplevel_handle_v1_interface.version := 1;
  ext_foreign_toplevel_handle_v1_interface.method_count := 1;
  ext_foreign_toplevel_handle_v1_interface.methods := @ext_foreign_toplevel_handle_v1_requests;
  ext_foreign_toplevel_handle_v1_interface.event_count := 5;
  ext_foreign_toplevel_handle_v1_interface.events := @ext_foreign_toplevel_handle_v1_events;

end;

end.
