unit presentation_time_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_presentation = ^Twp_presentation;
  Twp_presentation = record end;
  Pwp_presentation_feedback = ^Twp_presentation_feedback;
  Twp_presentation_feedback = record end;
const
  WP_PRESENTATION_ERROR_INVALID_TIMESTAMP = 0; // invalid value in tv_nsec
  WP_PRESENTATION_ERROR_INVALID_FLAG = 1; // invalid flag

type
  Pwp_presentation_listener = ^Twp_presentation_listener;
  Twp_presentation_listener = record
    clock_id : procedure(data: Pointer; wp_presentation: Pwp_presentation; clk_id: cuint); cdecl;
  end;

const
  WP_PRESENTATION_FEEDBACK_KIND_VSYNC = $1; // presentation was vsync'd
  WP_PRESENTATION_FEEDBACK_KIND_HW_CLOCK = $2; // hardware provided the presentation timestamp
  WP_PRESENTATION_FEEDBACK_KIND_HW_COMPLETION = $4; // hardware signalled the start of the presentation
  WP_PRESENTATION_FEEDBACK_KIND_ZERO_COPY = $8; // presentation was done zero-copy

type
  Pwp_presentation_feedback_listener = ^Twp_presentation_feedback_listener;
  Twp_presentation_feedback_listener = record
    sync_output : procedure(data: Pointer; wp_presentation_feedback: Pwp_presentation_feedback; output: Pwl_output); cdecl;
    presented : procedure(data: Pointer; wp_presentation_feedback: Pwp_presentation_feedback; tv_sec_hi: cuint; tv_sec_lo: cuint; tv_nsec: cuint; refresh: cuint; seq_hi: cuint; seq_lo: cuint; flags: cuint); cdecl;
    discarded : procedure(data: Pointer; wp_presentation_feedback: Pwp_presentation_feedback); cdecl;
  end;



  Iwp_presentationListener = interface
  ['Iwp_presentationListener']
    procedure wp_presentation_clock_id(wp_presentation: Pwp_presentation; clk_id: cuint);
  end;

  Iwp_presentation_feedbackListener = interface
  ['Iwp_presentation_feedbackListener']
    procedure wp_presentation_feedback_sync_output(wp_presentation_feedback: Pwp_presentation_feedback; output: Pwl_output);
    procedure wp_presentation_feedback_presented(wp_presentation_feedback: Pwp_presentation_feedback; tv_sec_hi: cuint; tv_sec_lo: cuint; tv_nsec: cuint; refresh: cuint; seq_hi: cuint; seq_lo: cuint; flags: cuint);
    procedure wp_presentation_feedback_discarded(wp_presentation_feedback: Pwp_presentation_feedback);
  end;



procedure wp_presentation_destroy(wp_presentation: Pwp_presentation);
function  wp_presentation_feedback(wp_presentation: Pwp_presentation; surface: Pwl_surface): Pwp_presentation_feedback;
function  wp_presentation_add_listener(wp_presentation: Pwp_presentation; listener: Pwp_presentation_listener; data: Pointer): cint;
procedure  wp_presentation_add_listener(wp_presentation: Pwp_presentation; AIntf: Iwp_presentationListener);
procedure wp_presentation_set_user_data(wp_presentation: Pwp_presentation; user_data: Pointer);
function  wp_presentation_get_user_data(wp_presentation: Pwp_presentation): Pointer;
function  wp_presentation_get_version(wp_presentation: Pwp_presentation): cuint32;
function  wp_presentation_feedback_add_listener(wp_presentation_feedback: Pwp_presentation_feedback; listener: Pwp_presentation_feedback_listener; data: Pointer): cint;
procedure  wp_presentation_feedback_add_listener(wp_presentation_feedback: Pwp_presentation_feedback; AIntf: Iwp_presentation_feedbackListener);
procedure wp_presentation_feedback_set_user_data(wp_presentation_feedback: Pwp_presentation_feedback; user_data: Pointer);
function  wp_presentation_feedback_get_user_data(wp_presentation_feedback: Pwp_presentation_feedback): Pointer;
function  wp_presentation_feedback_get_version(wp_presentation_feedback: Pwp_presentation_feedback): cuint32;
procedure wp_presentation_feedback_destroy(wp_presentation_feedback: Pwp_presentation_feedback);



var
  wp_presentation_interface: Twl_interface;
  wp_presentation_feedback_interface: Twl_interface;



implementation

const
_WP_PRESENTATION_DESTROY = 0;
_WP_PRESENTATION_FEEDBACK = 1;


var
  vIntf_wp_presentation_Listener: Twp_presentation_listener;
  vIntf_wp_presentation_feedback_Listener: Twp_presentation_feedback_listener;



procedure wp_presentation_destroy(wp_presentation: Pwp_presentation);
begin
  wl_proxy_marshal(Pwl_proxy(wp_presentation), _WP_PRESENTATION_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wp_presentation));
end;

function  wp_presentation_feedback(wp_presentation: Pwp_presentation; surface: Pwl_surface): Pwp_presentation_feedback;
var
  callback: Pwl_proxy;
begin
  callback := wl_proxy_marshal_constructor(Pwl_proxy(wp_presentation),
      _WP_PRESENTATION_FEEDBACK, @wp_presentation_feedback_interface, nil, surface);
  Result := Pwp_presentation_feedback(callback);
end;

function  wp_presentation_add_listener(wp_presentation: Pwp_presentation; listener: Pwp_presentation_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wp_presentation), listener, data);
end;

procedure  wp_presentation_add_listener(wp_presentation: Pwp_presentation; AIntf: Iwp_presentationListener);
begin
  wp_presentation_add_listener(wp_presentation, @vIntf_wp_presentation_Listener, AIntf);
end;

procedure wp_presentation_set_user_data(wp_presentation: Pwp_presentation; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wp_presentation), user_data);
end;

function  wp_presentation_get_user_data(wp_presentation: Pwp_presentation): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wp_presentation));
end;

function  wp_presentation_get_version(wp_presentation: Pwp_presentation): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wp_presentation));
end;

function  wp_presentation_feedback_add_listener(wp_presentation_feedback: Pwp_presentation_feedback; listener: Pwp_presentation_feedback_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wp_presentation_feedback), listener, data);
end;

procedure  wp_presentation_feedback_add_listener(wp_presentation_feedback: Pwp_presentation_feedback; AIntf: Iwp_presentation_feedbackListener);
begin
  wp_presentation_feedback_add_listener(wp_presentation_feedback, @vIntf_wp_presentation_feedback_Listener, AIntf);
end;

procedure wp_presentation_feedback_set_user_data(wp_presentation_feedback: Pwp_presentation_feedback; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wp_presentation_feedback), user_data);
end;

function  wp_presentation_feedback_get_user_data(wp_presentation_feedback: Pwp_presentation_feedback): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wp_presentation_feedback));
end;

function  wp_presentation_feedback_get_version(wp_presentation_feedback: Pwp_presentation_feedback): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wp_presentation_feedback));
end;

procedure wp_presentation_feedback_destroy(wp_presentation_feedback: Pwp_presentation_feedback);
begin
  wl_proxy_destroy(Pwl_proxy(wp_presentation_feedback));
end;


procedure wp_presentation_clock_id_Intf(AIntf: Iwp_presentationListener; wp_presentation: Pwp_presentation; clk_id: cuint); cdecl;
begin
  WriteLn('wp_presentation.clock_id');
  AIntf.wp_presentation_clock_id(wp_presentation, clk_id);
end;

procedure wp_presentation_feedback_sync_output_Intf(AIntf: Iwp_presentation_feedbackListener; wp_presentation_feedback: Pwp_presentation_feedback; output: Pwl_output); cdecl;
begin
  WriteLn('wp_presentation_feedback.sync_output');
  AIntf.wp_presentation_feedback_sync_output(wp_presentation_feedback, output);
end;

procedure wp_presentation_feedback_presented_Intf(AIntf: Iwp_presentation_feedbackListener; wp_presentation_feedback: Pwp_presentation_feedback; tv_sec_hi: cuint; tv_sec_lo: cuint; tv_nsec: cuint; refresh: cuint; seq_hi: cuint; seq_lo: cuint; flags: cuint); cdecl;
begin
  WriteLn('wp_presentation_feedback.presented');
  AIntf.wp_presentation_feedback_presented(wp_presentation_feedback, tv_sec_hi, tv_sec_lo, tv_nsec, refresh, seq_hi, seq_lo, flags);
end;

procedure wp_presentation_feedback_discarded_Intf(AIntf: Iwp_presentation_feedbackListener; wp_presentation_feedback: Pwp_presentation_feedback); cdecl;
begin
  WriteLn('wp_presentation_feedback.discarded');
  AIntf.wp_presentation_feedback_discarded(wp_presentation_feedback);
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

initialization
  Pointer(vIntf_wp_presentation_Listener.clock_id) := @wp_presentation_clock_id_Intf;
  Pointer(vIntf_wp_presentation_feedback_Listener.sync_output) := @wp_presentation_feedback_sync_output_Intf;
  Pointer(vIntf_wp_presentation_feedback_Listener.presented) := @wp_presentation_feedback_presented_Intf;
  Pointer(vIntf_wp_presentation_feedback_Listener.discarded) := @wp_presentation_feedback_discarded_Intf;


  wp_presentation_interface.name := 'wp_presentation';
  wp_presentation_interface.version := 1;
  wp_presentation_interface.method_count := 2;
  wp_presentation_interface.methods := @wp_presentation_requests;
  wp_presentation_interface.event_count := 1;
  wp_presentation_interface.events := @wp_presentation_events;

  wp_presentation_feedback_interface.name := 'wp_presentation_feedback';
  wp_presentation_feedback_interface.version := 1;
  wp_presentation_feedback_interface.method_count := 0;
  wp_presentation_feedback_interface.methods := nil;
  wp_presentation_feedback_interface.event_count := 3;
  wp_presentation_feedback_interface.events := @wp_presentation_feedback_events;

end.
