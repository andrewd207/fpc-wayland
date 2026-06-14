unit presentation_time_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_presentation = Pointer;
  Pwp_presentation_feedback = Pointer;
const
  WP_PRESENTATION_ERROR_INVALID_TIMESTAMP = 0; // invalid value in tv_nsec
  WP_PRESENTATION_ERROR_INVALID_FLAG = 1; // invalid flag

type
  Pwp_presentation_listener = ^Twp_presentation_listener;
  Twp_presentation_listener = record
    clock_id : procedure(data: Pointer; AWpPresentation: Pwp_presentation; AClkId: DWord); cdecl;
  end;

const
  WP_PRESENTATION_FEEDBACK_KIND_VSYNC = $1; // 
  WP_PRESENTATION_FEEDBACK_KIND_HW_CLOCK = $2; // 
  WP_PRESENTATION_FEEDBACK_KIND_HW_COMPLETION = $4; // 
  WP_PRESENTATION_FEEDBACK_KIND_ZERO_COPY = $8; // 

type
  Pwp_presentation_feedback_listener = ^Twp_presentation_feedback_listener;
  Twp_presentation_feedback_listener = record
    sync_output : procedure(data: Pointer; AWpPresentationFeedback: Pwp_presentation_feedback; AOutput: Pwl_output); cdecl;
    presented : procedure(data: Pointer; AWpPresentationFeedback: Pwp_presentation_feedback; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord; ARefresh: DWord; ASeqHi: DWord; ASeqLo: DWord; AFlags: DWord); cdecl;
    discarded : procedure(data: Pointer; AWpPresentationFeedback: Pwp_presentation_feedback); cdecl;
  end;



  TWpPresentation = class;
  TWpPresentationFeedback = class;


  IWpPresentationListener = interface
  ['IWpPresentationListener']
    procedure wp_presentation_clock_id(AWpPresentation: TWpPresentation; AClkId: DWord);
  end;

  IWpPresentationFeedbackListener = interface
  ['IWpPresentationFeedbackListener']
    procedure wp_presentation_feedback_sync_output(AWpPresentationFeedback: TWpPresentationFeedback; AOutput: TWlOutput);
    procedure wp_presentation_feedback_presented(AWpPresentationFeedback: TWpPresentationFeedback; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord; ARefresh: DWord; ASeqHi: DWord; ASeqLo: DWord; AFlags: DWord);
    procedure wp_presentation_feedback_discarded(AWpPresentationFeedback: TWpPresentationFeedback);
  end;




  TWpPresentation = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _FEEDBACK = 1;
  public
    destructor Destroy; override;
    function Feedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpPresentationFeedback}): TWpPresentationFeedback;
    function AddListener(AIntf: IWpPresentationListener): LongInt;
  end;

  TWpPresentationFeedback = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
    function AddListener(AIntf: IWpPresentationFeedbackListener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_presentation_interface: Twl_interface;
  WP_PRESENTATION_INTERFACE_NAME: String = 'wp_presentation';
  wp_presentation_feedback_interface: Twl_interface;
  WP_PRESENTATION_FEEDBACK_INTERFACE_NAME: String = 'wp_presentation_feedback';



implementation

var
  vIntf_wp_presentation_Listener: Twp_presentation_listener;
  vIntf_wp_presentation_feedback_Listener: Twp_presentation_feedback_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpPresentation.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpPresentation.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPresentation.Feedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpPresentationFeedback}): TWpPresentationFeedback;
var
  callback: Pwl_proxy;
begin
  callback := wl_proxy_marshal_constructor(FProxy,
      _FEEDBACK, @wp_presentation_feedback_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpPresentationFeedback;
  Result := TWpPresentationFeedback(AProxyClass.Create(callback));
  if not AProxyClass.InheritsFrom(TWpPresentationFeedback) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpPresentationFeedback]);
end;

function TWpPresentation.AddListener(AIntf: IWpPresentationListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_presentation_Listener, @FUserDataRec);
end;
constructor TWpPresentationFeedback.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

function TWpPresentationFeedback.AddListener(AIntf: IWpPresentationFeedbackListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_presentation_feedback_Listener, @FUserDataRec);
end;




procedure wp_presentation_clock_id_Intf(AData: PWLUserData; Awp_presentation: Pwp_presentation; AClkId: DWord); cdecl;
var
  AIntf: IWpPresentationListener;
begin
  if AData = nil then Exit;
  AIntf := IWpPresentationListener(AData^.ListenerUserData);
  AIntf.wp_presentation_clock_id(TWpPresentation(AData^.PascalObject), AClkId);
end;

procedure wp_presentation_feedback_sync_output_Intf(AData: PWLUserData; Awp_presentation_feedback: Pwp_presentation_feedback; AOutput: Pwl_output); cdecl;
var
  AIntf: IWpPresentationFeedbackListener;
begin
  if AData = nil then Exit;
  AIntf := IWpPresentationFeedbackListener(AData^.ListenerUserData);
  AIntf.wp_presentation_feedback_sync_output(TWpPresentationFeedback(AData^.PascalObject),  TWlOutput(TWLProxyObject.WLToObj(AOutput)));
end;

procedure wp_presentation_feedback_presented_Intf(AData: PWLUserData; Awp_presentation_feedback: Pwp_presentation_feedback; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord; ARefresh: DWord; ASeqHi: DWord; ASeqLo: DWord; AFlags: DWord); cdecl;
var
  AIntf: IWpPresentationFeedbackListener;
begin
  if AData = nil then Exit;
  AIntf := IWpPresentationFeedbackListener(AData^.ListenerUserData);
  AIntf.wp_presentation_feedback_presented(TWpPresentationFeedback(AData^.PascalObject), ATvSecHi, ATvSecLo, ATvNsec, ARefresh, ASeqHi, ASeqLo, AFlags);
end;

procedure wp_presentation_feedback_discarded_Intf(AData: PWLUserData; Awp_presentation_feedback: Pwp_presentation_feedback); cdecl;
var
  AIntf: IWpPresentationFeedbackListener;
begin
  if AData = nil then Exit;
  AIntf := IWpPresentationFeedbackListener(AData^.ListenerUserData);
  AIntf.wp_presentation_feedback_discarded(TWpPresentationFeedback(AData^.PascalObject));
end;



const
  pInterfaces: array[0..10] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (@wp_presentation_feedback_interface),
    (@wl_output_interface)
  );

  wp_presentation_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'feedback'; signature: 'on'; types: @pInterfaces[8])
  );
  wp_presentation_events: array[0..0] of Twl_message = (
    (name: 'clock_id'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_presentation_feedback_events: array[0..2] of Twl_message = (
    (name: 'sync_output'; signature: 'o'; types: @pInterfaces[10]),
    (name: 'presented'; signature: 'uuuuuuu'; types: @pInterfaces[0]),
    (name: 'discarded'; signature: ''; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_wp_presentation_Listener.clock_id) := @wp_presentation_clock_id_Intf;
  Pointer(vIntf_wp_presentation_feedback_Listener.sync_output) := @wp_presentation_feedback_sync_output_Intf;
  Pointer(vIntf_wp_presentation_feedback_Listener.presented) := @wp_presentation_feedback_presented_Intf;
  Pointer(vIntf_wp_presentation_feedback_Listener.discarded) := @wp_presentation_feedback_discarded_Intf;


  wp_presentation_interface.name := PChar(WP_PRESENTATION_INTERFACE_NAME);
  wp_presentation_interface.version := 2;
  wp_presentation_interface.method_count := 2;
  wp_presentation_interface.methods := @wp_presentation_requests;
  wp_presentation_interface.event_count := 1;
  wp_presentation_interface.events := @wp_presentation_events;

  wp_presentation_feedback_interface.name := PChar(WP_PRESENTATION_FEEDBACK_INTERFACE_NAME);
  wp_presentation_feedback_interface.version := 2;
  wp_presentation_feedback_interface.method_count := 0;
  wp_presentation_feedback_interface.methods := nil;
  wp_presentation_feedback_interface.event_count := 3;
  wp_presentation_feedback_interface.events := @wp_presentation_feedback_events;

end;

end.
