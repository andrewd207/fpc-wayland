unit ext_workspace_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pext_workspace_manager_v1 = Pointer;
  Pext_workspace_group_handle_v1 = Pointer;
  Pext_workspace_handle_v1 = Pointer;
  Pext_workspace_manager_v1_listener = ^Text_workspace_manager_v1_listener;
  Text_workspace_manager_v1_listener = record
    workspace_group : procedure(data: Pointer; AExtWorkspaceManagerV1: Pext_workspace_manager_v1; AWorkspaceGroup: Pext_workspace_group_handle_v1); cdecl;
    workspace : procedure(data: Pointer; AExtWorkspaceManagerV1: Pext_workspace_manager_v1; AWorkspace: Pext_workspace_handle_v1); cdecl;
    done : procedure(data: Pointer; AExtWorkspaceManagerV1: Pext_workspace_manager_v1); cdecl;
    finished : procedure(data: Pointer; AExtWorkspaceManagerV1: Pext_workspace_manager_v1); cdecl;
  end;

const
  EXT_WORKSPACE_GROUP_HANDLE_V1_GROUP_CAPABILITIES_CREATE_WORKSPACE = 1; // create_workspace request is available

type
  Pext_workspace_group_handle_v1_listener = ^Text_workspace_group_handle_v1_listener;
  Text_workspace_group_handle_v1_listener = record
    capabilities : procedure(data: Pointer; AExtWorkspaceGroupHandleV1: Pext_workspace_group_handle_v1; ACapabilities: DWord); cdecl;
    output_enter : procedure(data: Pointer; AExtWorkspaceGroupHandleV1: Pext_workspace_group_handle_v1; AOutput: Pwl_output); cdecl;
    output_leave : procedure(data: Pointer; AExtWorkspaceGroupHandleV1: Pext_workspace_group_handle_v1; AOutput: Pwl_output); cdecl;
    workspace_enter : procedure(data: Pointer; AExtWorkspaceGroupHandleV1: Pext_workspace_group_handle_v1; AWorkspace: Pext_workspace_handle_v1); cdecl;
    workspace_leave : procedure(data: Pointer; AExtWorkspaceGroupHandleV1: Pext_workspace_group_handle_v1; AWorkspace: Pext_workspace_handle_v1); cdecl;
    removed : procedure(data: Pointer; AExtWorkspaceGroupHandleV1: Pext_workspace_group_handle_v1); cdecl;
  end;

const
  EXT_WORKSPACE_HANDLE_V1_STATE_ACTIVE = 1; // the workspace is active
  EXT_WORKSPACE_HANDLE_V1_STATE_URGENT = 2; // the workspace requests attention
  EXT_WORKSPACE_HANDLE_V1_STATE_HIDDEN = 4; // 
  EXT_WORKSPACE_HANDLE_V1_WORKSPACE_CAPABILITIES_ACTIVATE = 1; // activate request is available
  EXT_WORKSPACE_HANDLE_V1_WORKSPACE_CAPABILITIES_DEACTIVATE = 2; // deactivate request is available
  EXT_WORKSPACE_HANDLE_V1_WORKSPACE_CAPABILITIES_REMOVE = 4; // remove request is available
  EXT_WORKSPACE_HANDLE_V1_WORKSPACE_CAPABILITIES_ASSIGN = 8; // assign request is available

type
  Pext_workspace_handle_v1_listener = ^Text_workspace_handle_v1_listener;
  Text_workspace_handle_v1_listener = record
    id : procedure(data: Pointer; AExtWorkspaceHandleV1: Pext_workspace_handle_v1; AId: Pchar); cdecl;
    name : procedure(data: Pointer; AExtWorkspaceHandleV1: Pext_workspace_handle_v1; AName: Pchar); cdecl;
    coordinates : procedure(data: Pointer; AExtWorkspaceHandleV1: Pext_workspace_handle_v1; ACoordinates: Pwl_array); cdecl;
    state : procedure(data: Pointer; AExtWorkspaceHandleV1: Pext_workspace_handle_v1; AState: DWord); cdecl;
    capabilities : procedure(data: Pointer; AExtWorkspaceHandleV1: Pext_workspace_handle_v1; ACapabilities: DWord); cdecl;
    removed : procedure(data: Pointer; AExtWorkspaceHandleV1: Pext_workspace_handle_v1); cdecl;
  end;



  TExtWorkspaceManagerV1 = class;
  TExtWorkspaceGroupHandleV1 = class;
  TExtWorkspaceHandleV1 = class;


  IExtWorkspaceManagerV1Listener = interface
  ['IExtWorkspaceManagerV1Listener']
    procedure ext_workspace_manager_v1_workspace_group(AExtWorkspaceManagerV1: TExtWorkspaceManagerV1; AWorkspaceGroup: TExtWorkspaceGroupHandleV1);
    procedure ext_workspace_manager_v1_workspace(AExtWorkspaceManagerV1: TExtWorkspaceManagerV1; AWorkspace: TExtWorkspaceHandleV1);
    procedure ext_workspace_manager_v1_done(AExtWorkspaceManagerV1: TExtWorkspaceManagerV1);
    procedure ext_workspace_manager_v1_finished(AExtWorkspaceManagerV1: TExtWorkspaceManagerV1);
  end;

  IExtWorkspaceGroupHandleV1Listener = interface
  ['IExtWorkspaceGroupHandleV1Listener']
    procedure ext_workspace_group_handle_v1_capabilities(AExtWorkspaceGroupHandleV1: TExtWorkspaceGroupHandleV1; ACapabilities: DWord);
    procedure ext_workspace_group_handle_v1_output_enter(AExtWorkspaceGroupHandleV1: TExtWorkspaceGroupHandleV1; AOutput: TWlOutput);
    procedure ext_workspace_group_handle_v1_output_leave(AExtWorkspaceGroupHandleV1: TExtWorkspaceGroupHandleV1; AOutput: TWlOutput);
    procedure ext_workspace_group_handle_v1_workspace_enter(AExtWorkspaceGroupHandleV1: TExtWorkspaceGroupHandleV1; AWorkspace: TExtWorkspaceHandleV1);
    procedure ext_workspace_group_handle_v1_workspace_leave(AExtWorkspaceGroupHandleV1: TExtWorkspaceGroupHandleV1; AWorkspace: TExtWorkspaceHandleV1);
    procedure ext_workspace_group_handle_v1_removed(AExtWorkspaceGroupHandleV1: TExtWorkspaceGroupHandleV1);
  end;

  IExtWorkspaceHandleV1Listener = interface
  ['IExtWorkspaceHandleV1Listener']
    procedure ext_workspace_handle_v1_id(AExtWorkspaceHandleV1: TExtWorkspaceHandleV1; AId: String);
    procedure ext_workspace_handle_v1_name(AExtWorkspaceHandleV1: TExtWorkspaceHandleV1; AName: String);
    procedure ext_workspace_handle_v1_coordinates(AExtWorkspaceHandleV1: TExtWorkspaceHandleV1; ACoordinates: Pwl_array);
    procedure ext_workspace_handle_v1_state(AExtWorkspaceHandleV1: TExtWorkspaceHandleV1; AState: DWord);
    procedure ext_workspace_handle_v1_capabilities(AExtWorkspaceHandleV1: TExtWorkspaceHandleV1; ACapabilities: DWord);
    procedure ext_workspace_handle_v1_removed(AExtWorkspaceHandleV1: TExtWorkspaceHandleV1);
  end;




  TExtWorkspaceManagerV1 = class(TWLProxyObject)
  private
    const _COMMIT = 0;
    const _STOP = 1;
  public
    procedure Commit;
    procedure Stop;
    function AddListener(AIntf: IExtWorkspaceManagerV1Listener): LongInt;
  end;

  TExtWorkspaceGroupHandleV1 = class(TWLProxyObject)
  private
    const _CREATE_WORKSPACE = 0;
    const _DESTROY = 1;
  public
    procedure CreateWorkspace(AWorkspace: String);
    destructor Destroy; override;
    function AddListener(AIntf: IExtWorkspaceGroupHandleV1Listener): LongInt;
  end;

  TExtWorkspaceHandleV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _ACTIVATE = 1;
    const _DEACTIVATE = 2;
    const _ASSIGN = 3;
    const _REMOVE = 4;
  public
    destructor Destroy; override;
    procedure Activate;
    procedure Deactivate;
    procedure Assign(AWorkspaceGroup: TExtWorkspaceGroupHandleV1);
    procedure Remove;
    function AddListener(AIntf: IExtWorkspaceHandleV1Listener): LongInt;
  end;






var
  ext_workspace_manager_v1_interface: Twl_interface;
  ext_workspace_group_handle_v1_interface: Twl_interface;
  ext_workspace_handle_v1_interface: Twl_interface;



implementation

var
  vIntf_ext_workspace_manager_v1_Listener: Text_workspace_manager_v1_listener;
  vIntf_ext_workspace_group_handle_v1_Listener: Text_workspace_group_handle_v1_listener;
  vIntf_ext_workspace_handle_v1_Listener: Text_workspace_handle_v1_listener;



procedure TExtWorkspaceManagerV1.Commit;
begin
  wl_proxy_marshal(FProxy, _COMMIT);
end;

procedure TExtWorkspaceManagerV1.Stop;
begin
  wl_proxy_marshal(FProxy, _STOP);
end;

function TExtWorkspaceManagerV1.AddListener(AIntf: IExtWorkspaceManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_workspace_manager_v1_Listener, @FUserDataRec);
end;
procedure TExtWorkspaceGroupHandleV1.CreateWorkspace(AWorkspace: String);
begin
  wl_proxy_marshal(FProxy, _CREATE_WORKSPACE, PChar(AWorkspace));
end;

destructor TExtWorkspaceGroupHandleV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtWorkspaceGroupHandleV1.AddListener(AIntf: IExtWorkspaceGroupHandleV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_workspace_group_handle_v1_Listener, @FUserDataRec);
end;
destructor TExtWorkspaceHandleV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TExtWorkspaceHandleV1.Activate;
begin
  wl_proxy_marshal(FProxy, _ACTIVATE);
end;

procedure TExtWorkspaceHandleV1.Deactivate;
begin
  wl_proxy_marshal(FProxy, _DEACTIVATE);
end;

procedure TExtWorkspaceHandleV1.Assign(AWorkspaceGroup: TExtWorkspaceGroupHandleV1);
begin
  wl_proxy_marshal(FProxy, _ASSIGN, AWorkspaceGroup.Proxy);
end;

procedure TExtWorkspaceHandleV1.Remove;
begin
  wl_proxy_marshal(FProxy, _REMOVE);
end;

function TExtWorkspaceHandleV1.AddListener(AIntf: IExtWorkspaceHandleV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_workspace_handle_v1_Listener, @FUserDataRec);
end;




procedure ext_workspace_manager_v1_workspace_group_Intf(AData: PWLUserData; Aext_workspace_manager_v1: Pext_workspace_manager_v1; AWorkspaceGroup: Pext_workspace_group_handle_v1); cdecl;
var
  AIntf: IExtWorkspaceManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceManagerV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_manager_v1_workspace_group(TExtWorkspaceManagerV1(AData^.PascalObject),  TExtWorkspaceGroupHandleV1.Create(AWorkspaceGroup));
end;

procedure ext_workspace_manager_v1_workspace_Intf(AData: PWLUserData; Aext_workspace_manager_v1: Pext_workspace_manager_v1; AWorkspace: Pext_workspace_handle_v1); cdecl;
var
  AIntf: IExtWorkspaceManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceManagerV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_manager_v1_workspace(TExtWorkspaceManagerV1(AData^.PascalObject),  TExtWorkspaceHandleV1.Create(AWorkspace));
end;

procedure ext_workspace_manager_v1_done_Intf(AData: PWLUserData; Aext_workspace_manager_v1: Pext_workspace_manager_v1); cdecl;
var
  AIntf: IExtWorkspaceManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceManagerV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_manager_v1_done(TExtWorkspaceManagerV1(AData^.PascalObject));
end;

procedure ext_workspace_manager_v1_finished_Intf(AData: PWLUserData; Aext_workspace_manager_v1: Pext_workspace_manager_v1); cdecl;
var
  AIntf: IExtWorkspaceManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceManagerV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_manager_v1_finished(TExtWorkspaceManagerV1(AData^.PascalObject));
end;

procedure ext_workspace_group_handle_v1_capabilities_Intf(AData: PWLUserData; Aext_workspace_group_handle_v1: Pext_workspace_group_handle_v1; ACapabilities: DWord); cdecl;
var
  AIntf: IExtWorkspaceGroupHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceGroupHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_group_handle_v1_capabilities(TExtWorkspaceGroupHandleV1(AData^.PascalObject), ACapabilities);
end;

procedure ext_workspace_group_handle_v1_output_enter_Intf(AData: PWLUserData; Aext_workspace_group_handle_v1: Pext_workspace_group_handle_v1; AOutput: Pwl_output); cdecl;
var
  AIntf: IExtWorkspaceGroupHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceGroupHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_group_handle_v1_output_enter(TExtWorkspaceGroupHandleV1(AData^.PascalObject),  TWlOutput(TWLProxyObject.WLToObj(AOutput)));
end;

procedure ext_workspace_group_handle_v1_output_leave_Intf(AData: PWLUserData; Aext_workspace_group_handle_v1: Pext_workspace_group_handle_v1; AOutput: Pwl_output); cdecl;
var
  AIntf: IExtWorkspaceGroupHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceGroupHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_group_handle_v1_output_leave(TExtWorkspaceGroupHandleV1(AData^.PascalObject),  TWlOutput(TWLProxyObject.WLToObj(AOutput)));
end;

procedure ext_workspace_group_handle_v1_workspace_enter_Intf(AData: PWLUserData; Aext_workspace_group_handle_v1: Pext_workspace_group_handle_v1; AWorkspace: Pext_workspace_handle_v1); cdecl;
var
  AIntf: IExtWorkspaceGroupHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceGroupHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_group_handle_v1_workspace_enter(TExtWorkspaceGroupHandleV1(AData^.PascalObject),  TExtWorkspaceHandleV1(TWLProxyObject.WLToObj(AWorkspace)));
end;

procedure ext_workspace_group_handle_v1_workspace_leave_Intf(AData: PWLUserData; Aext_workspace_group_handle_v1: Pext_workspace_group_handle_v1; AWorkspace: Pext_workspace_handle_v1); cdecl;
var
  AIntf: IExtWorkspaceGroupHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceGroupHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_group_handle_v1_workspace_leave(TExtWorkspaceGroupHandleV1(AData^.PascalObject),  TExtWorkspaceHandleV1(TWLProxyObject.WLToObj(AWorkspace)));
end;

procedure ext_workspace_group_handle_v1_removed_Intf(AData: PWLUserData; Aext_workspace_group_handle_v1: Pext_workspace_group_handle_v1); cdecl;
var
  AIntf: IExtWorkspaceGroupHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceGroupHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_group_handle_v1_removed(TExtWorkspaceGroupHandleV1(AData^.PascalObject));
end;

procedure ext_workspace_handle_v1_id_Intf(AData: PWLUserData; Aext_workspace_handle_v1: Pext_workspace_handle_v1; AId: Pchar); cdecl;
var
  AIntf: IExtWorkspaceHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_handle_v1_id(TExtWorkspaceHandleV1(AData^.PascalObject), AId);
end;

procedure ext_workspace_handle_v1_name_Intf(AData: PWLUserData; Aext_workspace_handle_v1: Pext_workspace_handle_v1; AName: Pchar); cdecl;
var
  AIntf: IExtWorkspaceHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_handle_v1_name(TExtWorkspaceHandleV1(AData^.PascalObject), AName);
end;

procedure ext_workspace_handle_v1_coordinates_Intf(AData: PWLUserData; Aext_workspace_handle_v1: Pext_workspace_handle_v1; ACoordinates: Pwl_array); cdecl;
var
  AIntf: IExtWorkspaceHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_handle_v1_coordinates(TExtWorkspaceHandleV1(AData^.PascalObject), ACoordinates);
end;

procedure ext_workspace_handle_v1_state_Intf(AData: PWLUserData; Aext_workspace_handle_v1: Pext_workspace_handle_v1; AState: DWord); cdecl;
var
  AIntf: IExtWorkspaceHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_handle_v1_state(TExtWorkspaceHandleV1(AData^.PascalObject), AState);
end;

procedure ext_workspace_handle_v1_capabilities_Intf(AData: PWLUserData; Aext_workspace_handle_v1: Pext_workspace_handle_v1; ACapabilities: DWord); cdecl;
var
  AIntf: IExtWorkspaceHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_handle_v1_capabilities(TExtWorkspaceHandleV1(AData^.PascalObject), ACapabilities);
end;

procedure ext_workspace_handle_v1_removed_Intf(AData: PWLUserData; Aext_workspace_handle_v1: Pext_workspace_handle_v1); cdecl;
var
  AIntf: IExtWorkspaceHandleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtWorkspaceHandleV1Listener(AData^.ListenerUserData);
  AIntf.ext_workspace_handle_v1_removed(TExtWorkspaceHandleV1(AData^.PascalObject));
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
    (@wl_output_interface),
    (@wl_output_interface),
    (@ext_workspace_handle_v1_interface),
    (@ext_workspace_handle_v1_interface),
    (@ext_workspace_group_handle_v1_interface)
  );

  ext_workspace_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'commit'; signature: ''; types: @pInterfaces[0]),
    (name: 'stop'; signature: ''; types: @pInterfaces[0])
  );
  ext_workspace_manager_v1_events: array[0..3] of Twl_message = (
    (name: 'workspace_group'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'workspace'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'finished'; signature: ''; types: @pInterfaces[0])
  );
  ext_workspace_group_handle_v1_requests: array[0..1] of Twl_message = (
    (name: 'create_workspace'; signature: 's'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_workspace_group_handle_v1_events: array[0..5] of Twl_message = (
    (name: 'capabilities'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'output_enter'; signature: 'o'; types: @pInterfaces[8]),
    (name: 'output_leave'; signature: 'o'; types: @pInterfaces[9]),
    (name: 'workspace_enter'; signature: 'o'; types: @pInterfaces[10]),
    (name: 'workspace_leave'; signature: 'o'; types: @pInterfaces[11]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0])
  );
  ext_workspace_handle_v1_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'activate'; signature: ''; types: @pInterfaces[0]),
    (name: 'deactivate'; signature: ''; types: @pInterfaces[0]),
    (name: 'assign'; signature: 'o'; types: @pInterfaces[12]),
    (name: 'remove'; signature: ''; types: @pInterfaces[0])
  );
  ext_workspace_handle_v1_events: array[0..5] of Twl_message = (
    (name: 'id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'name'; signature: 's'; types: @pInterfaces[0]),
    (name: 'coordinates'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'state'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'capabilities'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_ext_workspace_manager_v1_Listener.workspace_group) := @ext_workspace_manager_v1_workspace_group_Intf;
  Pointer(vIntf_ext_workspace_manager_v1_Listener.workspace) := @ext_workspace_manager_v1_workspace_Intf;
  Pointer(vIntf_ext_workspace_manager_v1_Listener.done) := @ext_workspace_manager_v1_done_Intf;
  Pointer(vIntf_ext_workspace_manager_v1_Listener.finished) := @ext_workspace_manager_v1_finished_Intf;
  Pointer(vIntf_ext_workspace_group_handle_v1_Listener.capabilities) := @ext_workspace_group_handle_v1_capabilities_Intf;
  Pointer(vIntf_ext_workspace_group_handle_v1_Listener.output_enter) := @ext_workspace_group_handle_v1_output_enter_Intf;
  Pointer(vIntf_ext_workspace_group_handle_v1_Listener.output_leave) := @ext_workspace_group_handle_v1_output_leave_Intf;
  Pointer(vIntf_ext_workspace_group_handle_v1_Listener.workspace_enter) := @ext_workspace_group_handle_v1_workspace_enter_Intf;
  Pointer(vIntf_ext_workspace_group_handle_v1_Listener.workspace_leave) := @ext_workspace_group_handle_v1_workspace_leave_Intf;
  Pointer(vIntf_ext_workspace_group_handle_v1_Listener.removed) := @ext_workspace_group_handle_v1_removed_Intf;
  Pointer(vIntf_ext_workspace_handle_v1_Listener.id) := @ext_workspace_handle_v1_id_Intf;
  Pointer(vIntf_ext_workspace_handle_v1_Listener.name) := @ext_workspace_handle_v1_name_Intf;
  Pointer(vIntf_ext_workspace_handle_v1_Listener.coordinates) := @ext_workspace_handle_v1_coordinates_Intf;
  Pointer(vIntf_ext_workspace_handle_v1_Listener.state) := @ext_workspace_handle_v1_state_Intf;
  Pointer(vIntf_ext_workspace_handle_v1_Listener.capabilities) := @ext_workspace_handle_v1_capabilities_Intf;
  Pointer(vIntf_ext_workspace_handle_v1_Listener.removed) := @ext_workspace_handle_v1_removed_Intf;


  ext_workspace_manager_v1_interface.name := 'ext_workspace_manager_v1';
  ext_workspace_manager_v1_interface.version := 1;
  ext_workspace_manager_v1_interface.method_count := 2;
  ext_workspace_manager_v1_interface.methods := @ext_workspace_manager_v1_requests;
  ext_workspace_manager_v1_interface.event_count := 4;
  ext_workspace_manager_v1_interface.events := @ext_workspace_manager_v1_events;

  ext_workspace_group_handle_v1_interface.name := 'ext_workspace_group_handle_v1';
  ext_workspace_group_handle_v1_interface.version := 1;
  ext_workspace_group_handle_v1_interface.method_count := 2;
  ext_workspace_group_handle_v1_interface.methods := @ext_workspace_group_handle_v1_requests;
  ext_workspace_group_handle_v1_interface.event_count := 6;
  ext_workspace_group_handle_v1_interface.events := @ext_workspace_group_handle_v1_events;

  ext_workspace_handle_v1_interface.name := 'ext_workspace_handle_v1';
  ext_workspace_handle_v1_interface.version := 1;
  ext_workspace_handle_v1_interface.method_count := 5;
  ext_workspace_handle_v1_interface.methods := @ext_workspace_handle_v1_requests;
  ext_workspace_handle_v1_interface.event_count := 6;
  ext_workspace_handle_v1_interface.events := @ext_workspace_handle_v1_events;

end.
