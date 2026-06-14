{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit WaylandStagingPkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  alpha_modifier_v1_protocol, color_management_v1_protocol,
  color_representation_v1_protocol, commit_timing_v1_protocol,
  content_type_v1_protocol, cursor_shape_v1_protocol, drm_lease_v1_protocol,
  ext_background_effect_v1_protocol, ext_data_control_v1_protocol,
  ext_foreign_toplevel_list_v1_protocol, ext_idle_notify_v1_protocol,
  ext_image_capture_source_v1_protocol, ext_image_copy_capture_v1_protocol,
  ext_session_lock_v1_protocol, ext_transient_seat_v1_protocol,
  ext_workspace_v1_protocol, fifo_v1_protocol, fractional_scale_v1_protocol,
  linux_drm_syncobj_v1_protocol, pointer_warp_v1_protocol,
  security_context_v1_protocol, single_pixel_buffer_v1_protocol,
  tearing_control_v1_protocol, xdg_activation_v1_protocol,
  xdg_dialog_v1_protocol, xdg_system_bell_v1_protocol,
  xdg_toplevel_drag_v1_protocol, xdg_toplevel_icon_v1_protocol,
  xdg_toplevel_tag_v1_protocol, xwayland_shell_v1_protocol, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('WaylandStagingPkg', @Register);
end.
