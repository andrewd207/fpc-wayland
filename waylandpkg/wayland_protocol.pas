unit wayland_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core;


type
  Pwl_display = ^Twl_display;
  Twl_display = record end;
  Pwl_registry = ^Twl_registry;
  Twl_registry = record end;
  Pwl_callback = ^Twl_callback;
  Twl_callback = record end;
  Pwl_compositor = ^Twl_compositor;
  Twl_compositor = record end;
  Pwl_shm_pool = ^Twl_shm_pool;
  Twl_shm_pool = record end;
  Pwl_shm = ^Twl_shm;
  Twl_shm = record end;
  Pwl_buffer = ^Twl_buffer;
  Twl_buffer = record end;
  Pwl_data_offer = ^Twl_data_offer;
  Twl_data_offer = record end;
  Pwl_data_source = ^Twl_data_source;
  Twl_data_source = record end;
  Pwl_data_device = ^Twl_data_device;
  Twl_data_device = record end;
  Pwl_data_device_manager = ^Twl_data_device_manager;
  Twl_data_device_manager = record end;
  Pwl_shell = ^Twl_shell;
  Twl_shell = record end;
  Pwl_shell_surface = ^Twl_shell_surface;
  Twl_shell_surface = record end;
  Pwl_surface = ^Twl_surface;
  Twl_surface = record end;
  Pwl_seat = ^Twl_seat;
  Twl_seat = record end;
  Pwl_pointer = ^Twl_pointer;
  Twl_pointer = record end;
  Pwl_keyboard = ^Twl_keyboard;
  Twl_keyboard = record end;
  Pwl_touch = ^Twl_touch;
  Twl_touch = record end;
  Pwl_output = ^Twl_output;
  Twl_output = record end;
  Pwl_region = ^Twl_region;
  Twl_region = record end;
  Pwl_subcompositor = ^Twl_subcompositor;
  Twl_subcompositor = record end;
  Pwl_subsurface = ^Twl_subsurface;
  Twl_subsurface = record end;
const
  WL_DISPLAY_ERROR_INVALID_OBJECT = 0; // server couldn't find object
  WL_DISPLAY_ERROR_INVALID_METHOD = 1; // method doesn't exist on the specified interface
  WL_DISPLAY_ERROR_NO_MEMORY = 2; // server is out of memory

type
  Pwl_display_listener = ^Twl_display_listener;
  Twl_display_listener = record
    error : procedure(data: Pointer; wl_display: Pwl_display; object_id: pointer; code: cuint; message: pchar); cdecl;
    delete_id : procedure(data: Pointer; wl_display: Pwl_display; id: cuint); cdecl;
  end;

  Pwl_registry_listener = ^Twl_registry_listener;
  Twl_registry_listener = record
    global : procedure(data: Pointer; wl_registry: Pwl_registry; name: cuint; &interface: pchar; version: cuint); cdecl;
    global_remove : procedure(data: Pointer; wl_registry: Pwl_registry; name: cuint); cdecl;
  end;

  Pwl_callback_listener = ^Twl_callback_listener;
  Twl_callback_listener = record
    done : procedure(data: Pointer; wl_callback: Pwl_callback; callback_data: cuint); cdecl;
  end;

  Pwl_compositor_listener = ^Twl_compositor_listener;
  Twl_compositor_listener = record
  end;

  Pwl_shm_pool_listener = ^Twl_shm_pool_listener;
  Twl_shm_pool_listener = record
  end;

const
  WL_SHM_ERROR_INVALID_FORMAT = 0; // buffer format is not known
  WL_SHM_ERROR_INVALID_STRIDE = 1; // invalid size or stride during pool or buffer creation
  WL_SHM_ERROR_INVALID_FD = 2; // mmapping the file descriptor failed
  WL_SHM_FORMAT_ARGB8888 = 0; // 32-bit ARGB format, [31:0] A:R:G:B 8:8:8:8 little endian
  WL_SHM_FORMAT_XRGB8888 = 1; // 32-bit RGB format, [31:0] x:R:G:B 8:8:8:8 little endian
  WL_SHM_FORMAT_C8 = $20203843; // 8-bit color index format, [7:0] C
  WL_SHM_FORMAT_RGB332 = $38424752; // 8-bit RGB format, [7:0] R:G:B 3:3:2
  WL_SHM_FORMAT_BGR233 = $38524742; // 8-bit BGR format, [7:0] B:G:R 2:3:3
  WL_SHM_FORMAT_XRGB4444 = $32315258; // 16-bit xRGB format, [15:0] x:R:G:B 4:4:4:4 little endian
  WL_SHM_FORMAT_XBGR4444 = $32314258; // 16-bit xBGR format, [15:0] x:B:G:R 4:4:4:4 little endian
  WL_SHM_FORMAT_RGBX4444 = $32315852; // 16-bit RGBx format, [15:0] R:G:B:x 4:4:4:4 little endian
  WL_SHM_FORMAT_BGRX4444 = $32315842; // 16-bit BGRx format, [15:0] B:G:R:x 4:4:4:4 little endian
  WL_SHM_FORMAT_ARGB4444 = $32315241; // 16-bit ARGB format, [15:0] A:R:G:B 4:4:4:4 little endian
  WL_SHM_FORMAT_ABGR4444 = $32314241; // 16-bit ABGR format, [15:0] A:B:G:R 4:4:4:4 little endian
  WL_SHM_FORMAT_RGBA4444 = $32314152; // 16-bit RBGA format, [15:0] R:G:B:A 4:4:4:4 little endian
  WL_SHM_FORMAT_BGRA4444 = $32314142; // 16-bit BGRA format, [15:0] B:G:R:A 4:4:4:4 little endian
  WL_SHM_FORMAT_XRGB1555 = $35315258; // 16-bit xRGB format, [15:0] x:R:G:B 1:5:5:5 little endian
  WL_SHM_FORMAT_XBGR1555 = $35314258; // 16-bit xBGR 1555 format, [15:0] x:B:G:R 1:5:5:5 little endian
  WL_SHM_FORMAT_RGBX5551 = $35315852; // 16-bit RGBx 5551 format, [15:0] R:G:B:x 5:5:5:1 little endian
  WL_SHM_FORMAT_BGRX5551 = $35315842; // 16-bit BGRx 5551 format, [15:0] B:G:R:x 5:5:5:1 little endian
  WL_SHM_FORMAT_ARGB1555 = $35315241; // 16-bit ARGB 1555 format, [15:0] A:R:G:B 1:5:5:5 little endian
  WL_SHM_FORMAT_ABGR1555 = $35314241; // 16-bit ABGR 1555 format, [15:0] A:B:G:R 1:5:5:5 little endian
  WL_SHM_FORMAT_RGBA5551 = $35314152; // 16-bit RGBA 5551 format, [15:0] R:G:B:A 5:5:5:1 little endian
  WL_SHM_FORMAT_BGRA5551 = $35314142; // 16-bit BGRA 5551 format, [15:0] B:G:R:A 5:5:5:1 little endian
  WL_SHM_FORMAT_RGB565 = $36314752; // 16-bit RGB 565 format, [15:0] R:G:B 5:6:5 little endian
  WL_SHM_FORMAT_BGR565 = $36314742; // 16-bit BGR 565 format, [15:0] B:G:R 5:6:5 little endian
  WL_SHM_FORMAT_RGB888 = $34324752; // 24-bit RGB format, [23:0] R:G:B little endian
  WL_SHM_FORMAT_BGR888 = $34324742; // 24-bit BGR format, [23:0] B:G:R little endian
  WL_SHM_FORMAT_XBGR8888 = $34324258; // 32-bit xBGR format, [31:0] x:B:G:R 8:8:8:8 little endian
  WL_SHM_FORMAT_RGBX8888 = $34325852; // 32-bit RGBx format, [31:0] R:G:B:x 8:8:8:8 little endian
  WL_SHM_FORMAT_BGRX8888 = $34325842; // 32-bit BGRx format, [31:0] B:G:R:x 8:8:8:8 little endian
  WL_SHM_FORMAT_ABGR8888 = $34324241; // 32-bit ABGR format, [31:0] A:B:G:R 8:8:8:8 little endian
  WL_SHM_FORMAT_RGBA8888 = $34324152; // 32-bit RGBA format, [31:0] R:G:B:A 8:8:8:8 little endian
  WL_SHM_FORMAT_BGRA8888 = $34324142; // 32-bit BGRA format, [31:0] B:G:R:A 8:8:8:8 little endian
  WL_SHM_FORMAT_XRGB2101010 = $30335258; // 32-bit xRGB format, [31:0] x:R:G:B 2:10:10:10 little endian
  WL_SHM_FORMAT_XBGR2101010 = $30334258; // 32-bit xBGR format, [31:0] x:B:G:R 2:10:10:10 little endian
  WL_SHM_FORMAT_RGBX1010102 = $30335852; // 32-bit RGBx format, [31:0] R:G:B:x 10:10:10:2 little endian
  WL_SHM_FORMAT_BGRX1010102 = $30335842; // 32-bit BGRx format, [31:0] B:G:R:x 10:10:10:2 little endian
  WL_SHM_FORMAT_ARGB2101010 = $30335241; // 32-bit ARGB format, [31:0] A:R:G:B 2:10:10:10 little endian
  WL_SHM_FORMAT_ABGR2101010 = $30334241; // 32-bit ABGR format, [31:0] A:B:G:R 2:10:10:10 little endian
  WL_SHM_FORMAT_RGBA1010102 = $30334152; // 32-bit RGBA format, [31:0] R:G:B:A 10:10:10:2 little endian
  WL_SHM_FORMAT_BGRA1010102 = $30334142; // 32-bit BGRA format, [31:0] B:G:R:A 10:10:10:2 little endian
  WL_SHM_FORMAT_YUYV = $56595559; // packed YCbCr format, [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian
  WL_SHM_FORMAT_YVYU = $55595659; // packed YCbCr format, [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian
  WL_SHM_FORMAT_UYVY = $59565955; // packed YCbCr format, [31:0] Y1:Cr0:Y0:Cb0 8:8:8:8 little endian
  WL_SHM_FORMAT_VYUY = $59555956; // packed YCbCr format, [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian
  WL_SHM_FORMAT_AYUV = $56555941; // packed AYCbCr format, [31:0] A:Y:Cb:Cr 8:8:8:8 little endian
  WL_SHM_FORMAT_NV12 = $3231564e; // 2 plane YCbCr Cr:Cb format, 2x2 subsampled Cr:Cb plane
  WL_SHM_FORMAT_NV21 = $3132564e; // 2 plane YCbCr Cb:Cr format, 2x2 subsampled Cb:Cr plane
  WL_SHM_FORMAT_NV16 = $3631564e; // 2 plane YCbCr Cr:Cb format, 2x1 subsampled Cr:Cb plane
  WL_SHM_FORMAT_NV61 = $3136564e; // 2 plane YCbCr Cb:Cr format, 2x1 subsampled Cb:Cr plane
  WL_SHM_FORMAT_YUV410 = $39565559; // 3 plane YCbCr format, 4x4 subsampled Cb (1) and Cr (2) planes
  WL_SHM_FORMAT_YVU410 = $39555659; // 3 plane YCbCr format, 4x4 subsampled Cr (1) and Cb (2) planes
  WL_SHM_FORMAT_YUV411 = $31315559; // 3 plane YCbCr format, 4x1 subsampled Cb (1) and Cr (2) planes
  WL_SHM_FORMAT_YVU411 = $31315659; // 3 plane YCbCr format, 4x1 subsampled Cr (1) and Cb (2) planes
  WL_SHM_FORMAT_YUV420 = $32315559; // 3 plane YCbCr format, 2x2 subsampled Cb (1) and Cr (2) planes
  WL_SHM_FORMAT_YVU420 = $32315659; // 3 plane YCbCr format, 2x2 subsampled Cr (1) and Cb (2) planes
  WL_SHM_FORMAT_YUV422 = $36315559; // 3 plane YCbCr format, 2x1 subsampled Cb (1) and Cr (2) planes
  WL_SHM_FORMAT_YVU422 = $36315659; // 3 plane YCbCr format, 2x1 subsampled Cr (1) and Cb (2) planes
  WL_SHM_FORMAT_YUV444 = $34325559; // 3 plane YCbCr format, non-subsampled Cb (1) and Cr (2) planes
  WL_SHM_FORMAT_YVU444 = $34325659; // 3 plane YCbCr format, non-subsampled Cr (1) and Cb (2) planes

type
  Pwl_shm_listener = ^Twl_shm_listener;
  Twl_shm_listener = record
    format : procedure(data: Pointer; wl_shm: Pwl_shm; format: cuint); cdecl;
  end;

  Pwl_buffer_listener = ^Twl_buffer_listener;
  Twl_buffer_listener = record
    release : procedure(data: Pointer; wl_buffer: Pwl_buffer); cdecl;
  end;

const
  WL_DATA_OFFER_ERROR_INVALID_FINISH = 0; // finish request was called untimely
  WL_DATA_OFFER_ERROR_INVALID_ACTION_MASK = 1; // action mask contains invalid values
  WL_DATA_OFFER_ERROR_INVALID_ACTION = 2; // action argument has an invalid value
  WL_DATA_OFFER_ERROR_INVALID_OFFER = 3; // offer doesn't accept this request

type
  Pwl_data_offer_listener = ^Twl_data_offer_listener;
  Twl_data_offer_listener = record
    offer : procedure(data: Pointer; wl_data_offer: Pwl_data_offer; mime_type: pchar); cdecl;
    source_actions : procedure(data: Pointer; wl_data_offer: Pwl_data_offer; source_actions: cuint); cdecl;
    action : procedure(data: Pointer; wl_data_offer: Pwl_data_offer; dnd_action: cuint); cdecl;
  end;

const
  WL_DATA_SOURCE_ERROR_INVALID_ACTION_MASK = 0; // action mask contains invalid values
  WL_DATA_SOURCE_ERROR_INVALID_SOURCE = 1; // source doesn't accept this request

type
  Pwl_data_source_listener = ^Twl_data_source_listener;
  Twl_data_source_listener = record
    target : procedure(data: Pointer; wl_data_source: Pwl_data_source; mime_type: pchar); cdecl;
    send : procedure(data: Pointer; wl_data_source: Pwl_data_source; mime_type: pchar; fd: cint); cdecl;
    cancelled : procedure(data: Pointer; wl_data_source: Pwl_data_source); cdecl;
    dnd_drop_performed : procedure(data: Pointer; wl_data_source: Pwl_data_source); cdecl;
    dnd_finished : procedure(data: Pointer; wl_data_source: Pwl_data_source); cdecl;
    action : procedure(data: Pointer; wl_data_source: Pwl_data_source; dnd_action: cuint); cdecl;
  end;

const
  WL_DATA_DEVICE_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pwl_data_device_listener = ^Twl_data_device_listener;
  Twl_data_device_listener = record
    data_offer : procedure(data: Pointer; wl_data_device: Pwl_data_device; id: Pwl_data_offer); cdecl;
    enter : procedure(data: Pointer; wl_data_device: Pwl_data_device; serial: cuint; surface: Pwl_surface; x: cint32; y: cint32; id: Pwl_data_offer); cdecl;
    leave : procedure(data: Pointer; wl_data_device: Pwl_data_device); cdecl;
    motion : procedure(data: Pointer; wl_data_device: Pwl_data_device; time: cuint; x: cint32; y: cint32); cdecl;
    drop : procedure(data: Pointer; wl_data_device: Pwl_data_device); cdecl;
    selection : procedure(data: Pointer; wl_data_device: Pwl_data_device; id: Pwl_data_offer); cdecl;
  end;

const
  WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE = 0; // no action
  WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY = 1; // copy action
  WL_DATA_DEVICE_MANAGER_DND_ACTION_MOVE = 2; // move action
  WL_DATA_DEVICE_MANAGER_DND_ACTION_ASK = 4; // ask action

type
  Pwl_data_device_manager_listener = ^Twl_data_device_manager_listener;
  Twl_data_device_manager_listener = record
  end;

const
  WL_SHELL_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pwl_shell_listener = ^Twl_shell_listener;
  Twl_shell_listener = record
  end;

const
  WL_SHELL_SURFACE_RESIZE_NONE = 0; // no edge
  WL_SHELL_SURFACE_RESIZE_TOP = 1; // top edge
  WL_SHELL_SURFACE_RESIZE_BOTTOM = 2; // bottom edge
  WL_SHELL_SURFACE_RESIZE_LEFT = 4; // left edge
  WL_SHELL_SURFACE_RESIZE_TOP_LEFT = 5; // top and left edges
  WL_SHELL_SURFACE_RESIZE_BOTTOM_LEFT = 6; // bottom and left edges
  WL_SHELL_SURFACE_RESIZE_RIGHT = 8; // right edge
  WL_SHELL_SURFACE_RESIZE_TOP_RIGHT = 9; // top and right edges
  WL_SHELL_SURFACE_RESIZE_BOTTOM_RIGHT = 10; // bottom and right edges
  WL_SHELL_SURFACE_TRANSIENT_INACTIVE = $1; // do not set keyboard focus
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_DEFAULT = 0; // no preference, apply default policy
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_SCALE = 1; // scale, preserve the surface's aspect ratio and center on output
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_DRIVER = 2; // switch output mode to the smallest mode that can fit the surface, add black borders to compensate size mismatch
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_FILL = 3; // no upscaling, center on output and add black borders to compensate size mismatch

type
  Pwl_shell_surface_listener = ^Twl_shell_surface_listener;
  Twl_shell_surface_listener = record
    ping : procedure(data: Pointer; wl_shell_surface: Pwl_shell_surface; serial: cuint); cdecl;
    configure : procedure(data: Pointer; wl_shell_surface: Pwl_shell_surface; edges: cuint; width: cint; height: cint); cdecl;
    popup_done : procedure(data: Pointer; wl_shell_surface: Pwl_shell_surface); cdecl;
  end;

const
  WL_SURFACE_ERROR_INVALID_SCALE = 0; // buffer scale value is invalid
  WL_SURFACE_ERROR_INVALID_TRANSFORM = 1; // buffer transform value is invalid

type
  Pwl_surface_listener = ^Twl_surface_listener;
  Twl_surface_listener = record
    enter : procedure(data: Pointer; wl_surface: Pwl_surface; output: Pwl_output); cdecl;
    leave : procedure(data: Pointer; wl_surface: Pwl_surface; output: Pwl_output); cdecl;
  end;

const
  WL_SEAT_CAPABILITY_POINTER = 1; // the seat has pointer devices
  WL_SEAT_CAPABILITY_KEYBOARD = 2; // the seat has one or more keyboards
  WL_SEAT_CAPABILITY_TOUCH = 4; // the seat has touch devices

type
  Pwl_seat_listener = ^Twl_seat_listener;
  Twl_seat_listener = record
    capabilities : procedure(data: Pointer; wl_seat: Pwl_seat; capabilities: cuint); cdecl;
    name : procedure(data: Pointer; wl_seat: Pwl_seat; name: pchar); cdecl;
  end;

const
  WL_POINTER_ERROR_ROLE = 0; // given wl_surface has another role
  WL_POINTER_BUTTON_STATE_RELEASED = 0; // the button is not pressed
  WL_POINTER_BUTTON_STATE_PRESSED = 1; // the button is pressed
  WL_POINTER_AXIS_VERTICAL_SCROLL = 0; // vertical axis
  WL_POINTER_AXIS_HORIZONTAL_SCROLL = 1; // horizontal axis
  WL_POINTER_AXIS_SOURCE_WHEEL = 0; // a physical wheel rotation
  WL_POINTER_AXIS_SOURCE_FINGER = 1; // finger on a touch surface
  WL_POINTER_AXIS_SOURCE_CONTINUOUS = 2; // continuous coordinate space
  WL_POINTER_AXIS_SOURCE_WHEEL_TILT = 3; // a physical wheel tilt

type
  Pwl_pointer_listener = ^Twl_pointer_listener;
  Twl_pointer_listener = record
    enter : procedure(data: Pointer; wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface; surface_x: cint32; surface_y: cint32); cdecl;
    leave : procedure(data: Pointer; wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface); cdecl;
    motion : procedure(data: Pointer; wl_pointer: Pwl_pointer; time: cuint; surface_x: cint32; surface_y: cint32); cdecl;
    button : procedure(data: Pointer; wl_pointer: Pwl_pointer; serial: cuint; time: cuint; button: cuint; state: cuint); cdecl;
    axis : procedure(data: Pointer; wl_pointer: Pwl_pointer; time: cuint; axis: cuint; value: cint32); cdecl;
    frame : procedure(data: Pointer; wl_pointer: Pwl_pointer); cdecl;
    axis_source : procedure(data: Pointer; wl_pointer: Pwl_pointer; axis_source: cuint); cdecl;
    axis_stop : procedure(data: Pointer; wl_pointer: Pwl_pointer; time: cuint; axis: cuint); cdecl;
    axis_discrete : procedure(data: Pointer; wl_pointer: Pwl_pointer; axis: cuint; discrete: cint); cdecl;
  end;

const
  WL_KEYBOARD_KEYMAP_FORMAT_NO_KEYMAP = 0; // no keymap; client must understand how to interpret the raw keycode
  WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1 = 1; // libxkbcommon compatible; to determine the xkb keycode, clients must add 8 to the key event keycode
  WL_KEYBOARD_KEY_STATE_RELEASED = 0; // key is not pressed
  WL_KEYBOARD_KEY_STATE_PRESSED = 1; // key is pressed

type
  Pwl_keyboard_listener = ^Twl_keyboard_listener;
  Twl_keyboard_listener = record
    keymap : procedure(data: Pointer; wl_keyboard: Pwl_keyboard; format: cuint; fd: cint; size: cuint); cdecl;
    enter : procedure(data: Pointer; wl_keyboard: Pwl_keyboard; serial: cuint; surface: Pwl_surface; keys: Pwl_array); cdecl;
    leave : procedure(data: Pointer; wl_keyboard: Pwl_keyboard; serial: cuint; surface: Pwl_surface); cdecl;
    key : procedure(data: Pointer; wl_keyboard: Pwl_keyboard; serial: cuint; time: cuint; key: cuint; state: cuint); cdecl;
    modifiers : procedure(data: Pointer; wl_keyboard: Pwl_keyboard; serial: cuint; mods_depressed: cuint; mods_latched: cuint; mods_locked: cuint; group: cuint); cdecl;
    repeat_info : procedure(data: Pointer; wl_keyboard: Pwl_keyboard; rate: cint; delay: cint); cdecl;
  end;

  Pwl_touch_listener = ^Twl_touch_listener;
  Twl_touch_listener = record
    down : procedure(data: Pointer; wl_touch: Pwl_touch; serial: cuint; time: cuint; surface: Pwl_surface; id: cint; x: cint32; y: cint32); cdecl;
    up : procedure(data: Pointer; wl_touch: Pwl_touch; serial: cuint; time: cuint; id: cint); cdecl;
    motion : procedure(data: Pointer; wl_touch: Pwl_touch; time: cuint; id: cint; x: cint32; y: cint32); cdecl;
    frame : procedure(data: Pointer; wl_touch: Pwl_touch); cdecl;
    cancel : procedure(data: Pointer; wl_touch: Pwl_touch); cdecl;
    shape : procedure(data: Pointer; wl_touch: Pwl_touch; id: cint; major: cint32; minor: cint32); cdecl;
    orientation : procedure(data: Pointer; wl_touch: Pwl_touch; id: cint; orientation: cint32); cdecl;
  end;

const
  WL_OUTPUT_SUBPIXEL_UNKNOWN = 0; // unknown geometry
  WL_OUTPUT_SUBPIXEL_NONE = 1; // no geometry
  WL_OUTPUT_SUBPIXEL_HORIZONTAL_RGB = 2; // horizontal RGB
  WL_OUTPUT_SUBPIXEL_HORIZONTAL_BGR = 3; // horizontal BGR
  WL_OUTPUT_SUBPIXEL_VERTICAL_RGB = 4; // vertical RGB
  WL_OUTPUT_SUBPIXEL_VERTICAL_BGR = 5; // vertical BGR
  WL_OUTPUT_TRANSFORM_NORMAL = 0; // no transform
  WL_OUTPUT_TRANSFORM_90 = 1; // 90 degrees counter-clockwise
  WL_OUTPUT_TRANSFORM_180 = 2; // 180 degrees counter-clockwise
  WL_OUTPUT_TRANSFORM_270 = 3; // 270 degrees counter-clockwise
  WL_OUTPUT_TRANSFORM_FLIPPED = 4; // 180 degree flip around a vertical axis
  WL_OUTPUT_TRANSFORM_FLIPPED_90 = 5; // flip and rotate 90 degrees counter-clockwise
  WL_OUTPUT_TRANSFORM_FLIPPED_180 = 6; // flip and rotate 180 degrees counter-clockwise
  WL_OUTPUT_TRANSFORM_FLIPPED_270 = 7; // flip and rotate 270 degrees counter-clockwise
  WL_OUTPUT_MODE_CURRENT = $1; // indicates this is the current mode
  WL_OUTPUT_MODE_PREFERRED = $2; // indicates this is the preferred mode

type
  Pwl_output_listener = ^Twl_output_listener;
  Twl_output_listener = record
    geometry : procedure(data: Pointer; wl_output: Pwl_output; x: cint; y: cint; physical_width: cint; physical_height: cint; subpixel: cint; make: pchar; model: pchar; transform: cint); cdecl;
    mode : procedure(data: Pointer; wl_output: Pwl_output; flags: cuint; width: cint; height: cint; refresh: cint); cdecl;
    done : procedure(data: Pointer; wl_output: Pwl_output); cdecl;
    scale : procedure(data: Pointer; wl_output: Pwl_output; factor: cint); cdecl;
  end;

  Pwl_region_listener = ^Twl_region_listener;
  Twl_region_listener = record
  end;

const
  WL_SUBCOMPOSITOR_ERROR_BAD_SURFACE = 0; // the to-be sub-surface is invalid

type
  Pwl_subcompositor_listener = ^Twl_subcompositor_listener;
  Twl_subcompositor_listener = record
  end;

const
  WL_SUBSURFACE_ERROR_BAD_SURFACE = 0; // wl_surface is not a sibling or the parent

type
  Pwl_subsurface_listener = ^Twl_subsurface_listener;
  Twl_subsurface_listener = record
  end;



  Iwl_displayListener = interface
  ['Iwl_displayListener']
    procedure wl_display_error(wl_display: Pwl_display; object_id: pointer; code: cuint; message: pchar);
    procedure wl_display_delete_id(wl_display: Pwl_display; id: cuint);
  end;

  Iwl_registryListener = interface
  ['Iwl_registryListener']
    procedure wl_registry_global(wl_registry: Pwl_registry; name: cuint; &interface: pchar; version: cuint);
    procedure wl_registry_global_remove(wl_registry: Pwl_registry; name: cuint);
  end;

  Iwl_callbackListener = interface
  ['Iwl_callbackListener']
    procedure wl_callback_done(wl_callback: Pwl_callback; callback_data: cuint);
  end;

  Iwl_compositorListener = interface
  ['Iwl_compositorListener']
  end;

  Iwl_shm_poolListener = interface
  ['Iwl_shm_poolListener']
  end;

  Iwl_shmListener = interface
  ['Iwl_shmListener']
    procedure wl_shm_format(wl_shm: Pwl_shm; format: cuint);
  end;

  Iwl_bufferListener = interface
  ['Iwl_bufferListener']
    procedure wl_buffer_release(wl_buffer: Pwl_buffer);
  end;

  Iwl_data_offerListener = interface
  ['Iwl_data_offerListener']
    procedure wl_data_offer_offer(wl_data_offer: Pwl_data_offer; mime_type: pchar);
    procedure wl_data_offer_source_actions(wl_data_offer: Pwl_data_offer; source_actions: cuint);
    procedure wl_data_offer_action(wl_data_offer: Pwl_data_offer; dnd_action: cuint);
  end;

  Iwl_data_sourceListener = interface
  ['Iwl_data_sourceListener']
    procedure wl_data_source_target(wl_data_source: Pwl_data_source; mime_type: pchar);
    procedure wl_data_source_send(wl_data_source: Pwl_data_source; mime_type: pchar; fd: cint);
    procedure wl_data_source_cancelled(wl_data_source: Pwl_data_source);
    procedure wl_data_source_dnd_drop_performed(wl_data_source: Pwl_data_source);
    procedure wl_data_source_dnd_finished(wl_data_source: Pwl_data_source);
    procedure wl_data_source_action(wl_data_source: Pwl_data_source; dnd_action: cuint);
  end;

  Iwl_data_deviceListener = interface
  ['Iwl_data_deviceListener']
    procedure wl_data_device_data_offer(wl_data_device: Pwl_data_device; id: Pwl_data_offer);
    procedure wl_data_device_enter(wl_data_device: Pwl_data_device; serial: cuint; surface: Pwl_surface; x: cint32; y: cint32; id: Pwl_data_offer);
    procedure wl_data_device_leave(wl_data_device: Pwl_data_device);
    procedure wl_data_device_motion(wl_data_device: Pwl_data_device; time: cuint; x: cint32; y: cint32);
    procedure wl_data_device_drop(wl_data_device: Pwl_data_device);
    procedure wl_data_device_selection(wl_data_device: Pwl_data_device; id: Pwl_data_offer);
  end;

  Iwl_data_device_managerListener = interface
  ['Iwl_data_device_managerListener']
  end;

  Iwl_shellListener = interface
  ['Iwl_shellListener']
  end;

  Iwl_shell_surfaceListener = interface
  ['Iwl_shell_surfaceListener']
    procedure wl_shell_surface_ping(wl_shell_surface: Pwl_shell_surface; serial: cuint);
    procedure wl_shell_surface_configure(wl_shell_surface: Pwl_shell_surface; edges: cuint; width: cint; height: cint);
    procedure wl_shell_surface_popup_done(wl_shell_surface: Pwl_shell_surface);
  end;

  Iwl_surfaceListener = interface
  ['Iwl_surfaceListener']
    procedure wl_surface_enter(wl_surface: Pwl_surface; output: Pwl_output);
    procedure wl_surface_leave(wl_surface: Pwl_surface; output: Pwl_output);
  end;

  Iwl_seatListener = interface
  ['Iwl_seatListener']
    procedure wl_seat_capabilities(wl_seat: Pwl_seat; capabilities: cuint);
    procedure wl_seat_name(wl_seat: Pwl_seat; name: pchar);
  end;

  Iwl_pointerListener = interface
  ['Iwl_pointerListener']
    procedure wl_pointer_enter(wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface; surface_x: cint32; surface_y: cint32);
    procedure wl_pointer_leave(wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface);
    procedure wl_pointer_motion(wl_pointer: Pwl_pointer; time: cuint; surface_x: cint32; surface_y: cint32);
    procedure wl_pointer_button(wl_pointer: Pwl_pointer; serial: cuint; time: cuint; button: cuint; state: cuint);
    procedure wl_pointer_axis(wl_pointer: Pwl_pointer; time: cuint; axis: cuint; value: cint32);
    procedure wl_pointer_frame(wl_pointer: Pwl_pointer);
    procedure wl_pointer_axis_source(wl_pointer: Pwl_pointer; axis_source: cuint);
    procedure wl_pointer_axis_stop(wl_pointer: Pwl_pointer; time: cuint; axis: cuint);
    procedure wl_pointer_axis_discrete(wl_pointer: Pwl_pointer; axis: cuint; discrete: cint);
  end;

  Iwl_keyboardListener = interface
  ['Iwl_keyboardListener']
    procedure wl_keyboard_keymap(wl_keyboard: Pwl_keyboard; format: cuint; fd: cint; size: cuint);
    procedure wl_keyboard_enter(wl_keyboard: Pwl_keyboard; serial: cuint; surface: Pwl_surface; keys: Pwl_array);
    procedure wl_keyboard_leave(wl_keyboard: Pwl_keyboard; serial: cuint; surface: Pwl_surface);
    procedure wl_keyboard_key(wl_keyboard: Pwl_keyboard; serial: cuint; time: cuint; key: cuint; state: cuint);
    procedure wl_keyboard_modifiers(wl_keyboard: Pwl_keyboard; serial: cuint; mods_depressed: cuint; mods_latched: cuint; mods_locked: cuint; group: cuint);
    procedure wl_keyboard_repeat_info(wl_keyboard: Pwl_keyboard; rate: cint; delay: cint);
  end;

  Iwl_touchListener = interface
  ['Iwl_touchListener']
    procedure wl_touch_down(wl_touch: Pwl_touch; serial: cuint; time: cuint; surface: Pwl_surface; id: cint; x: cint32; y: cint32);
    procedure wl_touch_up(wl_touch: Pwl_touch; serial: cuint; time: cuint; id: cint);
    procedure wl_touch_motion(wl_touch: Pwl_touch; time: cuint; id: cint; x: cint32; y: cint32);
    procedure wl_touch_frame(wl_touch: Pwl_touch);
    procedure wl_touch_cancel(wl_touch: Pwl_touch);
    procedure wl_touch_shape(wl_touch: Pwl_touch; id: cint; major: cint32; minor: cint32);
    procedure wl_touch_orientation(wl_touch: Pwl_touch; id: cint; orientation: cint32);
  end;

  Iwl_outputListener = interface
  ['Iwl_outputListener']
    procedure wl_output_geometry(wl_output: Pwl_output; x: cint; y: cint; physical_width: cint; physical_height: cint; subpixel: cint; make: pchar; model: pchar; transform: cint);
    procedure wl_output_mode(wl_output: Pwl_output; flags: cuint; width: cint; height: cint; refresh: cint);
    procedure wl_output_done(wl_output: Pwl_output);
    procedure wl_output_scale(wl_output: Pwl_output; factor: cint);
  end;

  Iwl_regionListener = interface
  ['Iwl_regionListener']
  end;

  Iwl_subcompositorListener = interface
  ['Iwl_subcompositorListener']
  end;

  Iwl_subsurfaceListener = interface
  ['Iwl_subsurfaceListener']
  end;



function  wl_display_sync(wl_display: Pwl_display): Pwl_callback;
function  wl_display_get_registry(wl_display: Pwl_display): Pwl_registry;
function  wl_display_add_listener(wl_display: Pwl_display; listener: Pwl_display_listener; data: Pointer): cint;
procedure  wl_display_add_listener(wl_display: Pwl_display; AIntf: Iwl_displayListener);
procedure wl_display_set_user_data(wl_display: Pwl_display; user_data: Pointer);
function  wl_display_get_user_data(wl_display: Pwl_display): Pointer;
function  wl_display_get_version(wl_display: Pwl_display): cuint32;
procedure wl_display_destroy(wl_display: Pwl_display);
function  wl_registry_bind(wl_registry: Pwl_registry; name: cuint; interface_: Pwl_interface; version: cuint32): Pointer;
function  wl_registry_add_listener(wl_registry: Pwl_registry; listener: Pwl_registry_listener; data: Pointer): cint;
procedure  wl_registry_add_listener(wl_registry: Pwl_registry; AIntf: Iwl_registryListener);
procedure wl_registry_set_user_data(wl_registry: Pwl_registry; user_data: Pointer);
function  wl_registry_get_user_data(wl_registry: Pwl_registry): Pointer;
function  wl_registry_get_version(wl_registry: Pwl_registry): cuint32;
procedure wl_registry_destroy(wl_registry: Pwl_registry);
function  wl_callback_add_listener(wl_callback: Pwl_callback; listener: Pwl_callback_listener; data: Pointer): cint;
procedure  wl_callback_add_listener(wl_callback: Pwl_callback; AIntf: Iwl_callbackListener);
procedure wl_callback_set_user_data(wl_callback: Pwl_callback; user_data: Pointer);
function  wl_callback_get_user_data(wl_callback: Pwl_callback): Pointer;
function  wl_callback_get_version(wl_callback: Pwl_callback): cuint32;
procedure wl_callback_destroy(wl_callback: Pwl_callback);
function  wl_compositor_create_surface(wl_compositor: Pwl_compositor): Pwl_surface;
function  wl_compositor_create_region(wl_compositor: Pwl_compositor): Pwl_region;
function  wl_compositor_add_listener(wl_compositor: Pwl_compositor; listener: Pwl_compositor_listener; data: Pointer): cint;
procedure  wl_compositor_add_listener(wl_compositor: Pwl_compositor; AIntf: Iwl_compositorListener);
procedure wl_compositor_set_user_data(wl_compositor: Pwl_compositor; user_data: Pointer);
function  wl_compositor_get_user_data(wl_compositor: Pwl_compositor): Pointer;
function  wl_compositor_get_version(wl_compositor: Pwl_compositor): cuint32;
procedure wl_compositor_destroy(wl_compositor: Pwl_compositor);
function  wl_shm_pool_create_buffer(wl_shm_pool: Pwl_shm_pool; offset: cint; width: cint; height: cint; stride: cint; format: cuint): Pwl_buffer;
procedure wl_shm_pool_destroy(wl_shm_pool: Pwl_shm_pool);
procedure wl_shm_pool_resize(wl_shm_pool: Pwl_shm_pool; size: cint);
function  wl_shm_pool_add_listener(wl_shm_pool: Pwl_shm_pool; listener: Pwl_shm_pool_listener; data: Pointer): cint;
procedure  wl_shm_pool_add_listener(wl_shm_pool: Pwl_shm_pool; AIntf: Iwl_shm_poolListener);
procedure wl_shm_pool_set_user_data(wl_shm_pool: Pwl_shm_pool; user_data: Pointer);
function  wl_shm_pool_get_user_data(wl_shm_pool: Pwl_shm_pool): Pointer;
function  wl_shm_pool_get_version(wl_shm_pool: Pwl_shm_pool): cuint32;
function  wl_shm_create_pool(wl_shm: Pwl_shm; fd: cint; size: cint): Pwl_shm_pool;
function  wl_shm_add_listener(wl_shm: Pwl_shm; listener: Pwl_shm_listener; data: Pointer): cint;
procedure  wl_shm_add_listener(wl_shm: Pwl_shm; AIntf: Iwl_shmListener);
procedure wl_shm_set_user_data(wl_shm: Pwl_shm; user_data: Pointer);
function  wl_shm_get_user_data(wl_shm: Pwl_shm): Pointer;
function  wl_shm_get_version(wl_shm: Pwl_shm): cuint32;
procedure wl_shm_destroy(wl_shm: Pwl_shm);
procedure wl_buffer_destroy(wl_buffer: Pwl_buffer);
function  wl_buffer_add_listener(wl_buffer: Pwl_buffer; listener: Pwl_buffer_listener; data: Pointer): cint;
procedure  wl_buffer_add_listener(wl_buffer: Pwl_buffer; AIntf: Iwl_bufferListener);
procedure wl_buffer_set_user_data(wl_buffer: Pwl_buffer; user_data: Pointer);
function  wl_buffer_get_user_data(wl_buffer: Pwl_buffer): Pointer;
function  wl_buffer_get_version(wl_buffer: Pwl_buffer): cuint32;
procedure wl_data_offer_accept(wl_data_offer: Pwl_data_offer; serial: cuint; mime_type: pchar);
procedure wl_data_offer_receive(wl_data_offer: Pwl_data_offer; mime_type: pchar; fd: cint);
procedure wl_data_offer_destroy(wl_data_offer: Pwl_data_offer);
procedure wl_data_offer_finish(wl_data_offer: Pwl_data_offer);
procedure wl_data_offer_set_actions(wl_data_offer: Pwl_data_offer; dnd_actions: cuint; preferred_action: cuint);
function  wl_data_offer_add_listener(wl_data_offer: Pwl_data_offer; listener: Pwl_data_offer_listener; data: Pointer): cint;
procedure  wl_data_offer_add_listener(wl_data_offer: Pwl_data_offer; AIntf: Iwl_data_offerListener);
procedure wl_data_offer_set_user_data(wl_data_offer: Pwl_data_offer; user_data: Pointer);
function  wl_data_offer_get_user_data(wl_data_offer: Pwl_data_offer): Pointer;
function  wl_data_offer_get_version(wl_data_offer: Pwl_data_offer): cuint32;
procedure wl_data_source_offer(wl_data_source: Pwl_data_source; mime_type: pchar);
procedure wl_data_source_destroy(wl_data_source: Pwl_data_source);
procedure wl_data_source_set_actions(wl_data_source: Pwl_data_source; dnd_actions: cuint);
function  wl_data_source_add_listener(wl_data_source: Pwl_data_source; listener: Pwl_data_source_listener; data: Pointer): cint;
procedure  wl_data_source_add_listener(wl_data_source: Pwl_data_source; AIntf: Iwl_data_sourceListener);
procedure wl_data_source_set_user_data(wl_data_source: Pwl_data_source; user_data: Pointer);
function  wl_data_source_get_user_data(wl_data_source: Pwl_data_source): Pointer;
function  wl_data_source_get_version(wl_data_source: Pwl_data_source): cuint32;
procedure wl_data_device_start_drag(wl_data_device: Pwl_data_device; source: Pwl_data_source; origin: Pwl_surface; icon: Pwl_surface; serial: cuint);
procedure wl_data_device_set_selection(wl_data_device: Pwl_data_device; source: Pwl_data_source; serial: cuint);
procedure wl_data_device_release(wl_data_device: Pwl_data_device);
function  wl_data_device_add_listener(wl_data_device: Pwl_data_device; listener: Pwl_data_device_listener; data: Pointer): cint;
procedure  wl_data_device_add_listener(wl_data_device: Pwl_data_device; AIntf: Iwl_data_deviceListener);
procedure wl_data_device_set_user_data(wl_data_device: Pwl_data_device; user_data: Pointer);
function  wl_data_device_get_user_data(wl_data_device: Pwl_data_device): Pointer;
function  wl_data_device_get_version(wl_data_device: Pwl_data_device): cuint32;
function  wl_data_device_manager_create_data_source(wl_data_device_manager: Pwl_data_device_manager): Pwl_data_source;
function  wl_data_device_manager_get_data_device(wl_data_device_manager: Pwl_data_device_manager; seat: Pwl_seat): Pwl_data_device;
function  wl_data_device_manager_add_listener(wl_data_device_manager: Pwl_data_device_manager; listener: Pwl_data_device_manager_listener; data: Pointer): cint;
procedure  wl_data_device_manager_add_listener(wl_data_device_manager: Pwl_data_device_manager; AIntf: Iwl_data_device_managerListener);
procedure wl_data_device_manager_set_user_data(wl_data_device_manager: Pwl_data_device_manager; user_data: Pointer);
function  wl_data_device_manager_get_user_data(wl_data_device_manager: Pwl_data_device_manager): Pointer;
function  wl_data_device_manager_get_version(wl_data_device_manager: Pwl_data_device_manager): cuint32;
procedure wl_data_device_manager_destroy(wl_data_device_manager: Pwl_data_device_manager);
function  wl_shell_get_shell_surface(wl_shell: Pwl_shell; surface: Pwl_surface): Pwl_shell_surface;
function  wl_shell_add_listener(wl_shell: Pwl_shell; listener: Pwl_shell_listener; data: Pointer): cint;
procedure  wl_shell_add_listener(wl_shell: Pwl_shell; AIntf: Iwl_shellListener);
procedure wl_shell_set_user_data(wl_shell: Pwl_shell; user_data: Pointer);
function  wl_shell_get_user_data(wl_shell: Pwl_shell): Pointer;
function  wl_shell_get_version(wl_shell: Pwl_shell): cuint32;
procedure wl_shell_destroy(wl_shell: Pwl_shell);
procedure wl_shell_surface_pong(wl_shell_surface: Pwl_shell_surface; serial: cuint);
procedure wl_shell_surface_move(wl_shell_surface: Pwl_shell_surface; seat: Pwl_seat; serial: cuint);
procedure wl_shell_surface_resize(wl_shell_surface: Pwl_shell_surface; seat: Pwl_seat; serial: cuint; edges: cuint);
procedure wl_shell_surface_set_toplevel(wl_shell_surface: Pwl_shell_surface);
procedure wl_shell_surface_set_transient(wl_shell_surface: Pwl_shell_surface; parent: Pwl_surface; x: cint; y: cint; flags: cuint);
procedure wl_shell_surface_set_fullscreen(wl_shell_surface: Pwl_shell_surface; method: cuint; framerate: cuint; output: Pwl_output);
procedure wl_shell_surface_set_popup(wl_shell_surface: Pwl_shell_surface; seat: Pwl_seat; serial: cuint; parent: Pwl_surface; x: cint; y: cint; flags: cuint);
procedure wl_shell_surface_set_maximized(wl_shell_surface: Pwl_shell_surface; output: Pwl_output);
procedure wl_shell_surface_set_title(wl_shell_surface: Pwl_shell_surface; title: pchar);
procedure wl_shell_surface_set_class(wl_shell_surface: Pwl_shell_surface; class_: pchar);
function  wl_shell_surface_add_listener(wl_shell_surface: Pwl_shell_surface; listener: Pwl_shell_surface_listener; data: Pointer): cint;
procedure  wl_shell_surface_add_listener(wl_shell_surface: Pwl_shell_surface; AIntf: Iwl_shell_surfaceListener);
procedure wl_shell_surface_set_user_data(wl_shell_surface: Pwl_shell_surface; user_data: Pointer);
function  wl_shell_surface_get_user_data(wl_shell_surface: Pwl_shell_surface): Pointer;
function  wl_shell_surface_get_version(wl_shell_surface: Pwl_shell_surface): cuint32;
procedure wl_shell_surface_destroy(wl_shell_surface: Pwl_shell_surface);
procedure wl_surface_destroy(wl_surface: Pwl_surface);
procedure wl_surface_attach(wl_surface: Pwl_surface; buffer: Pwl_buffer; x: cint; y: cint);
procedure wl_surface_damage(wl_surface: Pwl_surface; x: cint; y: cint; width: cint; height: cint);
function  wl_surface_frame(wl_surface: Pwl_surface): Pwl_callback;
procedure wl_surface_set_opaque_region(wl_surface: Pwl_surface; region: Pwl_region);
procedure wl_surface_set_input_region(wl_surface: Pwl_surface; region: Pwl_region);
procedure wl_surface_commit(wl_surface: Pwl_surface);
procedure wl_surface_set_buffer_transform(wl_surface: Pwl_surface; transform: cint);
procedure wl_surface_set_buffer_scale(wl_surface: Pwl_surface; scale: cint);
procedure wl_surface_damage_buffer(wl_surface: Pwl_surface; x: cint; y: cint; width: cint; height: cint);
function  wl_surface_add_listener(wl_surface: Pwl_surface; listener: Pwl_surface_listener; data: Pointer): cint;
procedure  wl_surface_add_listener(wl_surface: Pwl_surface; AIntf: Iwl_surfaceListener);
procedure wl_surface_set_user_data(wl_surface: Pwl_surface; user_data: Pointer);
function  wl_surface_get_user_data(wl_surface: Pwl_surface): Pointer;
function  wl_surface_get_version(wl_surface: Pwl_surface): cuint32;
function  wl_seat_get_pointer(wl_seat: Pwl_seat): Pwl_pointer;
function  wl_seat_get_keyboard(wl_seat: Pwl_seat): Pwl_keyboard;
function  wl_seat_get_touch(wl_seat: Pwl_seat): Pwl_touch;
procedure wl_seat_release(wl_seat: Pwl_seat);
function  wl_seat_add_listener(wl_seat: Pwl_seat; listener: Pwl_seat_listener; data: Pointer): cint;
procedure  wl_seat_add_listener(wl_seat: Pwl_seat; AIntf: Iwl_seatListener);
procedure wl_seat_set_user_data(wl_seat: Pwl_seat; user_data: Pointer);
function  wl_seat_get_user_data(wl_seat: Pwl_seat): Pointer;
function  wl_seat_get_version(wl_seat: Pwl_seat): cuint32;
procedure wl_pointer_set_cursor(wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface; hotspot_x: cint; hotspot_y: cint);
procedure wl_pointer_release(wl_pointer: Pwl_pointer);
function  wl_pointer_add_listener(wl_pointer: Pwl_pointer; listener: Pwl_pointer_listener; data: Pointer): cint;
procedure  wl_pointer_add_listener(wl_pointer: Pwl_pointer; AIntf: Iwl_pointerListener);
procedure wl_pointer_set_user_data(wl_pointer: Pwl_pointer; user_data: Pointer);
function  wl_pointer_get_user_data(wl_pointer: Pwl_pointer): Pointer;
function  wl_pointer_get_version(wl_pointer: Pwl_pointer): cuint32;
procedure wl_keyboard_release(wl_keyboard: Pwl_keyboard);
function  wl_keyboard_add_listener(wl_keyboard: Pwl_keyboard; listener: Pwl_keyboard_listener; data: Pointer): cint;
procedure  wl_keyboard_add_listener(wl_keyboard: Pwl_keyboard; AIntf: Iwl_keyboardListener);
procedure wl_keyboard_set_user_data(wl_keyboard: Pwl_keyboard; user_data: Pointer);
function  wl_keyboard_get_user_data(wl_keyboard: Pwl_keyboard): Pointer;
function  wl_keyboard_get_version(wl_keyboard: Pwl_keyboard): cuint32;
procedure wl_touch_release(wl_touch: Pwl_touch);
function  wl_touch_add_listener(wl_touch: Pwl_touch; listener: Pwl_touch_listener; data: Pointer): cint;
procedure  wl_touch_add_listener(wl_touch: Pwl_touch; AIntf: Iwl_touchListener);
procedure wl_touch_set_user_data(wl_touch: Pwl_touch; user_data: Pointer);
function  wl_touch_get_user_data(wl_touch: Pwl_touch): Pointer;
function  wl_touch_get_version(wl_touch: Pwl_touch): cuint32;
procedure wl_output_release(wl_output: Pwl_output);
function  wl_output_add_listener(wl_output: Pwl_output; listener: Pwl_output_listener; data: Pointer): cint;
procedure  wl_output_add_listener(wl_output: Pwl_output; AIntf: Iwl_outputListener);
procedure wl_output_set_user_data(wl_output: Pwl_output; user_data: Pointer);
function  wl_output_get_user_data(wl_output: Pwl_output): Pointer;
function  wl_output_get_version(wl_output: Pwl_output): cuint32;
procedure wl_region_destroy(wl_region: Pwl_region);
procedure wl_region_add(wl_region: Pwl_region; x: cint; y: cint; width: cint; height: cint);
procedure wl_region_subtract(wl_region: Pwl_region; x: cint; y: cint; width: cint; height: cint);
function  wl_region_add_listener(wl_region: Pwl_region; listener: Pwl_region_listener; data: Pointer): cint;
procedure  wl_region_add_listener(wl_region: Pwl_region; AIntf: Iwl_regionListener);
procedure wl_region_set_user_data(wl_region: Pwl_region; user_data: Pointer);
function  wl_region_get_user_data(wl_region: Pwl_region): Pointer;
function  wl_region_get_version(wl_region: Pwl_region): cuint32;
procedure wl_subcompositor_destroy(wl_subcompositor: Pwl_subcompositor);
function  wl_subcompositor_get_subsurface(wl_subcompositor: Pwl_subcompositor; surface: Pwl_surface; parent: Pwl_surface): Pwl_subsurface;
function  wl_subcompositor_add_listener(wl_subcompositor: Pwl_subcompositor; listener: Pwl_subcompositor_listener; data: Pointer): cint;
procedure  wl_subcompositor_add_listener(wl_subcompositor: Pwl_subcompositor; AIntf: Iwl_subcompositorListener);
procedure wl_subcompositor_set_user_data(wl_subcompositor: Pwl_subcompositor; user_data: Pointer);
function  wl_subcompositor_get_user_data(wl_subcompositor: Pwl_subcompositor): Pointer;
function  wl_subcompositor_get_version(wl_subcompositor: Pwl_subcompositor): cuint32;
procedure wl_subsurface_destroy(wl_subsurface: Pwl_subsurface);
procedure wl_subsurface_set_position(wl_subsurface: Pwl_subsurface; x: cint; y: cint);
procedure wl_subsurface_place_above(wl_subsurface: Pwl_subsurface; sibling: Pwl_surface);
procedure wl_subsurface_place_below(wl_subsurface: Pwl_subsurface; sibling: Pwl_surface);
procedure wl_subsurface_set_sync(wl_subsurface: Pwl_subsurface);
procedure wl_subsurface_set_desync(wl_subsurface: Pwl_subsurface);
function  wl_subsurface_add_listener(wl_subsurface: Pwl_subsurface; listener: Pwl_subsurface_listener; data: Pointer): cint;
procedure  wl_subsurface_add_listener(wl_subsurface: Pwl_subsurface; AIntf: Iwl_subsurfaceListener);
procedure wl_subsurface_set_user_data(wl_subsurface: Pwl_subsurface; user_data: Pointer);
function  wl_subsurface_get_user_data(wl_subsurface: Pwl_subsurface): Pointer;
function  wl_subsurface_get_version(wl_subsurface: Pwl_subsurface): cuint32;



var
  wl_display_interface: Twl_interface;
  wl_registry_interface: Twl_interface;
  wl_callback_interface: Twl_interface;
  wl_compositor_interface: Twl_interface;
  wl_shm_pool_interface: Twl_interface;
  wl_shm_interface: Twl_interface;
  wl_buffer_interface: Twl_interface;
  wl_data_offer_interface: Twl_interface;
  wl_data_source_interface: Twl_interface;
  wl_data_device_interface: Twl_interface;
  wl_data_device_manager_interface: Twl_interface;
  wl_shell_interface: Twl_interface;
  wl_shell_surface_interface: Twl_interface;
  wl_surface_interface: Twl_interface;
  wl_seat_interface: Twl_interface;
  wl_pointer_interface: Twl_interface;
  wl_keyboard_interface: Twl_interface;
  wl_touch_interface: Twl_interface;
  wl_output_interface: Twl_interface;
  wl_region_interface: Twl_interface;
  wl_subcompositor_interface: Twl_interface;
  wl_subsurface_interface: Twl_interface;



implementation

const
_WL_DISPLAY_SYNC = 0;
_WL_DISPLAY_GET_REGISTRY = 1;
_WL_REGISTRY_BIND = 0;
_WL_COMPOSITOR_CREATE_SURFACE = 0;
_WL_COMPOSITOR_CREATE_REGION = 1;
_WL_SHM_POOL_CREATE_BUFFER = 0;
_WL_SHM_POOL_DESTROY = 1;
_WL_SHM_POOL_RESIZE = 2;
_WL_SHM_CREATE_POOL = 0;
_WL_BUFFER_DESTROY = 0;
_WL_DATA_OFFER_ACCEPT = 0;
_WL_DATA_OFFER_RECEIVE = 1;
_WL_DATA_OFFER_DESTROY = 2;
_WL_DATA_OFFER_FINISH = 3;
_WL_DATA_OFFER_SET_ACTIONS = 4;
_WL_DATA_SOURCE_OFFER = 0;
_WL_DATA_SOURCE_DESTROY = 1;
_WL_DATA_SOURCE_SET_ACTIONS = 2;
_WL_DATA_DEVICE_START_DRAG = 0;
_WL_DATA_DEVICE_SET_SELECTION = 1;
_WL_DATA_DEVICE_RELEASE = 2;
_WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE = 0;
_WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE = 1;
_WL_SHELL_GET_SHELL_SURFACE = 0;
_WL_SHELL_SURFACE_PONG = 0;
_WL_SHELL_SURFACE_MOVE = 1;
_WL_SHELL_SURFACE_RESIZE = 2;
_WL_SHELL_SURFACE_SET_TOPLEVEL = 3;
_WL_SHELL_SURFACE_SET_TRANSIENT = 4;
_WL_SHELL_SURFACE_SET_FULLSCREEN = 5;
_WL_SHELL_SURFACE_SET_POPUP = 6;
_WL_SHELL_SURFACE_SET_MAXIMIZED = 7;
_WL_SHELL_SURFACE_SET_TITLE = 8;
_WL_SHELL_SURFACE_SET_CLASS = 9;
_WL_SURFACE_DESTROY = 0;
_WL_SURFACE_ATTACH = 1;
_WL_SURFACE_DAMAGE = 2;
_WL_SURFACE_FRAME = 3;
_WL_SURFACE_SET_OPAQUE_REGION = 4;
_WL_SURFACE_SET_INPUT_REGION = 5;
_WL_SURFACE_COMMIT = 6;
_WL_SURFACE_SET_BUFFER_TRANSFORM = 7;
_WL_SURFACE_SET_BUFFER_SCALE = 8;
_WL_SURFACE_DAMAGE_BUFFER = 9;
_WL_SEAT_GET_POINTER = 0;
_WL_SEAT_GET_KEYBOARD = 1;
_WL_SEAT_GET_TOUCH = 2;
_WL_SEAT_RELEASE = 3;
_WL_POINTER_SET_CURSOR = 0;
_WL_POINTER_RELEASE = 1;
_WL_KEYBOARD_RELEASE = 0;
_WL_TOUCH_RELEASE = 0;
_WL_OUTPUT_RELEASE = 0;
_WL_REGION_DESTROY = 0;
_WL_REGION_ADD = 1;
_WL_REGION_SUBTRACT = 2;
_WL_SUBCOMPOSITOR_DESTROY = 0;
_WL_SUBCOMPOSITOR_GET_SUBSURFACE = 1;
_WL_SUBSURFACE_DESTROY = 0;
_WL_SUBSURFACE_SET_POSITION = 1;
_WL_SUBSURFACE_PLACE_ABOVE = 2;
_WL_SUBSURFACE_PLACE_BELOW = 3;
_WL_SUBSURFACE_SET_SYNC = 4;
_WL_SUBSURFACE_SET_DESYNC = 5;


var
  vIntf_wl_display_Listener: Twl_display_listener;
  vIntf_wl_registry_Listener: Twl_registry_listener;
  vIntf_wl_callback_Listener: Twl_callback_listener;
  vIntf_wl_compositor_Listener: Twl_compositor_listener;
  vIntf_wl_shm_pool_Listener: Twl_shm_pool_listener;
  vIntf_wl_shm_Listener: Twl_shm_listener;
  vIntf_wl_buffer_Listener: Twl_buffer_listener;
  vIntf_wl_data_offer_Listener: Twl_data_offer_listener;
  vIntf_wl_data_source_Listener: Twl_data_source_listener;
  vIntf_wl_data_device_Listener: Twl_data_device_listener;
  vIntf_wl_data_device_manager_Listener: Twl_data_device_manager_listener;
  vIntf_wl_shell_Listener: Twl_shell_listener;
  vIntf_wl_shell_surface_Listener: Twl_shell_surface_listener;
  vIntf_wl_surface_Listener: Twl_surface_listener;
  vIntf_wl_seat_Listener: Twl_seat_listener;
  vIntf_wl_pointer_Listener: Twl_pointer_listener;
  vIntf_wl_keyboard_Listener: Twl_keyboard_listener;
  vIntf_wl_touch_Listener: Twl_touch_listener;
  vIntf_wl_output_Listener: Twl_output_listener;
  vIntf_wl_region_Listener: Twl_region_listener;
  vIntf_wl_subcompositor_Listener: Twl_subcompositor_listener;
  vIntf_wl_subsurface_Listener: Twl_subsurface_listener;



function  wl_display_sync(wl_display: Pwl_display): Pwl_callback;
var
  callback: Pwl_proxy;
begin
  callback := wl_proxy_marshal_constructor(Pwl_proxy(wl_display),
      _WL_DISPLAY_SYNC, @wl_callback_interface, nil);
  Result := Pwl_callback(callback);
end;

function  wl_display_get_registry(wl_display: Pwl_display): Pwl_registry;
var
  registry: Pwl_proxy;
begin
  registry := wl_proxy_marshal_constructor(Pwl_proxy(wl_display),
      _WL_DISPLAY_GET_REGISTRY, @wl_registry_interface, nil);
  Result := Pwl_registry(registry);
end;

function  wl_display_add_listener(wl_display: Pwl_display; listener: Pwl_display_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_display), listener, data);
end;

procedure  wl_display_add_listener(wl_display: Pwl_display; AIntf: Iwl_displayListener);
begin
  wl_display_add_listener(wl_display, @vIntf_wl_display_Listener, AIntf);
end;

procedure wl_display_set_user_data(wl_display: Pwl_display; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_display), user_data);
end;

function  wl_display_get_user_data(wl_display: Pwl_display): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_display));
end;

function  wl_display_get_version(wl_display: Pwl_display): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_display));
end;

procedure wl_display_destroy(wl_display: Pwl_display);
begin
  wl_proxy_destroy(Pwl_proxy(wl_display));
end;

function  wl_registry_bind(wl_registry: Pwl_registry; name: cuint; interface_: Pwl_interface; version: cuint32): Pointer;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor_versioned(Pwl_proxy(wl_registry),
      _WL_REGISTRY_BIND, interface_, version, name, interface_^.name, version, nil);
  Result := Pointer(id);
end;

function  wl_registry_add_listener(wl_registry: Pwl_registry; listener: Pwl_registry_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_registry), listener, data);
end;

procedure  wl_registry_add_listener(wl_registry: Pwl_registry; AIntf: Iwl_registryListener);
begin
  wl_registry_add_listener(wl_registry, @vIntf_wl_registry_Listener, AIntf);
end;

procedure wl_registry_set_user_data(wl_registry: Pwl_registry; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_registry), user_data);
end;

function  wl_registry_get_user_data(wl_registry: Pwl_registry): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_registry));
end;

function  wl_registry_get_version(wl_registry: Pwl_registry): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_registry));
end;

procedure wl_registry_destroy(wl_registry: Pwl_registry);
begin
  wl_proxy_destroy(Pwl_proxy(wl_registry));
end;

function  wl_callback_add_listener(wl_callback: Pwl_callback; listener: Pwl_callback_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_callback), listener, data);
end;

procedure  wl_callback_add_listener(wl_callback: Pwl_callback; AIntf: Iwl_callbackListener);
begin
  wl_callback_add_listener(wl_callback, @vIntf_wl_callback_Listener, AIntf);
end;

procedure wl_callback_set_user_data(wl_callback: Pwl_callback; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_callback), user_data);
end;

function  wl_callback_get_user_data(wl_callback: Pwl_callback): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_callback));
end;

function  wl_callback_get_version(wl_callback: Pwl_callback): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_callback));
end;

procedure wl_callback_destroy(wl_callback: Pwl_callback);
begin
  wl_proxy_destroy(Pwl_proxy(wl_callback));
end;

function  wl_compositor_create_surface(wl_compositor: Pwl_compositor): Pwl_surface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_compositor),
      _WL_COMPOSITOR_CREATE_SURFACE, @wl_surface_interface, nil);
  Result := Pwl_surface(id);
end;

function  wl_compositor_create_region(wl_compositor: Pwl_compositor): Pwl_region;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_compositor),
      _WL_COMPOSITOR_CREATE_REGION, @wl_region_interface, nil);
  Result := Pwl_region(id);
end;

function  wl_compositor_add_listener(wl_compositor: Pwl_compositor; listener: Pwl_compositor_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_compositor), listener, data);
end;

procedure  wl_compositor_add_listener(wl_compositor: Pwl_compositor; AIntf: Iwl_compositorListener);
begin
  wl_compositor_add_listener(wl_compositor, @vIntf_wl_compositor_Listener, AIntf);
end;

procedure wl_compositor_set_user_data(wl_compositor: Pwl_compositor; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_compositor), user_data);
end;

function  wl_compositor_get_user_data(wl_compositor: Pwl_compositor): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_compositor));
end;

function  wl_compositor_get_version(wl_compositor: Pwl_compositor): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_compositor));
end;

procedure wl_compositor_destroy(wl_compositor: Pwl_compositor);
begin
  wl_proxy_destroy(Pwl_proxy(wl_compositor));
end;

function  wl_shm_pool_create_buffer(wl_shm_pool: Pwl_shm_pool; offset: cint; width: cint; height: cint; stride: cint; format: cuint): Pwl_buffer;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_shm_pool),
      _WL_SHM_POOL_CREATE_BUFFER, @wl_buffer_interface, nil, offset, width, height, stride, format);
  Result := Pwl_buffer(id);
end;

procedure wl_shm_pool_destroy(wl_shm_pool: Pwl_shm_pool);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shm_pool), _WL_SHM_POOL_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_shm_pool));
end;

procedure wl_shm_pool_resize(wl_shm_pool: Pwl_shm_pool; size: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shm_pool),
      _WL_SHM_POOL_RESIZE, size);
end;

function  wl_shm_pool_add_listener(wl_shm_pool: Pwl_shm_pool; listener: Pwl_shm_pool_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_shm_pool), listener, data);
end;

procedure  wl_shm_pool_add_listener(wl_shm_pool: Pwl_shm_pool; AIntf: Iwl_shm_poolListener);
begin
  wl_shm_pool_add_listener(wl_shm_pool, @vIntf_wl_shm_pool_Listener, AIntf);
end;

procedure wl_shm_pool_set_user_data(wl_shm_pool: Pwl_shm_pool; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_shm_pool), user_data);
end;

function  wl_shm_pool_get_user_data(wl_shm_pool: Pwl_shm_pool): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_shm_pool));
end;

function  wl_shm_pool_get_version(wl_shm_pool: Pwl_shm_pool): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_shm_pool));
end;

function  wl_shm_create_pool(wl_shm: Pwl_shm; fd: cint; size: cint): Pwl_shm_pool;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_shm),
      _WL_SHM_CREATE_POOL, @wl_shm_pool_interface, nil, fd, size);
  Result := Pwl_shm_pool(id);
end;

function  wl_shm_add_listener(wl_shm: Pwl_shm; listener: Pwl_shm_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_shm), listener, data);
end;

procedure  wl_shm_add_listener(wl_shm: Pwl_shm; AIntf: Iwl_shmListener);
begin
  wl_shm_add_listener(wl_shm, @vIntf_wl_shm_Listener, AIntf);
end;

procedure wl_shm_set_user_data(wl_shm: Pwl_shm; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_shm), user_data);
end;

function  wl_shm_get_user_data(wl_shm: Pwl_shm): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_shm));
end;

function  wl_shm_get_version(wl_shm: Pwl_shm): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_shm));
end;

procedure wl_shm_destroy(wl_shm: Pwl_shm);
begin
  wl_proxy_destroy(Pwl_proxy(wl_shm));
end;

procedure wl_buffer_destroy(wl_buffer: Pwl_buffer);
begin
  wl_proxy_marshal(Pwl_proxy(wl_buffer), _WL_BUFFER_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_buffer));
end;

function  wl_buffer_add_listener(wl_buffer: Pwl_buffer; listener: Pwl_buffer_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_buffer), listener, data);
end;

procedure  wl_buffer_add_listener(wl_buffer: Pwl_buffer; AIntf: Iwl_bufferListener);
begin
  wl_buffer_add_listener(wl_buffer, @vIntf_wl_buffer_Listener, AIntf);
end;

procedure wl_buffer_set_user_data(wl_buffer: Pwl_buffer; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_buffer), user_data);
end;

function  wl_buffer_get_user_data(wl_buffer: Pwl_buffer): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_buffer));
end;

function  wl_buffer_get_version(wl_buffer: Pwl_buffer): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_buffer));
end;

procedure wl_data_offer_accept(wl_data_offer: Pwl_data_offer; serial: cuint; mime_type: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_offer),
      _WL_DATA_OFFER_ACCEPT, serial, mime_type);
end;

procedure wl_data_offer_receive(wl_data_offer: Pwl_data_offer; mime_type: pchar; fd: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_offer),
      _WL_DATA_OFFER_RECEIVE, mime_type, fd);
end;

procedure wl_data_offer_destroy(wl_data_offer: Pwl_data_offer);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_offer), _WL_DATA_OFFER_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_data_offer));
end;

procedure wl_data_offer_finish(wl_data_offer: Pwl_data_offer);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_offer),
      _WL_DATA_OFFER_FINISH);
end;

procedure wl_data_offer_set_actions(wl_data_offer: Pwl_data_offer; dnd_actions: cuint; preferred_action: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_offer),
      _WL_DATA_OFFER_SET_ACTIONS, dnd_actions, preferred_action);
end;

function  wl_data_offer_add_listener(wl_data_offer: Pwl_data_offer; listener: Pwl_data_offer_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_data_offer), listener, data);
end;

procedure  wl_data_offer_add_listener(wl_data_offer: Pwl_data_offer; AIntf: Iwl_data_offerListener);
begin
  wl_data_offer_add_listener(wl_data_offer, @vIntf_wl_data_offer_Listener, AIntf);
end;

procedure wl_data_offer_set_user_data(wl_data_offer: Pwl_data_offer; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_data_offer), user_data);
end;

function  wl_data_offer_get_user_data(wl_data_offer: Pwl_data_offer): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_data_offer));
end;

function  wl_data_offer_get_version(wl_data_offer: Pwl_data_offer): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_data_offer));
end;

procedure wl_data_source_offer(wl_data_source: Pwl_data_source; mime_type: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_source),
      _WL_DATA_SOURCE_OFFER, mime_type);
end;

procedure wl_data_source_destroy(wl_data_source: Pwl_data_source);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_source), _WL_DATA_SOURCE_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_data_source));
end;

procedure wl_data_source_set_actions(wl_data_source: Pwl_data_source; dnd_actions: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_source),
      _WL_DATA_SOURCE_SET_ACTIONS, dnd_actions);
end;

function  wl_data_source_add_listener(wl_data_source: Pwl_data_source; listener: Pwl_data_source_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_data_source), listener, data);
end;

procedure  wl_data_source_add_listener(wl_data_source: Pwl_data_source; AIntf: Iwl_data_sourceListener);
begin
  wl_data_source_add_listener(wl_data_source, @vIntf_wl_data_source_Listener, AIntf);
end;

procedure wl_data_source_set_user_data(wl_data_source: Pwl_data_source; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_data_source), user_data);
end;

function  wl_data_source_get_user_data(wl_data_source: Pwl_data_source): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_data_source));
end;

function  wl_data_source_get_version(wl_data_source: Pwl_data_source): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_data_source));
end;

procedure wl_data_device_start_drag(wl_data_device: Pwl_data_device; source: Pwl_data_source; origin: Pwl_surface; icon: Pwl_surface; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_device),
      _WL_DATA_DEVICE_START_DRAG, source, origin, icon, serial);
end;

procedure wl_data_device_set_selection(wl_data_device: Pwl_data_device; source: Pwl_data_source; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_device),
      _WL_DATA_DEVICE_SET_SELECTION, source, serial);
end;

procedure wl_data_device_release(wl_data_device: Pwl_data_device);
begin
  wl_proxy_marshal(Pwl_proxy(wl_data_device), _WL_DATA_DEVICE_RELEASE);
  wl_proxy_destroy(Pwl_proxy(wl_data_device));
end;

function  wl_data_device_add_listener(wl_data_device: Pwl_data_device; listener: Pwl_data_device_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_data_device), listener, data);
end;

procedure  wl_data_device_add_listener(wl_data_device: Pwl_data_device; AIntf: Iwl_data_deviceListener);
begin
  wl_data_device_add_listener(wl_data_device, @vIntf_wl_data_device_Listener, AIntf);
end;

procedure wl_data_device_set_user_data(wl_data_device: Pwl_data_device; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_data_device), user_data);
end;

function  wl_data_device_get_user_data(wl_data_device: Pwl_data_device): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_data_device));
end;

function  wl_data_device_get_version(wl_data_device: Pwl_data_device): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_data_device));
end;

function  wl_data_device_manager_create_data_source(wl_data_device_manager: Pwl_data_device_manager): Pwl_data_source;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_data_device_manager),
      _WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE, @wl_data_source_interface, nil);
  Result := Pwl_data_source(id);
end;

function  wl_data_device_manager_get_data_device(wl_data_device_manager: Pwl_data_device_manager; seat: Pwl_seat): Pwl_data_device;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_data_device_manager),
      _WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE, @wl_data_device_interface, nil, seat);
  Result := Pwl_data_device(id);
end;

function  wl_data_device_manager_add_listener(wl_data_device_manager: Pwl_data_device_manager; listener: Pwl_data_device_manager_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_data_device_manager), listener, data);
end;

procedure  wl_data_device_manager_add_listener(wl_data_device_manager: Pwl_data_device_manager; AIntf: Iwl_data_device_managerListener);
begin
  wl_data_device_manager_add_listener(wl_data_device_manager, @vIntf_wl_data_device_manager_Listener, AIntf);
end;

procedure wl_data_device_manager_set_user_data(wl_data_device_manager: Pwl_data_device_manager; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_data_device_manager), user_data);
end;

function  wl_data_device_manager_get_user_data(wl_data_device_manager: Pwl_data_device_manager): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_data_device_manager));
end;

function  wl_data_device_manager_get_version(wl_data_device_manager: Pwl_data_device_manager): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_data_device_manager));
end;

procedure wl_data_device_manager_destroy(wl_data_device_manager: Pwl_data_device_manager);
begin
  wl_proxy_destroy(Pwl_proxy(wl_data_device_manager));
end;

function  wl_shell_get_shell_surface(wl_shell: Pwl_shell; surface: Pwl_surface): Pwl_shell_surface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_shell),
      _WL_SHELL_GET_SHELL_SURFACE, @wl_shell_surface_interface, nil, surface);
  Result := Pwl_shell_surface(id);
end;

function  wl_shell_add_listener(wl_shell: Pwl_shell; listener: Pwl_shell_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_shell), listener, data);
end;

procedure  wl_shell_add_listener(wl_shell: Pwl_shell; AIntf: Iwl_shellListener);
begin
  wl_shell_add_listener(wl_shell, @vIntf_wl_shell_Listener, AIntf);
end;

procedure wl_shell_set_user_data(wl_shell: Pwl_shell; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_shell), user_data);
end;

function  wl_shell_get_user_data(wl_shell: Pwl_shell): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_shell));
end;

function  wl_shell_get_version(wl_shell: Pwl_shell): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_shell));
end;

procedure wl_shell_destroy(wl_shell: Pwl_shell);
begin
  wl_proxy_destroy(Pwl_proxy(wl_shell));
end;

procedure wl_shell_surface_pong(wl_shell_surface: Pwl_shell_surface; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_PONG, serial);
end;

procedure wl_shell_surface_move(wl_shell_surface: Pwl_shell_surface; seat: Pwl_seat; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_MOVE, seat, serial);
end;

procedure wl_shell_surface_resize(wl_shell_surface: Pwl_shell_surface; seat: Pwl_seat; serial: cuint; edges: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_RESIZE, seat, serial, edges);
end;

procedure wl_shell_surface_set_toplevel(wl_shell_surface: Pwl_shell_surface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_SET_TOPLEVEL);
end;

procedure wl_shell_surface_set_transient(wl_shell_surface: Pwl_shell_surface; parent: Pwl_surface; x: cint; y: cint; flags: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_SET_TRANSIENT, parent, x, y, flags);
end;

procedure wl_shell_surface_set_fullscreen(wl_shell_surface: Pwl_shell_surface; method: cuint; framerate: cuint; output: Pwl_output);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_SET_FULLSCREEN, method, framerate, output);
end;

procedure wl_shell_surface_set_popup(wl_shell_surface: Pwl_shell_surface; seat: Pwl_seat; serial: cuint; parent: Pwl_surface; x: cint; y: cint; flags: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_SET_POPUP, seat, serial, parent, x, y, flags);
end;

procedure wl_shell_surface_set_maximized(wl_shell_surface: Pwl_shell_surface; output: Pwl_output);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_SET_MAXIMIZED, output);
end;

procedure wl_shell_surface_set_title(wl_shell_surface: Pwl_shell_surface; title: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_SET_TITLE, title);
end;

procedure wl_shell_surface_set_class(wl_shell_surface: Pwl_shell_surface; class_: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(wl_shell_surface),
      _WL_SHELL_SURFACE_SET_CLASS, class_);
end;

function  wl_shell_surface_add_listener(wl_shell_surface: Pwl_shell_surface; listener: Pwl_shell_surface_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_shell_surface), listener, data);
end;

procedure  wl_shell_surface_add_listener(wl_shell_surface: Pwl_shell_surface; AIntf: Iwl_shell_surfaceListener);
begin
  wl_shell_surface_add_listener(wl_shell_surface, @vIntf_wl_shell_surface_Listener, AIntf);
end;

procedure wl_shell_surface_set_user_data(wl_shell_surface: Pwl_shell_surface; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_shell_surface), user_data);
end;

function  wl_shell_surface_get_user_data(wl_shell_surface: Pwl_shell_surface): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_shell_surface));
end;

function  wl_shell_surface_get_version(wl_shell_surface: Pwl_shell_surface): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_shell_surface));
end;

procedure wl_shell_surface_destroy(wl_shell_surface: Pwl_shell_surface);
begin
  wl_proxy_destroy(Pwl_proxy(wl_shell_surface));
end;

procedure wl_surface_destroy(wl_surface: Pwl_surface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface), _WL_SURFACE_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_surface));
end;

procedure wl_surface_attach(wl_surface: Pwl_surface; buffer: Pwl_buffer; x: cint; y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_ATTACH, buffer, x, y);
end;

procedure wl_surface_damage(wl_surface: Pwl_surface; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_DAMAGE, x, y, width, height);
end;

function  wl_surface_frame(wl_surface: Pwl_surface): Pwl_callback;
var
  callback: Pwl_proxy;
begin
  callback := wl_proxy_marshal_constructor(Pwl_proxy(wl_surface),
      _WL_SURFACE_FRAME, @wl_callback_interface, nil);
  Result := Pwl_callback(callback);
end;

procedure wl_surface_set_opaque_region(wl_surface: Pwl_surface; region: Pwl_region);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_SET_OPAQUE_REGION, region);
end;

procedure wl_surface_set_input_region(wl_surface: Pwl_surface; region: Pwl_region);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_SET_INPUT_REGION, region);
end;

procedure wl_surface_commit(wl_surface: Pwl_surface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_COMMIT);
end;

procedure wl_surface_set_buffer_transform(wl_surface: Pwl_surface; transform: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_SET_BUFFER_TRANSFORM, transform);
end;

procedure wl_surface_set_buffer_scale(wl_surface: Pwl_surface; scale: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_SET_BUFFER_SCALE, scale);
end;

procedure wl_surface_damage_buffer(wl_surface: Pwl_surface; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_surface),
      _WL_SURFACE_DAMAGE_BUFFER, x, y, width, height);
end;

function  wl_surface_add_listener(wl_surface: Pwl_surface; listener: Pwl_surface_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_surface), listener, data);
end;

procedure  wl_surface_add_listener(wl_surface: Pwl_surface; AIntf: Iwl_surfaceListener);
begin
  wl_surface_add_listener(wl_surface, @vIntf_wl_surface_Listener, AIntf);
end;

procedure wl_surface_set_user_data(wl_surface: Pwl_surface; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_surface), user_data);
end;

function  wl_surface_get_user_data(wl_surface: Pwl_surface): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_surface));
end;

function  wl_surface_get_version(wl_surface: Pwl_surface): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_surface));
end;

function  wl_seat_get_pointer(wl_seat: Pwl_seat): Pwl_pointer;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_seat),
      _WL_SEAT_GET_POINTER, @wl_pointer_interface, nil);
  Result := Pwl_pointer(id);
end;

function  wl_seat_get_keyboard(wl_seat: Pwl_seat): Pwl_keyboard;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_seat),
      _WL_SEAT_GET_KEYBOARD, @wl_keyboard_interface, nil);
  Result := Pwl_keyboard(id);
end;

function  wl_seat_get_touch(wl_seat: Pwl_seat): Pwl_touch;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_seat),
      _WL_SEAT_GET_TOUCH, @wl_touch_interface, nil);
  Result := Pwl_touch(id);
end;

procedure wl_seat_release(wl_seat: Pwl_seat);
begin
  wl_proxy_marshal(Pwl_proxy(wl_seat), _WL_SEAT_RELEASE);
  wl_proxy_destroy(Pwl_proxy(wl_seat));
end;

function  wl_seat_add_listener(wl_seat: Pwl_seat; listener: Pwl_seat_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_seat), listener, data);
end;

procedure  wl_seat_add_listener(wl_seat: Pwl_seat; AIntf: Iwl_seatListener);
begin
  wl_seat_add_listener(wl_seat, @vIntf_wl_seat_Listener, AIntf);
end;

procedure wl_seat_set_user_data(wl_seat: Pwl_seat; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_seat), user_data);
end;

function  wl_seat_get_user_data(wl_seat: Pwl_seat): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_seat));
end;

function  wl_seat_get_version(wl_seat: Pwl_seat): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_seat));
end;

procedure wl_pointer_set_cursor(wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface; hotspot_x: cint; hotspot_y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_pointer),
      _WL_POINTER_SET_CURSOR, serial, surface, hotspot_x, hotspot_y);
end;

procedure wl_pointer_release(wl_pointer: Pwl_pointer);
begin
  wl_proxy_marshal(Pwl_proxy(wl_pointer), _WL_POINTER_RELEASE);
  wl_proxy_destroy(Pwl_proxy(wl_pointer));
end;

function  wl_pointer_add_listener(wl_pointer: Pwl_pointer; listener: Pwl_pointer_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_pointer), listener, data);
end;

procedure  wl_pointer_add_listener(wl_pointer: Pwl_pointer; AIntf: Iwl_pointerListener);
begin
  wl_pointer_add_listener(wl_pointer, @vIntf_wl_pointer_Listener, AIntf);
end;

procedure wl_pointer_set_user_data(wl_pointer: Pwl_pointer; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_pointer), user_data);
end;

function  wl_pointer_get_user_data(wl_pointer: Pwl_pointer): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_pointer));
end;

function  wl_pointer_get_version(wl_pointer: Pwl_pointer): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_pointer));
end;

procedure wl_keyboard_release(wl_keyboard: Pwl_keyboard);
begin
  wl_proxy_marshal(Pwl_proxy(wl_keyboard), _WL_KEYBOARD_RELEASE);
  wl_proxy_destroy(Pwl_proxy(wl_keyboard));
end;

function  wl_keyboard_add_listener(wl_keyboard: Pwl_keyboard; listener: Pwl_keyboard_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_keyboard), listener, data);
end;

procedure  wl_keyboard_add_listener(wl_keyboard: Pwl_keyboard; AIntf: Iwl_keyboardListener);
begin
  wl_keyboard_add_listener(wl_keyboard, @vIntf_wl_keyboard_Listener, AIntf);
end;

procedure wl_keyboard_set_user_data(wl_keyboard: Pwl_keyboard; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_keyboard), user_data);
end;

function  wl_keyboard_get_user_data(wl_keyboard: Pwl_keyboard): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_keyboard));
end;

function  wl_keyboard_get_version(wl_keyboard: Pwl_keyboard): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_keyboard));
end;

procedure wl_touch_release(wl_touch: Pwl_touch);
begin
  wl_proxy_marshal(Pwl_proxy(wl_touch), _WL_TOUCH_RELEASE);
  wl_proxy_destroy(Pwl_proxy(wl_touch));
end;

function  wl_touch_add_listener(wl_touch: Pwl_touch; listener: Pwl_touch_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_touch), listener, data);
end;

procedure  wl_touch_add_listener(wl_touch: Pwl_touch; AIntf: Iwl_touchListener);
begin
  wl_touch_add_listener(wl_touch, @vIntf_wl_touch_Listener, AIntf);
end;

procedure wl_touch_set_user_data(wl_touch: Pwl_touch; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_touch), user_data);
end;

function  wl_touch_get_user_data(wl_touch: Pwl_touch): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_touch));
end;

function  wl_touch_get_version(wl_touch: Pwl_touch): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_touch));
end;

procedure wl_output_release(wl_output: Pwl_output);
begin
  wl_proxy_marshal(Pwl_proxy(wl_output), _WL_OUTPUT_RELEASE);
  wl_proxy_destroy(Pwl_proxy(wl_output));
end;

function  wl_output_add_listener(wl_output: Pwl_output; listener: Pwl_output_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_output), listener, data);
end;

procedure  wl_output_add_listener(wl_output: Pwl_output; AIntf: Iwl_outputListener);
begin
  wl_output_add_listener(wl_output, @vIntf_wl_output_Listener, AIntf);
end;

procedure wl_output_set_user_data(wl_output: Pwl_output; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_output), user_data);
end;

function  wl_output_get_user_data(wl_output: Pwl_output): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_output));
end;

function  wl_output_get_version(wl_output: Pwl_output): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_output));
end;

procedure wl_region_destroy(wl_region: Pwl_region);
begin
  wl_proxy_marshal(Pwl_proxy(wl_region), _WL_REGION_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_region));
end;

procedure wl_region_add(wl_region: Pwl_region; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_region),
      _WL_REGION_ADD, x, y, width, height);
end;

procedure wl_region_subtract(wl_region: Pwl_region; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_region),
      _WL_REGION_SUBTRACT, x, y, width, height);
end;

function  wl_region_add_listener(wl_region: Pwl_region; listener: Pwl_region_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_region), listener, data);
end;

procedure  wl_region_add_listener(wl_region: Pwl_region; AIntf: Iwl_regionListener);
begin
  wl_region_add_listener(wl_region, @vIntf_wl_region_Listener, AIntf);
end;

procedure wl_region_set_user_data(wl_region: Pwl_region; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_region), user_data);
end;

function  wl_region_get_user_data(wl_region: Pwl_region): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_region));
end;

function  wl_region_get_version(wl_region: Pwl_region): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_region));
end;

procedure wl_subcompositor_destroy(wl_subcompositor: Pwl_subcompositor);
begin
  wl_proxy_marshal(Pwl_proxy(wl_subcompositor), _WL_SUBCOMPOSITOR_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_subcompositor));
end;

function  wl_subcompositor_get_subsurface(wl_subcompositor: Pwl_subcompositor; surface: Pwl_surface; parent: Pwl_surface): Pwl_subsurface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wl_subcompositor),
      _WL_SUBCOMPOSITOR_GET_SUBSURFACE, @wl_subsurface_interface, nil, surface, parent);
  Result := Pwl_subsurface(id);
end;

function  wl_subcompositor_add_listener(wl_subcompositor: Pwl_subcompositor; listener: Pwl_subcompositor_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_subcompositor), listener, data);
end;

procedure  wl_subcompositor_add_listener(wl_subcompositor: Pwl_subcompositor; AIntf: Iwl_subcompositorListener);
begin
  wl_subcompositor_add_listener(wl_subcompositor, @vIntf_wl_subcompositor_Listener, AIntf);
end;

procedure wl_subcompositor_set_user_data(wl_subcompositor: Pwl_subcompositor; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_subcompositor), user_data);
end;

function  wl_subcompositor_get_user_data(wl_subcompositor: Pwl_subcompositor): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_subcompositor));
end;

function  wl_subcompositor_get_version(wl_subcompositor: Pwl_subcompositor): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_subcompositor));
end;

procedure wl_subsurface_destroy(wl_subsurface: Pwl_subsurface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_subsurface), _WL_SUBSURFACE_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wl_subsurface));
end;

procedure wl_subsurface_set_position(wl_subsurface: Pwl_subsurface; x: cint; y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wl_subsurface),
      _WL_SUBSURFACE_SET_POSITION, x, y);
end;

procedure wl_subsurface_place_above(wl_subsurface: Pwl_subsurface; sibling: Pwl_surface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_subsurface),
      _WL_SUBSURFACE_PLACE_ABOVE, sibling);
end;

procedure wl_subsurface_place_below(wl_subsurface: Pwl_subsurface; sibling: Pwl_surface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_subsurface),
      _WL_SUBSURFACE_PLACE_BELOW, sibling);
end;

procedure wl_subsurface_set_sync(wl_subsurface: Pwl_subsurface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_subsurface),
      _WL_SUBSURFACE_SET_SYNC);
end;

procedure wl_subsurface_set_desync(wl_subsurface: Pwl_subsurface);
begin
  wl_proxy_marshal(Pwl_proxy(wl_subsurface),
      _WL_SUBSURFACE_SET_DESYNC);
end;

function  wl_subsurface_add_listener(wl_subsurface: Pwl_subsurface; listener: Pwl_subsurface_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wl_subsurface), listener, data);
end;

procedure  wl_subsurface_add_listener(wl_subsurface: Pwl_subsurface; AIntf: Iwl_subsurfaceListener);
begin
  wl_subsurface_add_listener(wl_subsurface, @vIntf_wl_subsurface_Listener, AIntf);
end;

procedure wl_subsurface_set_user_data(wl_subsurface: Pwl_subsurface; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wl_subsurface), user_data);
end;

function  wl_subsurface_get_user_data(wl_subsurface: Pwl_subsurface): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wl_subsurface));
end;

function  wl_subsurface_get_version(wl_subsurface: Pwl_subsurface): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wl_subsurface));
end;


procedure wl_display_error_Intf(AIntf: Iwl_displayListener; wl_display: Pwl_display; object_id: pointer; code: cuint; message: pchar); cdecl;
begin
  WriteLn('wl_display.error');
  AIntf.wl_display_error(wl_display, object_id, code, message);
end;

procedure wl_display_delete_id_Intf(AIntf: Iwl_displayListener; wl_display: Pwl_display; id: cuint); cdecl;
begin
  WriteLn('wl_display.delete_id');
  AIntf.wl_display_delete_id(wl_display, id);
end;

procedure wl_registry_global_Intf(AIntf: Iwl_registryListener; wl_registry: Pwl_registry; name: cuint; &interface: pchar; version: cuint); cdecl;
begin
  WriteLn('wl_registry.global');
  AIntf.wl_registry_global(wl_registry, name, &interface, version);
end;

procedure wl_registry_global_remove_Intf(AIntf: Iwl_registryListener; wl_registry: Pwl_registry; name: cuint); cdecl;
begin
  WriteLn('wl_registry.global_remove');
  AIntf.wl_registry_global_remove(wl_registry, name);
end;

procedure wl_callback_done_Intf(AIntf: Iwl_callbackListener; wl_callback: Pwl_callback; callback_data: cuint); cdecl;
begin
  WriteLn('wl_callback.done');
  AIntf.wl_callback_done(wl_callback, callback_data);
end;

procedure wl_shm_format_Intf(AIntf: Iwl_shmListener; wl_shm: Pwl_shm; format: cuint); cdecl;
begin
  WriteLn('wl_shm.format');
  AIntf.wl_shm_format(wl_shm, format);
end;

procedure wl_buffer_release_Intf(AIntf: Iwl_bufferListener; wl_buffer: Pwl_buffer); cdecl;
begin
  WriteLn('wl_buffer.release');
  AIntf.wl_buffer_release(wl_buffer);
end;

procedure wl_data_offer_offer_Intf(AIntf: Iwl_data_offerListener; wl_data_offer: Pwl_data_offer; mime_type: pchar); cdecl;
begin
  WriteLn('wl_data_offer.offer');
  AIntf.wl_data_offer_offer(wl_data_offer, mime_type);
end;

procedure wl_data_offer_source_actions_Intf(AIntf: Iwl_data_offerListener; wl_data_offer: Pwl_data_offer; source_actions: cuint); cdecl;
begin
  WriteLn('wl_data_offer.source_actions');
  AIntf.wl_data_offer_source_actions(wl_data_offer, source_actions);
end;

procedure wl_data_offer_action_Intf(AIntf: Iwl_data_offerListener; wl_data_offer: Pwl_data_offer; dnd_action: cuint); cdecl;
begin
  WriteLn('wl_data_offer.action');
  AIntf.wl_data_offer_action(wl_data_offer, dnd_action);
end;

procedure wl_data_source_target_Intf(AIntf: Iwl_data_sourceListener; wl_data_source: Pwl_data_source; mime_type: pchar); cdecl;
begin
  WriteLn('wl_data_source.target');
  AIntf.wl_data_source_target(wl_data_source, mime_type);
end;

procedure wl_data_source_send_Intf(AIntf: Iwl_data_sourceListener; wl_data_source: Pwl_data_source; mime_type: pchar; fd: cint); cdecl;
begin
  WriteLn('wl_data_source.send');
  AIntf.wl_data_source_send(wl_data_source, mime_type, fd);
end;

procedure wl_data_source_cancelled_Intf(AIntf: Iwl_data_sourceListener; wl_data_source: Pwl_data_source); cdecl;
begin
  WriteLn('wl_data_source.cancelled');
  AIntf.wl_data_source_cancelled(wl_data_source);
end;

procedure wl_data_source_dnd_drop_performed_Intf(AIntf: Iwl_data_sourceListener; wl_data_source: Pwl_data_source); cdecl;
begin
  WriteLn('wl_data_source.dnd_drop_performed');
  AIntf.wl_data_source_dnd_drop_performed(wl_data_source);
end;

procedure wl_data_source_dnd_finished_Intf(AIntf: Iwl_data_sourceListener; wl_data_source: Pwl_data_source); cdecl;
begin
  WriteLn('wl_data_source.dnd_finished');
  AIntf.wl_data_source_dnd_finished(wl_data_source);
end;

procedure wl_data_source_action_Intf(AIntf: Iwl_data_sourceListener; wl_data_source: Pwl_data_source; dnd_action: cuint); cdecl;
begin
  WriteLn('wl_data_source.action');
  AIntf.wl_data_source_action(wl_data_source, dnd_action);
end;

procedure wl_data_device_data_offer_Intf(AIntf: Iwl_data_deviceListener; wl_data_device: Pwl_data_device; id: Pwl_data_offer); cdecl;
begin
  WriteLn('wl_data_device.data_offer');
  AIntf.wl_data_device_data_offer(wl_data_device, id);
end;

procedure wl_data_device_enter_Intf(AIntf: Iwl_data_deviceListener; wl_data_device: Pwl_data_device; serial: cuint; surface: Pwl_surface; x: cint32; y: cint32; id: Pwl_data_offer); cdecl;
begin
  WriteLn('wl_data_device.enter');
  AIntf.wl_data_device_enter(wl_data_device, serial, surface, x, y, id);
end;

procedure wl_data_device_leave_Intf(AIntf: Iwl_data_deviceListener; wl_data_device: Pwl_data_device); cdecl;
begin
  WriteLn('wl_data_device.leave');
  AIntf.wl_data_device_leave(wl_data_device);
end;

procedure wl_data_device_motion_Intf(AIntf: Iwl_data_deviceListener; wl_data_device: Pwl_data_device; time: cuint; x: cint32; y: cint32); cdecl;
begin
  WriteLn('wl_data_device.motion');
  AIntf.wl_data_device_motion(wl_data_device, time, x, y);
end;

procedure wl_data_device_drop_Intf(AIntf: Iwl_data_deviceListener; wl_data_device: Pwl_data_device); cdecl;
begin
  WriteLn('wl_data_device.drop');
  AIntf.wl_data_device_drop(wl_data_device);
end;

procedure wl_data_device_selection_Intf(AIntf: Iwl_data_deviceListener; wl_data_device: Pwl_data_device; id: Pwl_data_offer); cdecl;
begin
  WriteLn('wl_data_device.selection');
  AIntf.wl_data_device_selection(wl_data_device, id);
end;

procedure wl_shell_surface_ping_Intf(AIntf: Iwl_shell_surfaceListener; wl_shell_surface: Pwl_shell_surface; serial: cuint); cdecl;
begin
  WriteLn('wl_shell_surface.ping');
  AIntf.wl_shell_surface_ping(wl_shell_surface, serial);
end;

procedure wl_shell_surface_configure_Intf(AIntf: Iwl_shell_surfaceListener; wl_shell_surface: Pwl_shell_surface; edges: cuint; width: cint; height: cint); cdecl;
begin
  WriteLn('wl_shell_surface.configure');
  AIntf.wl_shell_surface_configure(wl_shell_surface, edges, width, height);
end;

procedure wl_shell_surface_popup_done_Intf(AIntf: Iwl_shell_surfaceListener; wl_shell_surface: Pwl_shell_surface); cdecl;
begin
  WriteLn('wl_shell_surface.popup_done');
  AIntf.wl_shell_surface_popup_done(wl_shell_surface);
end;

procedure wl_surface_enter_Intf(AIntf: Iwl_surfaceListener; wl_surface: Pwl_surface; output: Pwl_output); cdecl;
begin
  WriteLn('wl_surface.enter');
  AIntf.wl_surface_enter(wl_surface, output);
end;

procedure wl_surface_leave_Intf(AIntf: Iwl_surfaceListener; wl_surface: Pwl_surface; output: Pwl_output); cdecl;
begin
  WriteLn('wl_surface.leave');
  AIntf.wl_surface_leave(wl_surface, output);
end;

procedure wl_seat_capabilities_Intf(AIntf: Iwl_seatListener; wl_seat: Pwl_seat; capabilities: cuint); cdecl;
begin
  WriteLn('wl_seat.capabilities');
  AIntf.wl_seat_capabilities(wl_seat, capabilities);
end;

procedure wl_seat_name_Intf(AIntf: Iwl_seatListener; wl_seat: Pwl_seat; name: pchar); cdecl;
begin
  WriteLn('wl_seat.name');
  AIntf.wl_seat_name(wl_seat, name);
end;

procedure wl_pointer_enter_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface; surface_x: cint32; surface_y: cint32); cdecl;
begin
  WriteLn('wl_pointer.enter');
  AIntf.wl_pointer_enter(wl_pointer, serial, surface, surface_x, surface_y);
end;

procedure wl_pointer_leave_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; serial: cuint; surface: Pwl_surface); cdecl;
begin
  WriteLn('wl_pointer.leave');
  AIntf.wl_pointer_leave(wl_pointer, serial, surface);
end;

procedure wl_pointer_motion_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; time: cuint; surface_x: cint32; surface_y: cint32); cdecl;
begin
  WriteLn('wl_pointer.motion');
  AIntf.wl_pointer_motion(wl_pointer, time, surface_x, surface_y);
end;

procedure wl_pointer_button_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; serial: cuint; time: cuint; button: cuint; state: cuint); cdecl;
begin
  WriteLn('wl_pointer.button');
  AIntf.wl_pointer_button(wl_pointer, serial, time, button, state);
end;

procedure wl_pointer_axis_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; time: cuint; axis: cuint; value: cint32); cdecl;
begin
  WriteLn('wl_pointer.axis');
  AIntf.wl_pointer_axis(wl_pointer, time, axis, value);
end;

procedure wl_pointer_frame_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer); cdecl;
begin
  WriteLn('wl_pointer.frame');
  AIntf.wl_pointer_frame(wl_pointer);
end;

procedure wl_pointer_axis_source_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; axis_source: cuint); cdecl;
begin
  WriteLn('wl_pointer.axis_source');
  AIntf.wl_pointer_axis_source(wl_pointer, axis_source);
end;

procedure wl_pointer_axis_stop_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; time: cuint; axis: cuint); cdecl;
begin
  WriteLn('wl_pointer.axis_stop');
  AIntf.wl_pointer_axis_stop(wl_pointer, time, axis);
end;

procedure wl_pointer_axis_discrete_Intf(AIntf: Iwl_pointerListener; wl_pointer: Pwl_pointer; axis: cuint; discrete: cint); cdecl;
begin
  WriteLn('wl_pointer.axis_discrete');
  AIntf.wl_pointer_axis_discrete(wl_pointer, axis, discrete);
end;

procedure wl_keyboard_keymap_Intf(AIntf: Iwl_keyboardListener; wl_keyboard: Pwl_keyboard; format: cuint; fd: cint; size: cuint); cdecl;
begin
  WriteLn('wl_keyboard.keymap');
  AIntf.wl_keyboard_keymap(wl_keyboard, format, fd, size);
end;

procedure wl_keyboard_enter_Intf(AIntf: Iwl_keyboardListener; wl_keyboard: Pwl_keyboard; serial: cuint; surface: Pwl_surface; keys: Pwl_array); cdecl;
begin
  WriteLn('wl_keyboard.enter');
  AIntf.wl_keyboard_enter(wl_keyboard, serial, surface, keys);
end;

procedure wl_keyboard_leave_Intf(AIntf: Iwl_keyboardListener; wl_keyboard: Pwl_keyboard; serial: cuint; surface: Pwl_surface); cdecl;
begin
  WriteLn('wl_keyboard.leave');
  AIntf.wl_keyboard_leave(wl_keyboard, serial, surface);
end;

procedure wl_keyboard_key_Intf(AIntf: Iwl_keyboardListener; wl_keyboard: Pwl_keyboard; serial: cuint; time: cuint; key: cuint; state: cuint); cdecl;
begin
  WriteLn('wl_keyboard.key');
  AIntf.wl_keyboard_key(wl_keyboard, serial, time, key, state);
end;

procedure wl_keyboard_modifiers_Intf(AIntf: Iwl_keyboardListener; wl_keyboard: Pwl_keyboard; serial: cuint; mods_depressed: cuint; mods_latched: cuint; mods_locked: cuint; group: cuint); cdecl;
begin
  WriteLn('wl_keyboard.modifiers');
  AIntf.wl_keyboard_modifiers(wl_keyboard, serial, mods_depressed, mods_latched, mods_locked, group);
end;

procedure wl_keyboard_repeat_info_Intf(AIntf: Iwl_keyboardListener; wl_keyboard: Pwl_keyboard; rate: cint; delay: cint); cdecl;
begin
  WriteLn('wl_keyboard.repeat_info');
  AIntf.wl_keyboard_repeat_info(wl_keyboard, rate, delay);
end;

procedure wl_touch_down_Intf(AIntf: Iwl_touchListener; wl_touch: Pwl_touch; serial: cuint; time: cuint; surface: Pwl_surface; id: cint; x: cint32; y: cint32); cdecl;
begin
  WriteLn('wl_touch.down');
  AIntf.wl_touch_down(wl_touch, serial, time, surface, id, x, y);
end;

procedure wl_touch_up_Intf(AIntf: Iwl_touchListener; wl_touch: Pwl_touch; serial: cuint; time: cuint; id: cint); cdecl;
begin
  WriteLn('wl_touch.up');
  AIntf.wl_touch_up(wl_touch, serial, time, id);
end;

procedure wl_touch_motion_Intf(AIntf: Iwl_touchListener; wl_touch: Pwl_touch; time: cuint; id: cint; x: cint32; y: cint32); cdecl;
begin
  WriteLn('wl_touch.motion');
  AIntf.wl_touch_motion(wl_touch, time, id, x, y);
end;

procedure wl_touch_frame_Intf(AIntf: Iwl_touchListener; wl_touch: Pwl_touch); cdecl;
begin
  WriteLn('wl_touch.frame');
  AIntf.wl_touch_frame(wl_touch);
end;

procedure wl_touch_cancel_Intf(AIntf: Iwl_touchListener; wl_touch: Pwl_touch); cdecl;
begin
  WriteLn('wl_touch.cancel');
  AIntf.wl_touch_cancel(wl_touch);
end;

procedure wl_touch_shape_Intf(AIntf: Iwl_touchListener; wl_touch: Pwl_touch; id: cint; major: cint32; minor: cint32); cdecl;
begin
  WriteLn('wl_touch.shape');
  AIntf.wl_touch_shape(wl_touch, id, major, minor);
end;

procedure wl_touch_orientation_Intf(AIntf: Iwl_touchListener; wl_touch: Pwl_touch; id: cint; orientation: cint32); cdecl;
begin
  WriteLn('wl_touch.orientation');
  AIntf.wl_touch_orientation(wl_touch, id, orientation);
end;

procedure wl_output_geometry_Intf(AIntf: Iwl_outputListener; wl_output: Pwl_output; x: cint; y: cint; physical_width: cint; physical_height: cint; subpixel: cint; make: pchar; model: pchar; transform: cint); cdecl;
begin
  WriteLn('wl_output.geometry');
  AIntf.wl_output_geometry(wl_output, x, y, physical_width, physical_height, subpixel, make, model, transform);
end;

procedure wl_output_mode_Intf(AIntf: Iwl_outputListener; wl_output: Pwl_output; flags: cuint; width: cint; height: cint; refresh: cint); cdecl;
begin
  WriteLn('wl_output.mode');
  AIntf.wl_output_mode(wl_output, flags, width, height, refresh);
end;

procedure wl_output_done_Intf(AIntf: Iwl_outputListener; wl_output: Pwl_output); cdecl;
begin
  WriteLn('wl_output.done');
  AIntf.wl_output_done(wl_output);
end;

procedure wl_output_scale_Intf(AIntf: Iwl_outputListener; wl_output: Pwl_output; factor: cint); cdecl;
begin
  WriteLn('wl_output.scale');
  AIntf.wl_output_scale(wl_output, factor);
end;



const
  pInterfaces: array[0..93] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_callback_interface),
    (@wl_registry_interface),
    (@wl_surface_interface),
    (@wl_region_interface),
    (@wl_buffer_interface),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_shm_pool_interface),
    (nil),
    (nil),
    (@wl_data_source_interface),
    (@wl_surface_interface),
    (@wl_surface_interface),
    (nil),
    (@wl_data_source_interface),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (@wl_data_offer_interface),
    (@wl_data_offer_interface),
    (@wl_data_source_interface),
    (@wl_data_device_interface),
    (@wl_seat_interface),
    (@wl_shell_surface_interface),
    (@wl_surface_interface),
    (@wl_seat_interface),
    (nil),
    (@wl_seat_interface),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_output_interface),
    (@wl_seat_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_output_interface),
    (@wl_buffer_interface),
    (nil),
    (nil),
    (@wl_callback_interface),
    (@wl_region_interface),
    (@wl_region_interface),
    (@wl_output_interface),
    (@wl_output_interface),
    (@wl_pointer_interface),
    (@wl_keyboard_interface),
    (@wl_touch_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_subsurface_interface),
    (@wl_surface_interface),
    (@wl_surface_interface),
    (@wl_surface_interface),
    (@wl_surface_interface)
  );

  wl_display_requests: array[0..1] of Twl_message = (
    (name: 'sync'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_registry'; signature: 'n'; types: @pInterfaces[9])
  );
  wl_display_events: array[0..1] of Twl_message = (
    (name: 'error'; signature: 'ous'; types: @pInterfaces[0]),
    (name: 'delete_id'; signature: 'u'; types: @pInterfaces[0])
  );
  wl_registry_requests: array[0..0] of Twl_message = (
    (name: 'bind'; signature: 'usun'; types: @pInterfaces[0])
  );
  wl_registry_events: array[0..1] of Twl_message = (
    (name: 'global'; signature: 'usu'; types: @pInterfaces[0]),
    (name: 'global_remove'; signature: 'u'; types: @pInterfaces[0])
  );
  wl_callback_events: array[0..0] of Twl_message = (
    (name: 'done'; signature: 'u'; types: @pInterfaces[0])
  );
  wl_compositor_requests: array[0..1] of Twl_message = (
    (name: 'create_surface'; signature: 'n'; types: @pInterfaces[10]),
    (name: 'create_region'; signature: 'n'; types: @pInterfaces[11])
  );
  wl_shm_pool_requests: array[0..2] of Twl_message = (
    (name: 'create_buffer'; signature: 'niiiiu'; types: @pInterfaces[12]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'resize'; signature: 'i'; types: @pInterfaces[0])
  );
  wl_shm_requests: array[0..0] of Twl_message = (
    (name: 'create_pool'; signature: 'nhi'; types: @pInterfaces[18])
  );
  wl_shm_events: array[0..0] of Twl_message = (
    (name: 'format'; signature: 'u'; types: @pInterfaces[0])
  );
  wl_buffer_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wl_buffer_events: array[0..0] of Twl_message = (
    (name: 'release'; signature: ''; types: @pInterfaces[0])
  );
  wl_data_offer_requests: array[0..4] of Twl_message = (
    (name: 'accept'; signature: 'u?s'; types: @pInterfaces[0]),
    (name: 'receive'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'finish'; signature: '3'; types: @pInterfaces[0]),
    (name: 'set_actions'; signature: '3uu'; types: @pInterfaces[0])
  );
  wl_data_offer_events: array[0..2] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0]),
    (name: 'source_actions'; signature: '3u'; types: @pInterfaces[0]),
    (name: 'action'; signature: '3u'; types: @pInterfaces[0])
  );
  wl_data_source_requests: array[0..2] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_actions'; signature: '3u'; types: @pInterfaces[0])
  );
  wl_data_source_events: array[0..5] of Twl_message = (
    (name: 'target'; signature: '?s'; types: @pInterfaces[0]),
    (name: 'send'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'cancelled'; signature: ''; types: @pInterfaces[0]),
    (name: 'dnd_drop_performed'; signature: '3'; types: @pInterfaces[0]),
    (name: 'dnd_finished'; signature: '3'; types: @pInterfaces[0]),
    (name: 'action'; signature: '3u'; types: @pInterfaces[0])
  );
  wl_data_device_requests: array[0..2] of Twl_message = (
    (name: 'start_drag'; signature: '?oo?ou'; types: @pInterfaces[21]),
    (name: 'set_selection'; signature: '?ou'; types: @pInterfaces[25]),
    (name: 'release'; signature: '2'; types: @pInterfaces[0])
  );
  wl_data_device_events: array[0..5] of Twl_message = (
    (name: 'data_offer'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'enter'; signature: 'uoff?o'; types: @pInterfaces[27]),
    (name: 'leave'; signature: ''; types: @pInterfaces[0]),
    (name: 'motion'; signature: 'uff'; types: @pInterfaces[0]),
    (name: 'drop'; signature: ''; types: @pInterfaces[0]),
    (name: 'selection'; signature: '?o'; types: @pInterfaces[32])
  );
  wl_data_device_manager_requests: array[0..1] of Twl_message = (
    (name: 'create_data_source'; signature: 'n'; types: @pInterfaces[33]),
    (name: 'get_data_device'; signature: 'no'; types: @pInterfaces[34])
  );
  wl_shell_requests: array[0..0] of Twl_message = (
    (name: 'get_shell_surface'; signature: 'no'; types: @pInterfaces[36])
  );
  wl_shell_surface_requests: array[0..9] of Twl_message = (
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'move'; signature: 'ou'; types: @pInterfaces[38]),
    (name: 'resize'; signature: 'ouu'; types: @pInterfaces[40]),
    (name: 'set_toplevel'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_transient'; signature: 'oiiu'; types: @pInterfaces[43]),
    (name: 'set_fullscreen'; signature: 'uu?o'; types: @pInterfaces[47]),
    (name: 'set_popup'; signature: 'ouoiiu'; types: @pInterfaces[50]),
    (name: 'set_maximized'; signature: '?o'; types: @pInterfaces[56]),
    (name: 'set_title'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_class'; signature: 's'; types: @pInterfaces[0])
  );
  wl_shell_surface_events: array[0..2] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'configure'; signature: 'uii'; types: @pInterfaces[0]),
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0])
  );
  wl_surface_requests: array[0..9] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'attach'; signature: '?oii'; types: @pInterfaces[57]),
    (name: 'damage'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'n'; types: @pInterfaces[60]),
    (name: 'set_opaque_region'; signature: '?o'; types: @pInterfaces[61]),
    (name: 'set_input_region'; signature: '?o'; types: @pInterfaces[62]),
    (name: 'commit'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_buffer_transform'; signature: '2i'; types: @pInterfaces[0]),
    (name: 'set_buffer_scale'; signature: '3i'; types: @pInterfaces[0]),
    (name: 'damage_buffer'; signature: '4iiii'; types: @pInterfaces[0])
  );
  wl_surface_events: array[0..1] of Twl_message = (
    (name: 'enter'; signature: 'o'; types: @pInterfaces[63]),
    (name: 'leave'; signature: 'o'; types: @pInterfaces[64])
  );
  wl_seat_requests: array[0..3] of Twl_message = (
    (name: 'get_pointer'; signature: 'n'; types: @pInterfaces[65]),
    (name: 'get_keyboard'; signature: 'n'; types: @pInterfaces[66]),
    (name: 'get_touch'; signature: 'n'; types: @pInterfaces[67]),
    (name: 'release'; signature: '5'; types: @pInterfaces[0])
  );
  wl_seat_events: array[0..1] of Twl_message = (
    (name: 'capabilities'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'name'; signature: '2s'; types: @pInterfaces[0])
  );
  wl_pointer_requests: array[0..1] of Twl_message = (
    (name: 'set_cursor'; signature: 'u?oii'; types: @pInterfaces[68]),
    (name: 'release'; signature: '3'; types: @pInterfaces[0])
  );
  wl_pointer_events: array[0..8] of Twl_message = (
    (name: 'enter'; signature: 'uoff'; types: @pInterfaces[72]),
    (name: 'leave'; signature: 'uo'; types: @pInterfaces[76]),
    (name: 'motion'; signature: 'uff'; types: @pInterfaces[0]),
    (name: 'button'; signature: 'uuuu'; types: @pInterfaces[0]),
    (name: 'axis'; signature: 'uuf'; types: @pInterfaces[0]),
    (name: 'frame'; signature: '5'; types: @pInterfaces[0]),
    (name: 'axis_source'; signature: '5u'; types: @pInterfaces[0]),
    (name: 'axis_stop'; signature: '5uu'; types: @pInterfaces[0]),
    (name: 'axis_discrete'; signature: '5ui'; types: @pInterfaces[0])
  );
  wl_keyboard_requests: array[0..0] of Twl_message = (
    (name: 'release'; signature: '3'; types: @pInterfaces[0])
  );
  wl_keyboard_events: array[0..5] of Twl_message = (
    (name: 'keymap'; signature: 'uhu'; types: @pInterfaces[0]),
    (name: 'enter'; signature: 'uoa'; types: @pInterfaces[78]),
    (name: 'leave'; signature: 'uo'; types: @pInterfaces[81]),
    (name: 'key'; signature: 'uuuu'; types: @pInterfaces[0]),
    (name: 'modifiers'; signature: 'uuuuu'; types: @pInterfaces[0]),
    (name: 'repeat_info'; signature: '4ii'; types: @pInterfaces[0])
  );
  wl_touch_requests: array[0..0] of Twl_message = (
    (name: 'release'; signature: '3'; types: @pInterfaces[0])
  );
  wl_touch_events: array[0..6] of Twl_message = (
    (name: 'down'; signature: 'uuoiff'; types: @pInterfaces[83]),
    (name: 'up'; signature: 'uui'; types: @pInterfaces[0]),
    (name: 'motion'; signature: 'uiff'; types: @pInterfaces[0]),
    (name: 'frame'; signature: ''; types: @pInterfaces[0]),
    (name: 'cancel'; signature: ''; types: @pInterfaces[0]),
    (name: 'shape'; signature: '6iff'; types: @pInterfaces[0]),
    (name: 'orientation'; signature: '6if'; types: @pInterfaces[0])
  );
  wl_output_requests: array[0..0] of Twl_message = (
    (name: 'release'; signature: '3'; types: @pInterfaces[0])
  );
  wl_output_events: array[0..3] of Twl_message = (
    (name: 'geometry'; signature: 'iiiiissi'; types: @pInterfaces[0]),
    (name: 'mode'; signature: 'uiii'; types: @pInterfaces[0]),
    (name: 'done'; signature: '2'; types: @pInterfaces[0]),
    (name: 'scale'; signature: '2i'; types: @pInterfaces[0])
  );
  wl_region_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'add'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'subtract'; signature: 'iiii'; types: @pInterfaces[0])
  );
  wl_subcompositor_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_subsurface'; signature: 'noo'; types: @pInterfaces[89])
  );
  wl_subsurface_requests: array[0..5] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_position'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'place_above'; signature: 'o'; types: @pInterfaces[92]),
    (name: 'place_below'; signature: 'o'; types: @pInterfaces[93]),
    (name: 'set_sync'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_desync'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_wl_display_Listener.error) := @wl_display_error_Intf;
  Pointer(vIntf_wl_display_Listener.delete_id) := @wl_display_delete_id_Intf;
  Pointer(vIntf_wl_registry_Listener.global) := @wl_registry_global_Intf;
  Pointer(vIntf_wl_registry_Listener.global_remove) := @wl_registry_global_remove_Intf;
  Pointer(vIntf_wl_callback_Listener.done) := @wl_callback_done_Intf;
  Pointer(vIntf_wl_shm_Listener.format) := @wl_shm_format_Intf;
  Pointer(vIntf_wl_buffer_Listener.release) := @wl_buffer_release_Intf;
  Pointer(vIntf_wl_data_offer_Listener.offer) := @wl_data_offer_offer_Intf;
  Pointer(vIntf_wl_data_offer_Listener.source_actions) := @wl_data_offer_source_actions_Intf;
  Pointer(vIntf_wl_data_offer_Listener.action) := @wl_data_offer_action_Intf;
  Pointer(vIntf_wl_data_source_Listener.target) := @wl_data_source_target_Intf;
  Pointer(vIntf_wl_data_source_Listener.send) := @wl_data_source_send_Intf;
  Pointer(vIntf_wl_data_source_Listener.cancelled) := @wl_data_source_cancelled_Intf;
  Pointer(vIntf_wl_data_source_Listener.dnd_drop_performed) := @wl_data_source_dnd_drop_performed_Intf;
  Pointer(vIntf_wl_data_source_Listener.dnd_finished) := @wl_data_source_dnd_finished_Intf;
  Pointer(vIntf_wl_data_source_Listener.action) := @wl_data_source_action_Intf;
  Pointer(vIntf_wl_data_device_Listener.data_offer) := @wl_data_device_data_offer_Intf;
  Pointer(vIntf_wl_data_device_Listener.enter) := @wl_data_device_enter_Intf;
  Pointer(vIntf_wl_data_device_Listener.leave) := @wl_data_device_leave_Intf;
  Pointer(vIntf_wl_data_device_Listener.motion) := @wl_data_device_motion_Intf;
  Pointer(vIntf_wl_data_device_Listener.drop) := @wl_data_device_drop_Intf;
  Pointer(vIntf_wl_data_device_Listener.selection) := @wl_data_device_selection_Intf;
  Pointer(vIntf_wl_shell_surface_Listener.ping) := @wl_shell_surface_ping_Intf;
  Pointer(vIntf_wl_shell_surface_Listener.configure) := @wl_shell_surface_configure_Intf;
  Pointer(vIntf_wl_shell_surface_Listener.popup_done) := @wl_shell_surface_popup_done_Intf;
  Pointer(vIntf_wl_surface_Listener.enter) := @wl_surface_enter_Intf;
  Pointer(vIntf_wl_surface_Listener.leave) := @wl_surface_leave_Intf;
  Pointer(vIntf_wl_seat_Listener.capabilities) := @wl_seat_capabilities_Intf;
  Pointer(vIntf_wl_seat_Listener.name) := @wl_seat_name_Intf;
  Pointer(vIntf_wl_pointer_Listener.enter) := @wl_pointer_enter_Intf;
  Pointer(vIntf_wl_pointer_Listener.leave) := @wl_pointer_leave_Intf;
  Pointer(vIntf_wl_pointer_Listener.motion) := @wl_pointer_motion_Intf;
  Pointer(vIntf_wl_pointer_Listener.button) := @wl_pointer_button_Intf;
  Pointer(vIntf_wl_pointer_Listener.axis) := @wl_pointer_axis_Intf;
  Pointer(vIntf_wl_pointer_Listener.frame) := @wl_pointer_frame_Intf;
  Pointer(vIntf_wl_pointer_Listener.axis_source) := @wl_pointer_axis_source_Intf;
  Pointer(vIntf_wl_pointer_Listener.axis_stop) := @wl_pointer_axis_stop_Intf;
  Pointer(vIntf_wl_pointer_Listener.axis_discrete) := @wl_pointer_axis_discrete_Intf;
  Pointer(vIntf_wl_keyboard_Listener.keymap) := @wl_keyboard_keymap_Intf;
  Pointer(vIntf_wl_keyboard_Listener.enter) := @wl_keyboard_enter_Intf;
  Pointer(vIntf_wl_keyboard_Listener.leave) := @wl_keyboard_leave_Intf;
  Pointer(vIntf_wl_keyboard_Listener.key) := @wl_keyboard_key_Intf;
  Pointer(vIntf_wl_keyboard_Listener.modifiers) := @wl_keyboard_modifiers_Intf;
  Pointer(vIntf_wl_keyboard_Listener.repeat_info) := @wl_keyboard_repeat_info_Intf;
  Pointer(vIntf_wl_touch_Listener.down) := @wl_touch_down_Intf;
  Pointer(vIntf_wl_touch_Listener.up) := @wl_touch_up_Intf;
  Pointer(vIntf_wl_touch_Listener.motion) := @wl_touch_motion_Intf;
  Pointer(vIntf_wl_touch_Listener.frame) := @wl_touch_frame_Intf;
  Pointer(vIntf_wl_touch_Listener.cancel) := @wl_touch_cancel_Intf;
  Pointer(vIntf_wl_touch_Listener.shape) := @wl_touch_shape_Intf;
  Pointer(vIntf_wl_touch_Listener.orientation) := @wl_touch_orientation_Intf;
  Pointer(vIntf_wl_output_Listener.geometry) := @wl_output_geometry_Intf;
  Pointer(vIntf_wl_output_Listener.mode) := @wl_output_mode_Intf;
  Pointer(vIntf_wl_output_Listener.done) := @wl_output_done_Intf;
  Pointer(vIntf_wl_output_Listener.scale) := @wl_output_scale_Intf;


  wl_display_interface.name := 'wl_display';
  wl_display_interface.version := 1;
  wl_display_interface.method_count := 2;
  wl_display_interface.methods := @wl_display_requests;
  wl_display_interface.event_count := 2;
  wl_display_interface.events := @wl_display_events;

  wl_registry_interface.name := 'wl_registry';
  wl_registry_interface.version := 1;
  wl_registry_interface.method_count := 1;
  wl_registry_interface.methods := @wl_registry_requests;
  wl_registry_interface.event_count := 2;
  wl_registry_interface.events := @wl_registry_events;

  wl_callback_interface.name := 'wl_callback';
  wl_callback_interface.version := 1;
  wl_callback_interface.method_count := 0;
  wl_callback_interface.methods := nil;
  wl_callback_interface.event_count := 1;
  wl_callback_interface.events := @wl_callback_events;

  wl_compositor_interface.name := 'wl_compositor';
  wl_compositor_interface.version := 4;
  wl_compositor_interface.method_count := 2;
  wl_compositor_interface.methods := @wl_compositor_requests;
  wl_compositor_interface.event_count := 0;
  wl_compositor_interface.events := nil;

  wl_shm_pool_interface.name := 'wl_shm_pool';
  wl_shm_pool_interface.version := 1;
  wl_shm_pool_interface.method_count := 3;
  wl_shm_pool_interface.methods := @wl_shm_pool_requests;
  wl_shm_pool_interface.event_count := 0;
  wl_shm_pool_interface.events := nil;

  wl_shm_interface.name := 'wl_shm';
  wl_shm_interface.version := 1;
  wl_shm_interface.method_count := 1;
  wl_shm_interface.methods := @wl_shm_requests;
  wl_shm_interface.event_count := 1;
  wl_shm_interface.events := @wl_shm_events;

  wl_buffer_interface.name := 'wl_buffer';
  wl_buffer_interface.version := 1;
  wl_buffer_interface.method_count := 1;
  wl_buffer_interface.methods := @wl_buffer_requests;
  wl_buffer_interface.event_count := 1;
  wl_buffer_interface.events := @wl_buffer_events;

  wl_data_offer_interface.name := 'wl_data_offer';
  wl_data_offer_interface.version := 3;
  wl_data_offer_interface.method_count := 5;
  wl_data_offer_interface.methods := @wl_data_offer_requests;
  wl_data_offer_interface.event_count := 3;
  wl_data_offer_interface.events := @wl_data_offer_events;

  wl_data_source_interface.name := 'wl_data_source';
  wl_data_source_interface.version := 3;
  wl_data_source_interface.method_count := 3;
  wl_data_source_interface.methods := @wl_data_source_requests;
  wl_data_source_interface.event_count := 6;
  wl_data_source_interface.events := @wl_data_source_events;

  wl_data_device_interface.name := 'wl_data_device';
  wl_data_device_interface.version := 3;
  wl_data_device_interface.method_count := 3;
  wl_data_device_interface.methods := @wl_data_device_requests;
  wl_data_device_interface.event_count := 6;
  wl_data_device_interface.events := @wl_data_device_events;

  wl_data_device_manager_interface.name := 'wl_data_device_manager';
  wl_data_device_manager_interface.version := 3;
  wl_data_device_manager_interface.method_count := 2;
  wl_data_device_manager_interface.methods := @wl_data_device_manager_requests;
  wl_data_device_manager_interface.event_count := 0;
  wl_data_device_manager_interface.events := nil;

  wl_shell_interface.name := 'wl_shell';
  wl_shell_interface.version := 1;
  wl_shell_interface.method_count := 1;
  wl_shell_interface.methods := @wl_shell_requests;
  wl_shell_interface.event_count := 0;
  wl_shell_interface.events := nil;

  wl_shell_surface_interface.name := 'wl_shell_surface';
  wl_shell_surface_interface.version := 1;
  wl_shell_surface_interface.method_count := 10;
  wl_shell_surface_interface.methods := @wl_shell_surface_requests;
  wl_shell_surface_interface.event_count := 3;
  wl_shell_surface_interface.events := @wl_shell_surface_events;

  wl_surface_interface.name := 'wl_surface';
  wl_surface_interface.version := 4;
  wl_surface_interface.method_count := 10;
  wl_surface_interface.methods := @wl_surface_requests;
  wl_surface_interface.event_count := 2;
  wl_surface_interface.events := @wl_surface_events;

  wl_seat_interface.name := 'wl_seat';
  wl_seat_interface.version := 7;
  wl_seat_interface.method_count := 4;
  wl_seat_interface.methods := @wl_seat_requests;
  wl_seat_interface.event_count := 2;
  wl_seat_interface.events := @wl_seat_events;

  wl_pointer_interface.name := 'wl_pointer';
  wl_pointer_interface.version := 7;
  wl_pointer_interface.method_count := 2;
  wl_pointer_interface.methods := @wl_pointer_requests;
  wl_pointer_interface.event_count := 9;
  wl_pointer_interface.events := @wl_pointer_events;

  wl_keyboard_interface.name := 'wl_keyboard';
  wl_keyboard_interface.version := 7;
  wl_keyboard_interface.method_count := 1;
  wl_keyboard_interface.methods := @wl_keyboard_requests;
  wl_keyboard_interface.event_count := 6;
  wl_keyboard_interface.events := @wl_keyboard_events;

  wl_touch_interface.name := 'wl_touch';
  wl_touch_interface.version := 7;
  wl_touch_interface.method_count := 1;
  wl_touch_interface.methods := @wl_touch_requests;
  wl_touch_interface.event_count := 7;
  wl_touch_interface.events := @wl_touch_events;

  wl_output_interface.name := 'wl_output';
  wl_output_interface.version := 3;
  wl_output_interface.method_count := 1;
  wl_output_interface.methods := @wl_output_requests;
  wl_output_interface.event_count := 4;
  wl_output_interface.events := @wl_output_events;

  wl_region_interface.name := 'wl_region';
  wl_region_interface.version := 1;
  wl_region_interface.method_count := 3;
  wl_region_interface.methods := @wl_region_requests;
  wl_region_interface.event_count := 0;
  wl_region_interface.events := nil;

  wl_subcompositor_interface.name := 'wl_subcompositor';
  wl_subcompositor_interface.version := 1;
  wl_subcompositor_interface.method_count := 2;
  wl_subcompositor_interface.methods := @wl_subcompositor_requests;
  wl_subcompositor_interface.event_count := 0;
  wl_subcompositor_interface.events := nil;

  wl_subsurface_interface.name := 'wl_subsurface';
  wl_subsurface_interface.version := 1;
  wl_subsurface_interface.method_count := 6;
  wl_subsurface_interface.methods := @wl_subsurface_requests;
  wl_subsurface_interface.event_count := 0;
  wl_subsurface_interface.events := nil;

end.
