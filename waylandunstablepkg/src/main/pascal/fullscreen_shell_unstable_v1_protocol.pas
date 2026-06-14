unit fullscreen_shell_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_fullscreen_shell_v1 = Pointer;
  Pwp_fullscreen_shell_mode_feedback_v1 = Pointer;
const
  WP_FULLSCREEN_SHELL_V1_CAPABILITY_ARBITRARY_MODES = 1; // compositor is capable of almost any output mode
  WP_FULLSCREEN_SHELL_V1_CAPABILITY_CURSOR_PLANE = 2; // compositor has a separate cursor plane
  WP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT = 0; // no preference, apply default policy
  WP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_CENTER = 1; // center the surface on the output
  WP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_ZOOM = 2; // scale the surface, preserving aspect ratio, to the largest size that will fit on the output
  WP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_ZOOM_CROP = 3; // scale the surface, preserving aspect ratio, to fully fill the output cropping if needed
  WP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_STRETCH = 4; // scale the surface to the size of the output ignoring aspect ratio
  WP_FULLSCREEN_SHELL_V1_ERROR_INVALID_METHOD = 0; // present_method is not known
  WP_FULLSCREEN_SHELL_V1_ERROR_ROLE = 1; // given wl_surface has another role

type
  Pwp_fullscreen_shell_v1_listener = ^Twp_fullscreen_shell_v1_listener;
  Twp_fullscreen_shell_v1_listener = record
    capability : procedure(data: Pointer; AWpFullscreenShellV1: Pwp_fullscreen_shell_v1; ACapability: DWord); cdecl;
  end;

  Pwp_fullscreen_shell_mode_feedback_v1_listener = ^Twp_fullscreen_shell_mode_feedback_v1_listener;
  Twp_fullscreen_shell_mode_feedback_v1_listener = record
    mode_successful : procedure(data: Pointer; AWpFullscreenShellModeFeedbackV1: Pwp_fullscreen_shell_mode_feedback_v1); cdecl;
    mode_failed : procedure(data: Pointer; AWpFullscreenShellModeFeedbackV1: Pwp_fullscreen_shell_mode_feedback_v1); cdecl;
    present_cancelled : procedure(data: Pointer; AWpFullscreenShellModeFeedbackV1: Pwp_fullscreen_shell_mode_feedback_v1); cdecl;
  end;



  TWpFullscreenShellV1 = class;
  TWpFullscreenShellModeFeedbackV1 = class;


  IWpFullscreenShellV1Listener = interface
  ['IWpFullscreenShellV1Listener']
    procedure wp_fullscreen_shell_v1_capability(AWpFullscreenShellV1: TWpFullscreenShellV1; ACapability: DWord);
  end;

  IWpFullscreenShellModeFeedbackV1Listener = interface
  ['IWpFullscreenShellModeFeedbackV1Listener']
    procedure wp_fullscreen_shell_mode_feedback_v1_mode_successful(AWpFullscreenShellModeFeedbackV1: TWpFullscreenShellModeFeedbackV1);
    procedure wp_fullscreen_shell_mode_feedback_v1_mode_failed(AWpFullscreenShellModeFeedbackV1: TWpFullscreenShellModeFeedbackV1);
    procedure wp_fullscreen_shell_mode_feedback_v1_present_cancelled(AWpFullscreenShellModeFeedbackV1: TWpFullscreenShellModeFeedbackV1);
  end;




  TWpFullscreenShellV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _RELEASE = 0;
    const _PRESENT_SURFACE = 1;
    const _PRESENT_SURFACE_FOR_MODE = 2;
  public
    procedure Release;
    procedure PresentSurface(ASurface: TWlSurface; AMethod: DWord; AOutput: TWlOutput);
    function PresentSurfaceForMode(ASurface: TWlSurface; AOutput: TWlOutput; AFramerate: LongInt; AProxyClass: TWLProxyObjectClass = nil {TWpFullscreenShellModeFeedbackV1}): TWpFullscreenShellModeFeedbackV1;
    function AddListener(AIntf: IWpFullscreenShellV1Listener): LongInt;
  end;

  TWpFullscreenShellModeFeedbackV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
    function AddListener(AIntf: IWpFullscreenShellModeFeedbackV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_fullscreen_shell_v1_interface: Twl_interface;
  WP_FULLSCREEN_SHELL_V1_INTERFACE_NAME: String = 'zwp_fullscreen_shell_v1';
  wp_fullscreen_shell_mode_feedback_v1_interface: Twl_interface;
  WP_FULLSCREEN_SHELL_MODE_FEEDBACK_V1_INTERFACE_NAME: String = 'zwp_fullscreen_shell_mode_feedback_v1';



implementation

var
  vIntf_wp_fullscreen_shell_v1_Listener: Twp_fullscreen_shell_v1_listener;
  vIntf_wp_fullscreen_shell_mode_feedback_v1_Listener: Twp_fullscreen_shell_mode_feedback_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpFullscreenShellV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

procedure TWpFullscreenShellV1.Release;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

procedure TWpFullscreenShellV1.PresentSurface(ASurface: TWlSurface; AMethod: DWord; AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _PRESENT_SURFACE, ASurface.Proxy, AMethod, AOutput.Proxy);
end;

function TWpFullscreenShellV1.PresentSurfaceForMode(ASurface: TWlSurface; AOutput: TWlOutput; AFramerate: LongInt; AProxyClass: TWLProxyObjectClass = nil {TWpFullscreenShellModeFeedbackV1}): TWpFullscreenShellModeFeedbackV1;
var
  feedback: Pwl_proxy;
begin
  feedback := wl_proxy_marshal_constructor(FProxy,
      _PRESENT_SURFACE_FOR_MODE, @wp_fullscreen_shell_mode_feedback_v1_interface, nil, ASurface.Proxy, AOutput.Proxy, AFramerate);
  if AProxyClass = nil then
    AProxyClass := TWpFullscreenShellModeFeedbackV1;
  Result := TWpFullscreenShellModeFeedbackV1(AProxyClass.Create(feedback));
  if not AProxyClass.InheritsFrom(TWpFullscreenShellModeFeedbackV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpFullscreenShellModeFeedbackV1]);
end;

function TWpFullscreenShellV1.AddListener(AIntf: IWpFullscreenShellV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_fullscreen_shell_v1_Listener, @FUserDataRec);
end;
constructor TWpFullscreenShellModeFeedbackV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

function TWpFullscreenShellModeFeedbackV1.AddListener(AIntf: IWpFullscreenShellModeFeedbackV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_fullscreen_shell_mode_feedback_v1_Listener, @FUserDataRec);
end;




procedure wp_fullscreen_shell_v1_capability_Intf(AData: PWLUserData; Awp_fullscreen_shell_v1: Pwp_fullscreen_shell_v1; ACapability: DWord); cdecl;
var
  AIntf: IWpFullscreenShellV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpFullscreenShellV1Listener(AData^.ListenerUserData);
  AIntf.wp_fullscreen_shell_v1_capability(TWpFullscreenShellV1(AData^.PascalObject), ACapability);
end;

procedure wp_fullscreen_shell_mode_feedback_v1_mode_successful_Intf(AData: PWLUserData; Awp_fullscreen_shell_mode_feedback_v1: Pwp_fullscreen_shell_mode_feedback_v1); cdecl;
var
  AIntf: IWpFullscreenShellModeFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpFullscreenShellModeFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_fullscreen_shell_mode_feedback_v1_mode_successful(TWpFullscreenShellModeFeedbackV1(AData^.PascalObject));
end;

procedure wp_fullscreen_shell_mode_feedback_v1_mode_failed_Intf(AData: PWLUserData; Awp_fullscreen_shell_mode_feedback_v1: Pwp_fullscreen_shell_mode_feedback_v1); cdecl;
var
  AIntf: IWpFullscreenShellModeFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpFullscreenShellModeFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_fullscreen_shell_mode_feedback_v1_mode_failed(TWpFullscreenShellModeFeedbackV1(AData^.PascalObject));
end;

procedure wp_fullscreen_shell_mode_feedback_v1_present_cancelled_Intf(AData: PWLUserData; Awp_fullscreen_shell_mode_feedback_v1: Pwp_fullscreen_shell_mode_feedback_v1); cdecl;
var
  AIntf: IWpFullscreenShellModeFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpFullscreenShellModeFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_fullscreen_shell_mode_feedback_v1_present_cancelled(TWpFullscreenShellModeFeedbackV1(AData^.PascalObject));
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
    (@wp_fullscreen_shell_mode_feedback_v1_interface)
  );

  wp_fullscreen_shell_v1_requests: array[0..2] of Twl_message = (
    (name: 'release'; signature: ''; types: @pInterfaces[0]),
    (name: 'present_surface'; signature: '?ou?o'; types: @pInterfaces[8]),
    (name: 'present_surface_for_mode'; signature: 'ooin'; types: @pInterfaces[11])
  );
  wp_fullscreen_shell_v1_events: array[0..0] of Twl_message = (
    (name: 'capability'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_fullscreen_shell_mode_feedback_v1_events: array[0..2] of Twl_message = (
    (name: 'mode_successful'; signature: ''; types: @pInterfaces[0]),
    (name: 'mode_failed'; signature: ''; types: @pInterfaces[0]),
    (name: 'present_cancelled'; signature: ''; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_wp_fullscreen_shell_v1_Listener.capability) := @wp_fullscreen_shell_v1_capability_Intf;
  Pointer(vIntf_wp_fullscreen_shell_mode_feedback_v1_Listener.mode_successful) := @wp_fullscreen_shell_mode_feedback_v1_mode_successful_Intf;
  Pointer(vIntf_wp_fullscreen_shell_mode_feedback_v1_Listener.mode_failed) := @wp_fullscreen_shell_mode_feedback_v1_mode_failed_Intf;
  Pointer(vIntf_wp_fullscreen_shell_mode_feedback_v1_Listener.present_cancelled) := @wp_fullscreen_shell_mode_feedback_v1_present_cancelled_Intf;


  wp_fullscreen_shell_v1_interface.name := PChar(WP_FULLSCREEN_SHELL_V1_INTERFACE_NAME);
  wp_fullscreen_shell_v1_interface.version := 1;
  wp_fullscreen_shell_v1_interface.method_count := 3;
  wp_fullscreen_shell_v1_interface.methods := @wp_fullscreen_shell_v1_requests;
  wp_fullscreen_shell_v1_interface.event_count := 1;
  wp_fullscreen_shell_v1_interface.events := @wp_fullscreen_shell_v1_events;

  wp_fullscreen_shell_mode_feedback_v1_interface.name := PChar(WP_FULLSCREEN_SHELL_MODE_FEEDBACK_V1_INTERFACE_NAME);
  wp_fullscreen_shell_mode_feedback_v1_interface.version := 1;
  wp_fullscreen_shell_mode_feedback_v1_interface.method_count := 0;
  wp_fullscreen_shell_mode_feedback_v1_interface.methods := nil;
  wp_fullscreen_shell_mode_feedback_v1_interface.event_count := 3;
  wp_fullscreen_shell_mode_feedback_v1_interface.events := @wp_fullscreen_shell_mode_feedback_v1_events;

end;

end.
