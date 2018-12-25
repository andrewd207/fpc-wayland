{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit WaylandUnstablePkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  fullscreen_shell_unstable_v1_protocol, idle_inhibit_unstable_v1_protocol, 
  input_method_unstable_v1_protocol, input_timestamps_unstable_v1_protocol, 
  keyboard_shortcuts_inhibit_unstable_v1_protocol, 
  linux_dmabuf_unstable_v1_protocol, 
  linux_explicit_synchronization_unstable_v1_protocol, 
  pointer_constraints_unstable_v1_protocol, 
  pointer_gestures_unstable_v1_protocol, 
  primary_selection_unstable_v1_protocol, 
  relative_pointer_unstable_v1_protocol, tablet_unstable_v1_protocol, 
  tablet_unstable_v2_protocol, text_input_unstable_v1_protocol, 
  text_input_unstable_v3_protocol, xdg_decoration_unstable_v1_protocol, 
  xdg_foreign_unstable_v1_protocol, xdg_foreign_unstable_v2_protocol, 
  xdg_output_unstable_v1_protocol, xdg_shell_unstable_v5_protocol, 
  xdg_shell_unstable_v6_protocol, xwayland_keyboard_grab_unstable_v1_protocol, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('WaylandUnstablePkg', @Register);
end.
