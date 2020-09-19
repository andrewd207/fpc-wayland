unit fullscreen_shell_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_fullscreen_shell_v1 = Pointer;
  Pzwp_fullscreen_shell_mode_feedback_v1 = Pointer;
const
  ZWP_FULLSCREEN_SHELL_V1_CAPABILITY_ARBITRARY_MODES = 1; // compositor is capable of almost any output mode
  ZWP_FULLSCREEN_SHELL_V1_CAPABILITY_CURSOR_PLANE = 2; // compositor has a separate cursor plane
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT = 0; // no preference, apply default policy
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_CENTER = 1; // center the surface on the output
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_ZOOM = 2; // scale the surface, preserving aspect ratio, to the largest size that will fit on the output
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_ZOOM_CROP = 3; // scale the surface, preserving aspect ratio, to fully fill the output cropping if needed
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_STRETCH = 4; // scale the surface to the size of the output ignoring aspect ratio
  ZWP_FULLSCREEN_SHELL_V1_ERROR_INVALID_METHOD = 0; // present_method is not known

type
  Pzwp_fullscreen_shell_v1_listener = ^Tzwp_fullscreen_shell_v1_listener;
  Tzwp_fullscreen_shell_v1_listener = record
    capability : procedure(data: Pointer; AZwpFullscreenShellV1: Pzwp_fullscreen_shell_v1; ACapability: DWord); cdecl;
  end;

  Pzwp_fullscreen_shell_mode_feedback_v1_listener = ^Tzwp_fullscreen_shell_mode_feedback_v1_listener;
  Tzwp_fullscreen_shell_mode_feedback_v1_listener = record
    mode_successful : procedure(data: Pointer; AZwpFullscreenShellModeFeedbackV1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
    mode_failed : procedure(data: Pointer; AZwpFullscreenShellModeFeedbackV1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
    present_cancelled : procedure(data: Pointer; AZwpFullscreenShellModeFeedbackV1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
  end;



  TZwpFullscreenShellV1 = class;
  TZwpFullscreenShellModeFeedbackV1 = class;


  IZwpFullscreenShellV1Listener = interface
  ['IZwpFullscreenShellV1Listener']
    procedure zwp_fullscreen_shell_v1_capability(AZwpFullscreenShellV1: TZwpFullscreenShellV1; ACapability: DWord);
  end;

  IZwpFullscreenShellModeFeedbackV1Listener = interface
  ['IZwpFullscreenShellModeFeedbackV1Listener']
    procedure zwp_fullscreen_shell_mode_feedback_v1_mode_successful(AZwpFullscreenShellModeFeedbackV1: TZwpFullscreenShellModeFeedbackV1);
    procedure zwp_fullscreen_shell_mode_feedback_v1_mode_failed(AZwpFullscreenShellModeFeedbackV1: TZwpFullscreenShellModeFeedbackV1);
    procedure zwp_fullscreen_shell_mode_feedback_v1_present_cancelled(AZwpFullscreenShellModeFeedbackV1: TZwpFullscreenShellModeFeedbackV1);
  end;




  TZwpFullscreenShellV1 = class(TWLProxyObject)
  private
    const _RELEASE = 0;
    const _PRESENT_SURFACE = 1;
    const _PRESENT_SURFACE_FOR_MODE = 2;
  public
    destructor Destroy; override;
    procedure PresentSurface(ASurface: TWlSurface; AMethod: DWord; AOutput: TWlOutput);
    function PresentSurfaceForMode(ASurface: TWlSurface; AOutput: TWlOutput; AFramerate: LongInt; AProxyClass: TWLProxyObjectClass = nil {TZwpFullscreenShellModeFeedbackV1}): TZwpFullscreenShellModeFeedbackV1;
    function AddListener(AIntf: IZwpFullscreenShellV1Listener): LongInt;
  end;

  TZwpFullscreenShellModeFeedbackV1 = class(TWLProxyObject)
    function AddListener(AIntf: IZwpFullscreenShellModeFeedbackV1Listener): LongInt;
  end;






var
  zwp_fullscreen_shell_v1_interface: Twl_interface;
  zwp_fullscreen_shell_mode_feedback_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_fullscreen_shell_v1_Listener: Tzwp_fullscreen_shell_v1_listener;
  vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener: Tzwp_fullscreen_shell_mode_feedback_v1_listener;



destructor TZwpFullscreenShellV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

procedure TZwpFullscreenShellV1.PresentSurface(ASurface: TWlSurface; AMethod: DWord; AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _PRESENT_SURFACE, ASurface.Proxy, AMethod, AOutput.Proxy);
end;

function TZwpFullscreenShellV1.PresentSurfaceForMode(ASurface: TWlSurface; AOutput: TWlOutput; AFramerate: LongInt; AProxyClass: TWLProxyObjectClass = nil {TZwpFullscreenShellModeFeedbackV1}): TZwpFullscreenShellModeFeedbackV1;
var
  feedback: Pwl_proxy;
begin
  feedback := wl_proxy_marshal_constructor(FProxy,
      _PRESENT_SURFACE_FOR_MODE, @zwp_fullscreen_shell_mode_feedback_v1_interface, nil, ASurface.Proxy, AOutput.Proxy, AFramerate);
  if AProxyClass = nil then
    AProxyClass := TZwpFullscreenShellModeFeedbackV1;
  Result := TZwpFullscreenShellModeFeedbackV1(AProxyClass.Create(feedback));
  if not AProxyClass.InheritsFrom(TZwpFullscreenShellModeFeedbackV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpFullscreenShellModeFeedbackV1]);
end;

function TZwpFullscreenShellV1.AddListener(AIntf: IZwpFullscreenShellV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_fullscreen_shell_v1_Listener, @FUserDataRec);
end;
function TZwpFullscreenShellModeFeedbackV1.AddListener(AIntf: IZwpFullscreenShellModeFeedbackV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener, @FUserDataRec);
end;




procedure zwp_fullscreen_shell_v1_capability_Intf(AData: PWLUserData; Azwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; ACapability: DWord); cdecl;
var
  AIntf: IZwpFullscreenShellV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpFullscreenShellV1Listener(AData^.ListenerUserData);
  AIntf.zwp_fullscreen_shell_v1_capability(TZwpFullscreenShellV1(AData^.PascalObject), ACapability);
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_mode_successful_Intf(AData: PWLUserData; Azwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
var
  AIntf: IZwpFullscreenShellModeFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpFullscreenShellModeFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_fullscreen_shell_mode_feedback_v1_mode_successful(TZwpFullscreenShellModeFeedbackV1(AData^.PascalObject));
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_mode_failed_Intf(AData: PWLUserData; Azwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
var
  AIntf: IZwpFullscreenShellModeFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpFullscreenShellModeFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_fullscreen_shell_mode_feedback_v1_mode_failed(TZwpFullscreenShellModeFeedbackV1(AData^.PascalObject));
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_present_cancelled_Intf(AData: PWLUserData; Azwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
var
  AIntf: IZwpFullscreenShellModeFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpFullscreenShellModeFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_fullscreen_shell_mode_feedback_v1_present_cancelled(TZwpFullscreenShellModeFeedbackV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..14] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (@wl_output_interface),
    (@wl_surface_interface),
    (@wl_output_interface),
    (nil),
    (@zwp_fullscreen_shell_mode_feedback_v1_interface)
  );

  zwp_fullscreen_shell_v1_requests: array[0..2] of Twl_message = (
    (name: 'release'; signature: ''; types: @pInterfaces[0]),
    (name: 'present_surface'; signature: '?ou?o'; types: @pInterfaces[8]),
    (name: 'present_surface_for_mode'; signature: 'ooin'; types: @pInterfaces[11])
  );
  zwp_fullscreen_shell_v1_events: array[0..0] of Twl_message = (
    (name: 'capability'; signature: 'u'; types: @pInterfaces[0])
  );
  zwp_fullscreen_shell_mode_feedback_v1_events: array[0..2] of Twl_message = (
    (name: 'mode_successful'; signature: ''; types: @pInterfaces[0]),
    (name: 'mode_failed'; signature: ''; types: @pInterfaces[0]),
    (name: 'present_cancelled'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_fullscreen_shell_v1_Listener.capability) := @zwp_fullscreen_shell_v1_capability_Intf;
  Pointer(vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener.mode_successful) := @zwp_fullscreen_shell_mode_feedback_v1_mode_successful_Intf;
  Pointer(vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener.mode_failed) := @zwp_fullscreen_shell_mode_feedback_v1_mode_failed_Intf;
  Pointer(vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener.present_cancelled) := @zwp_fullscreen_shell_mode_feedback_v1_present_cancelled_Intf;


  zwp_fullscreen_shell_v1_interface.name := 'zwp_fullscreen_shell_v1';
  zwp_fullscreen_shell_v1_interface.version := 1;
  zwp_fullscreen_shell_v1_interface.method_count := 3;
  zwp_fullscreen_shell_v1_interface.methods := @zwp_fullscreen_shell_v1_requests;
  zwp_fullscreen_shell_v1_interface.event_count := 1;
  zwp_fullscreen_shell_v1_interface.events := @zwp_fullscreen_shell_v1_events;

  zwp_fullscreen_shell_mode_feedback_v1_interface.name := 'zwp_fullscreen_shell_mode_feedback_v1';
  zwp_fullscreen_shell_mode_feedback_v1_interface.version := 1;
  zwp_fullscreen_shell_mode_feedback_v1_interface.method_count := 0;
  zwp_fullscreen_shell_mode_feedback_v1_interface.methods := nil;
  zwp_fullscreen_shell_mode_feedback_v1_interface.event_count := 3;
  zwp_fullscreen_shell_mode_feedback_v1_interface.events := @zwp_fullscreen_shell_mode_feedback_v1_events;

end.
