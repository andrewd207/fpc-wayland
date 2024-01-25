unit wayland_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core;


type
  Pwl_display = Pointer;
  Pwl_registry = Pointer;
  Pwl_callback = Pointer;
  Pwl_compositor = Pointer;
  Pwl_shm_pool = Pointer;
  Pwl_shm = Pointer;
  Pwl_buffer = Pointer;
  Pwl_data_offer = Pointer;
  Pwl_data_source = Pointer;
  Pwl_data_device = Pointer;
  Pwl_data_device_manager = Pointer;
  Pwl_shell = Pointer;
  Pwl_shell_surface = Pointer;
  Pwl_surface = Pointer;
  Pwl_seat = Pointer;
  Pwl_pointer = Pointer;
  Pwl_keyboard = Pointer;
  Pwl_touch = Pointer;
  Pwl_output = Pointer;
  Pwl_region = Pointer;
  Pwl_subcompositor = Pointer;
  Pwl_subsurface = Pointer;
const
  WL_DISPLAY_ERROR_INVALID_OBJECT = 0; // server couldn't find object
  WL_DISPLAY_ERROR_INVALID_METHOD = 1; // method doesn't exist on the specified interface or malformed request
  WL_DISPLAY_ERROR_NO_MEMORY = 2; // server is out of memory
  WL_DISPLAY_ERROR_IMPLEMENTATION = 3; // implementation error in compositor

type
  Pwl_display_listener = ^Twl_display_listener;
  Twl_display_listener = record
    error : procedure(data: Pointer; AWlDisplay: Pwl_display; AObjectId: Pointer; ACode: DWord; AMessage: Pchar); cdecl;
    delete_id : procedure(data: Pointer; AWlDisplay: Pwl_display; AId: DWord); cdecl;
  end;

  Pwl_registry_listener = ^Twl_registry_listener;
  Twl_registry_listener = record
    global : procedure(data: Pointer; AWlRegistry: Pwl_registry; AName: DWord; AInterface: Pchar; AVersion: DWord); cdecl;
    global_remove : procedure(data: Pointer; AWlRegistry: Pwl_registry; AName: DWord); cdecl;
  end;

  Pwl_callback_listener = ^Twl_callback_listener;
  Twl_callback_listener = record
    done : procedure(data: Pointer; AWlCallback: Pwl_callback; ACallbackData: DWord); cdecl;
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
  WL_SHM_FORMAT_R8 = $20203852; // [7:0] R
  WL_SHM_FORMAT_R16 = $20363152; // [15:0] R little endian
  WL_SHM_FORMAT_RG88 = $38384752; // [15:0] R:G 8:8 little endian
  WL_SHM_FORMAT_GR88 = $38385247; // [15:0] G:R 8:8 little endian
  WL_SHM_FORMAT_RG1616 = $32334752; // [31:0] R:G 16:16 little endian
  WL_SHM_FORMAT_GR1616 = $32335247; // [31:0] G:R 16:16 little endian
  WL_SHM_FORMAT_XRGB16161616F = $48345258; // [63:0] x:R:G:B 16:16:16:16 little endian
  WL_SHM_FORMAT_XBGR16161616F = $48344258; // [63:0] x:B:G:R 16:16:16:16 little endian
  WL_SHM_FORMAT_ARGB16161616F = $48345241; // [63:0] A:R:G:B 16:16:16:16 little endian
  WL_SHM_FORMAT_ABGR16161616F = $48344241; // [63:0] A:B:G:R 16:16:16:16 little endian
  WL_SHM_FORMAT_XYUV8888 = $56555958; // [31:0] X:Y:Cb:Cr 8:8:8:8 little endian
  WL_SHM_FORMAT_VUY888 = $34325556; // [23:0] Cr:Cb:Y 8:8:8 little endian
  WL_SHM_FORMAT_VUY101010 = $30335556; // Y followed by U then V, 10:10:10. Non-linear modifier only
  WL_SHM_FORMAT_Y210 = $30313259; // [63:0] Cr0:0:Y1:0:Cb0:0:Y0:0 10:6:10:6:10:6:10:6 little endian per 2 Y pixels
  WL_SHM_FORMAT_Y212 = $32313259; // [63:0] Cr0:0:Y1:0:Cb0:0:Y0:0 12:4:12:4:12:4:12:4 little endian per 2 Y pixels
  WL_SHM_FORMAT_Y216 = $36313259; // [63:0] Cr0:Y1:Cb0:Y0 16:16:16:16 little endian per 2 Y pixels
  WL_SHM_FORMAT_Y410 = $30313459; // [31:0] A:Cr:Y:Cb 2:10:10:10 little endian
  WL_SHM_FORMAT_Y412 = $32313459; // [63:0] A:0:Cr:0:Y:0:Cb:0 12:4:12:4:12:4:12:4 little endian
  WL_SHM_FORMAT_Y416 = $36313459; // [63:0] A:Cr:Y:Cb 16:16:16:16 little endian
  WL_SHM_FORMAT_XVYU2101010 = $30335658; // [31:0] X:Cr:Y:Cb 2:10:10:10 little endian
  WL_SHM_FORMAT_XVYU12_16161616 = $36335658; // [63:0] X:0:Cr:0:Y:0:Cb:0 12:4:12:4:12:4:12:4 little endian
  WL_SHM_FORMAT_XVYU16161616 = $38345658; // [63:0] X:Cr:Y:Cb 16:16:16:16 little endian
  WL_SHM_FORMAT_Y0L0 = $304c3059; // [63:0]   A3:A2:Y3:0:Cr0:0:Y2:0:A1:A0:Y1:0:Cb0:0:Y0:0  1:1:8:2:8:2:8:2:1:1:8:2:8:2:8:2 little endian
  WL_SHM_FORMAT_X0L0 = $304c3058; // [63:0]   X3:X2:Y3:0:Cr0:0:Y2:0:X1:X0:Y1:0:Cb0:0:Y0:0  1:1:8:2:8:2:8:2:1:1:8:2:8:2:8:2 little endian
  WL_SHM_FORMAT_Y0L2 = $324c3059; // [63:0]   A3:A2:Y3:Cr0:Y2:A1:A0:Y1:Cb0:Y0  1:1:10:10:10:1:1:10:10:10 little endian
  WL_SHM_FORMAT_X0L2 = $324c3058; // [63:0]   X3:X2:Y3:Cr0:Y2:X1:X0:Y1:Cb0:Y0  1:1:10:10:10:1:1:10:10:10 little endian
  WL_SHM_FORMAT_YUV420_8BIT = $38305559;
  WL_SHM_FORMAT_YUV420_10BIT = $30315559;
  WL_SHM_FORMAT_XRGB8888_A8 = $38415258;
  WL_SHM_FORMAT_XBGR8888_A8 = $38414258;
  WL_SHM_FORMAT_RGBX8888_A8 = $38415852;
  WL_SHM_FORMAT_BGRX8888_A8 = $38415842;
  WL_SHM_FORMAT_RGB888_A8 = $38413852;
  WL_SHM_FORMAT_BGR888_A8 = $38413842;
  WL_SHM_FORMAT_RGB565_A8 = $38413552;
  WL_SHM_FORMAT_BGR565_A8 = $38413542;
  WL_SHM_FORMAT_NV24 = $3432564e; // non-subsampled Cr:Cb plane
  WL_SHM_FORMAT_NV42 = $3234564e; // non-subsampled Cb:Cr plane
  WL_SHM_FORMAT_P210 = $30313250; // 2x1 subsampled Cr:Cb plane, 10 bit per channel
  WL_SHM_FORMAT_P010 = $30313050; // 2x2 subsampled Cr:Cb plane 10 bits per channel
  WL_SHM_FORMAT_P012 = $32313050; // 2x2 subsampled Cr:Cb plane 12 bits per channel
  WL_SHM_FORMAT_P016 = $36313050; // 2x2 subsampled Cr:Cb plane 16 bits per channel
  WL_SHM_FORMAT_AXBXGXRX106106106106 = $30314241; // [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian
  WL_SHM_FORMAT_NV15 = $3531564e; // 2x2 subsampled Cr:Cb plane
  WL_SHM_FORMAT_Q410 = $30313451;
  WL_SHM_FORMAT_Q401 = $31303451;
  WL_SHM_FORMAT_XRGB16161616 = $38345258; // [63:0] x:R:G:B 16:16:16:16 little endian
  WL_SHM_FORMAT_XBGR16161616 = $38344258; // [63:0] x:B:G:R 16:16:16:16 little endian
  WL_SHM_FORMAT_ARGB16161616 = $38345241; // [63:0] A:R:G:B 16:16:16:16 little endian
  WL_SHM_FORMAT_ABGR16161616 = $38344241; // [63:0] A:B:G:R 16:16:16:16 little endian

type
  Pwl_shm_listener = ^Twl_shm_listener;
  Twl_shm_listener = record
    format : procedure(data: Pointer; AWlShm: Pwl_shm; AFormat: DWord); cdecl;
  end;

  Pwl_buffer_listener = ^Twl_buffer_listener;
  Twl_buffer_listener = record
    release : procedure(data: Pointer; AWlBuffer: Pwl_buffer); cdecl;
  end;

const
  WL_DATA_OFFER_ERROR_INVALID_FINISH = 0; // finish request was called untimely
  WL_DATA_OFFER_ERROR_INVALID_ACTION_MASK = 1; // action mask contains invalid values
  WL_DATA_OFFER_ERROR_INVALID_ACTION = 2; // action argument has an invalid value
  WL_DATA_OFFER_ERROR_INVALID_OFFER = 3; // offer doesn't accept this request

type
  Pwl_data_offer_listener = ^Twl_data_offer_listener;
  Twl_data_offer_listener = record
    offer : procedure(data: Pointer; AWlDataOffer: Pwl_data_offer; AMimeType: Pchar); cdecl;
    source_actions : procedure(data: Pointer; AWlDataOffer: Pwl_data_offer; ASourceActions: DWord); cdecl;
    action : procedure(data: Pointer; AWlDataOffer: Pwl_data_offer; ADndAction: DWord); cdecl;
  end;

const
  WL_DATA_SOURCE_ERROR_INVALID_ACTION_MASK = 0; // action mask contains invalid values
  WL_DATA_SOURCE_ERROR_INVALID_SOURCE = 1; // source doesn't accept this request

type
  Pwl_data_source_listener = ^Twl_data_source_listener;
  Twl_data_source_listener = record
    target : procedure(data: Pointer; AWlDataSource: Pwl_data_source; AMimeType: Pchar); cdecl;
    send : procedure(data: Pointer; AWlDataSource: Pwl_data_source; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
    cancelled : procedure(data: Pointer; AWlDataSource: Pwl_data_source); cdecl;
    dnd_drop_performed : procedure(data: Pointer; AWlDataSource: Pwl_data_source); cdecl;
    dnd_finished : procedure(data: Pointer; AWlDataSource: Pwl_data_source); cdecl;
    action : procedure(data: Pointer; AWlDataSource: Pwl_data_source; ADndAction: DWord); cdecl;
  end;

const
  WL_DATA_DEVICE_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pwl_data_device_listener = ^Twl_data_device_listener;
  Twl_data_device_listener = record
    data_offer : procedure(data: Pointer; AWlDataDevice: Pwl_data_device; AId: Pwl_data_offer); cdecl;
    enter : procedure(data: Pointer; AWlDataDevice: Pwl_data_device; ASerial: DWord; ASurface: Pwl_surface; AX: Longint{24.8}; AY: Longint{24.8}; AId: Pwl_data_offer); cdecl;
    leave : procedure(data: Pointer; AWlDataDevice: Pwl_data_device); cdecl;
    motion : procedure(data: Pointer; AWlDataDevice: Pwl_data_device; ATime: DWord; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
    drop : procedure(data: Pointer; AWlDataDevice: Pwl_data_device); cdecl;
    selection : procedure(data: Pointer; AWlDataDevice: Pwl_data_device; AId: Pwl_data_offer); cdecl;
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
    ping : procedure(data: Pointer; AWlShellSurface: Pwl_shell_surface; ASerial: DWord); cdecl;
    configure : procedure(data: Pointer; AWlShellSurface: Pwl_shell_surface; AEdges: DWord; AWidth: LongInt; AHeight: LongInt); cdecl;
    popup_done : procedure(data: Pointer; AWlShellSurface: Pwl_shell_surface); cdecl;
  end;

const
  WL_SURFACE_ERROR_INVALID_SCALE = 0; // buffer scale value is invalid
  WL_SURFACE_ERROR_INVALID_TRANSFORM = 1; // buffer transform value is invalid
  WL_SURFACE_ERROR_INVALID_SIZE = 2; // buffer size is invalid
  WL_SURFACE_ERROR_INVALID_OFFSET = 3; // buffer offset is invalid

type
  Pwl_surface_listener = ^Twl_surface_listener;
  Twl_surface_listener = record
    enter : procedure(data: Pointer; AWlSurface: Pwl_surface; AOutput: Pwl_output); cdecl;
    leave : procedure(data: Pointer; AWlSurface: Pwl_surface; AOutput: Pwl_output); cdecl;
  end;

const
  WL_SEAT_CAPABILITY_POINTER = 1; // the seat has pointer devices
  WL_SEAT_CAPABILITY_KEYBOARD = 2; // the seat has one or more keyboards
  WL_SEAT_CAPABILITY_TOUCH = 4; // the seat has touch devices
  WL_SEAT_ERROR_MISSING_CAPABILITY = 0; // get_pointer, get_keyboard or get_touch called on seat without the matching capability

type
  Pwl_seat_listener = ^Twl_seat_listener;
  Twl_seat_listener = record
    capabilities : procedure(data: Pointer; AWlSeat: Pwl_seat; ACapabilities: DWord); cdecl;
    name : procedure(data: Pointer; AWlSeat: Pwl_seat; AName: Pchar); cdecl;
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
    enter : procedure(data: Pointer; AWlPointer: Pwl_pointer; ASerial: DWord; ASurface: Pwl_surface; ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8}); cdecl;
    leave : procedure(data: Pointer; AWlPointer: Pwl_pointer; ASerial: DWord; ASurface: Pwl_surface); cdecl;
    motion : procedure(data: Pointer; AWlPointer: Pwl_pointer; ATime: DWord; ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8}); cdecl;
    button : procedure(data: Pointer; AWlPointer: Pwl_pointer; ASerial: DWord; ATime: DWord; AButton: DWord; AState: DWord); cdecl;
    axis : procedure(data: Pointer; AWlPointer: Pwl_pointer; ATime: DWord; AAxis: DWord; AValue: Longint{24.8}); cdecl;
    frame : procedure(data: Pointer; AWlPointer: Pwl_pointer); cdecl;
    axis_source : procedure(data: Pointer; AWlPointer: Pwl_pointer; AAxisSource: DWord); cdecl;
    axis_stop : procedure(data: Pointer; AWlPointer: Pwl_pointer; ATime: DWord; AAxis: DWord); cdecl;
    axis_discrete : procedure(data: Pointer; AWlPointer: Pwl_pointer; AAxis: DWord; ADiscrete: LongInt); cdecl;
  end;

const
  WL_KEYBOARD_KEYMAP_FORMAT_NO_KEYMAP = 0; // no keymap; client must understand how to interpret the raw keycode
  WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1 = 1; // libxkbcommon compatible; to determine the xkb keycode, clients must add 8 to the key event keycode
  WL_KEYBOARD_KEY_STATE_RELEASED = 0; // key is not pressed
  WL_KEYBOARD_KEY_STATE_PRESSED = 1; // key is pressed

type
  Pwl_keyboard_listener = ^Twl_keyboard_listener;
  Twl_keyboard_listener = record
    keymap : procedure(data: Pointer; AWlKeyboard: Pwl_keyboard; AFormat: DWord; AFd: LongInt{fd}; ASize: DWord); cdecl;
    enter : procedure(data: Pointer; AWlKeyboard: Pwl_keyboard; ASerial: DWord; ASurface: Pwl_surface; AKeys: Pwl_array); cdecl;
    leave : procedure(data: Pointer; AWlKeyboard: Pwl_keyboard; ASerial: DWord; ASurface: Pwl_surface); cdecl;
    key : procedure(data: Pointer; AWlKeyboard: Pwl_keyboard; ASerial: DWord; ATime: DWord; AKey: DWord; AState: DWord); cdecl;
    modifiers : procedure(data: Pointer; AWlKeyboard: Pwl_keyboard; ASerial: DWord; AModsDepressed: DWord; AModsLatched: DWord; AModsLocked: DWord; AGroup: DWord); cdecl;
    repeat_info : procedure(data: Pointer; AWlKeyboard: Pwl_keyboard; ARate: LongInt; ADelay: LongInt); cdecl;
  end;

  Pwl_touch_listener = ^Twl_touch_listener;
  Twl_touch_listener = record
    down : procedure(data: Pointer; AWlTouch: Pwl_touch; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AId: LongInt; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
    up : procedure(data: Pointer; AWlTouch: Pwl_touch; ASerial: DWord; ATime: DWord; AId: LongInt); cdecl;
    motion : procedure(data: Pointer; AWlTouch: Pwl_touch; ATime: DWord; AId: LongInt; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
    frame : procedure(data: Pointer; AWlTouch: Pwl_touch); cdecl;
    cancel : procedure(data: Pointer; AWlTouch: Pwl_touch); cdecl;
    shape : procedure(data: Pointer; AWlTouch: Pwl_touch; AId: LongInt; AMajor: Longint{24.8}; AMinor: Longint{24.8}); cdecl;
    orientation : procedure(data: Pointer; AWlTouch: Pwl_touch; AId: LongInt; AOrientation: Longint{24.8}); cdecl;
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
    geometry : procedure(data: Pointer; AWlOutput: Pwl_output; AX: LongInt; AY: LongInt; APhysicalWidth: LongInt; APhysicalHeight: LongInt; ASubpixel: LongInt; AMake: Pchar; AModel: Pchar; ATransform: LongInt); cdecl;
    mode : procedure(data: Pointer; AWlOutput: Pwl_output; AFlags: DWord; AWidth: LongInt; AHeight: LongInt; ARefresh: LongInt); cdecl;
    done : procedure(data: Pointer; AWlOutput: Pwl_output); cdecl;
    scale : procedure(data: Pointer; AWlOutput: Pwl_output; AFactor: LongInt); cdecl;
    name : procedure(data: Pointer; AWlOutput: Pwl_output; AName: Pchar); cdecl;
    description : procedure(data: Pointer; AWlOutput: Pwl_output; ADescription: Pchar); cdecl;
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



  TWlDisplay = class;
  TWlRegistry = class;
  TWlCallback = class;
  TWlCompositor = class;
  TWlShmPool = class;
  TWlShm = class;
  TWlBuffer = class;
  TWlDataOffer = class;
  TWlDataSource = class;
  TWlDataDevice = class;
  TWlDataDeviceManager = class;
  TWlShell = class;
  TWlShellSurface = class;
  TWlSurface = class;
  TWlSeat = class;
  TWlPointer = class;
  TWlKeyboard = class;
  TWlTouch = class;
  TWlOutput = class;
  TWlRegion = class;
  TWlSubcompositor = class;
  TWlSubsurface = class;


  IWlDisplayListener = interface
  ['IWlDisplayListener']
    procedure wl_display_error(AWlDisplay: TWlDisplay; AObjectId: Pointer; ACode: DWord; AMessage: String);
    procedure wl_display_delete_id(AWlDisplay: TWlDisplay; AId: DWord);
  end;

  IWlRegistryListener = interface
  ['IWlRegistryListener']
    procedure wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord; AInterface: String; AVersion: DWord);
    procedure wl_registry_global_remove(AWlRegistry: TWlRegistry; AName: DWord);
  end;

  IWlCallbackListener = interface
  ['IWlCallbackListener']
    procedure wl_callback_done(AWlCallback: TWlCallback; ACallbackData: DWord);
  end;

  IWlCompositorListener = interface
  ['IWlCompositorListener']
  end;

  IWlShmPoolListener = interface
  ['IWlShmPoolListener']
  end;

  IWlShmListener = interface
  ['IWlShmListener']
    procedure wl_shm_format(AWlShm: TWlShm; AFormat: DWord);
  end;

  IWlBufferListener = interface
  ['IWlBufferListener']
    procedure wl_buffer_release(AWlBuffer: TWlBuffer);
  end;

  IWlDataOfferListener = interface
  ['IWlDataOfferListener']
    procedure wl_data_offer_offer(AWlDataOffer: TWlDataOffer; AMimeType: String);
    procedure wl_data_offer_source_actions(AWlDataOffer: TWlDataOffer; ASourceActions: DWord);
    procedure wl_data_offer_action(AWlDataOffer: TWlDataOffer; ADndAction: DWord);
  end;

  IWlDataSourceListener = interface
  ['IWlDataSourceListener']
    procedure wl_data_source_target(AWlDataSource: TWlDataSource; AMimeType: String);
    procedure wl_data_source_send(AWlDataSource: TWlDataSource; AMimeType: String; AFd: LongInt{fd});
    procedure wl_data_source_cancelled(AWlDataSource: TWlDataSource);
    procedure wl_data_source_dnd_drop_performed(AWlDataSource: TWlDataSource);
    procedure wl_data_source_dnd_finished(AWlDataSource: TWlDataSource);
    procedure wl_data_source_action(AWlDataSource: TWlDataSource; ADndAction: DWord);
  end;

  IWlDataDeviceListener = interface
  ['IWlDataDeviceListener']
    procedure wl_data_device_data_offer(AWlDataDevice: TWlDataDevice; AId: TWlDataOffer);
    procedure wl_data_device_enter(AWlDataDevice: TWlDataDevice; ASerial: DWord; ASurface: TWlSurface; AX: Longint{24.8}; AY: Longint{24.8}; AId: TWlDataOffer);
    procedure wl_data_device_leave(AWlDataDevice: TWlDataDevice);
    procedure wl_data_device_motion(AWlDataDevice: TWlDataDevice; ATime: DWord; AX: Longint{24.8}; AY: Longint{24.8});
    procedure wl_data_device_drop(AWlDataDevice: TWlDataDevice);
    procedure wl_data_device_selection(AWlDataDevice: TWlDataDevice; AId: TWlDataOffer);
  end;

  IWlDataDeviceManagerListener = interface
  ['IWlDataDeviceManagerListener']
  end;

  IWlShellListener = interface
  ['IWlShellListener']
  end;

  IWlShellSurfaceListener = interface
  ['IWlShellSurfaceListener']
    procedure wl_shell_surface_ping(AWlShellSurface: TWlShellSurface; ASerial: DWord);
    procedure wl_shell_surface_configure(AWlShellSurface: TWlShellSurface; AEdges: DWord; AWidth: LongInt; AHeight: LongInt);
    procedure wl_shell_surface_popup_done(AWlShellSurface: TWlShellSurface);
  end;

  IWlSurfaceListener = interface
  ['IWlSurfaceListener']
    procedure wl_surface_enter(AWlSurface: TWlSurface; AOutput: TWlOutput);
    procedure wl_surface_leave(AWlSurface: TWlSurface; AOutput: TWlOutput);
  end;

  IWlSeatListener = interface
  ['IWlSeatListener']
    procedure wl_seat_capabilities(AWlSeat: TWlSeat; ACapabilities: DWord);
    procedure wl_seat_name(AWlSeat: TWlSeat; AName: String);
  end;

  IWlPointerListener = interface
  ['IWlPointerListener']
    procedure wl_pointer_enter(AWlPointer: TWlPointer; ASerial: DWord; ASurface: TWlSurface; ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8});
    procedure wl_pointer_leave(AWlPointer: TWlPointer; ASerial: DWord; ASurface: TWlSurface);
    procedure wl_pointer_motion(AWlPointer: TWlPointer; ATime: DWord; ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8});
    procedure wl_pointer_button(AWlPointer: TWlPointer; ASerial: DWord; ATime: DWord; AButton: DWord; AState: DWord);
    procedure wl_pointer_axis(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord; AValue: Longint{24.8});
    procedure wl_pointer_frame(AWlPointer: TWlPointer);
    procedure wl_pointer_axis_source(AWlPointer: TWlPointer; AAxisSource: DWord);
    procedure wl_pointer_axis_stop(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord);
    procedure wl_pointer_axis_discrete(AWlPointer: TWlPointer; AAxis: DWord; ADiscrete: LongInt);
  end;

  IWlKeyboardListener = interface
  ['IWlKeyboardListener']
    procedure wl_keyboard_keymap(AWlKeyboard: TWlKeyboard; AFormat: DWord; AFd: LongInt{fd}; ASize: DWord);
    procedure wl_keyboard_enter(AWlKeyboard: TWlKeyboard; ASerial: DWord; ASurface: TWlSurface; AKeys: Pwl_array);
    procedure wl_keyboard_leave(AWlKeyboard: TWlKeyboard; ASerial: DWord; ASurface: TWlSurface);
    procedure wl_keyboard_key(AWlKeyboard: TWlKeyboard; ASerial: DWord; ATime: DWord; AKey: DWord; AState: DWord);
    procedure wl_keyboard_modifiers(AWlKeyboard: TWlKeyboard; ASerial: DWord; AModsDepressed: DWord; AModsLatched: DWord; AModsLocked: DWord; AGroup: DWord);
    procedure wl_keyboard_repeat_info(AWlKeyboard: TWlKeyboard; ARate: LongInt; ADelay: LongInt);
  end;

  IWlTouchListener = interface
  ['IWlTouchListener']
    procedure wl_touch_down(AWlTouch: TWlTouch; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AId: LongInt; AX: Longint{24.8}; AY: Longint{24.8});
    procedure wl_touch_up(AWlTouch: TWlTouch; ASerial: DWord; ATime: DWord; AId: LongInt);
    procedure wl_touch_motion(AWlTouch: TWlTouch; ATime: DWord; AId: LongInt; AX: Longint{24.8}; AY: Longint{24.8});
    procedure wl_touch_frame(AWlTouch: TWlTouch);
    procedure wl_touch_cancel(AWlTouch: TWlTouch);
    procedure wl_touch_shape(AWlTouch: TWlTouch; AId: LongInt; AMajor: Longint{24.8}; AMinor: Longint{24.8});
    procedure wl_touch_orientation(AWlTouch: TWlTouch; AId: LongInt; AOrientation: Longint{24.8});
  end;

  IWlOutputListener = interface
  ['IWlOutputListener']
    procedure wl_output_geometry(AWlOutput: TWlOutput; AX: LongInt; AY: LongInt; APhysicalWidth: LongInt; APhysicalHeight: LongInt; ASubpixel: LongInt; AMake: String; AModel: String; ATransform: LongInt);
    procedure wl_output_mode(AWlOutput: TWlOutput; AFlags: DWord; AWidth: LongInt; AHeight: LongInt; ARefresh: LongInt);
    procedure wl_output_done(AWlOutput: TWlOutput);
    procedure wl_output_scale(AWlOutput: TWlOutput; AFactor: LongInt);
    procedure wl_output_name(AWlOutput: TWlOutput; AName: String);
    procedure wl_output_description(AWlOutput: TWlOutput; ADescription: String);
  end;

  IWlRegionListener = interface
  ['IWlRegionListener']
  end;

  IWlSubcompositorListener = interface
  ['IWlSubcompositorListener']
  end;

  IWlSubsurfaceListener = interface
  ['IWlSubsurfaceListener']
  end;




  TWlDisplay = class(TWlDisplayBase)
  private
    const _SYNC = 0;
    const _GET_REGISTRY = 1;
  public
    function Sync(AProxyClass: TWLProxyObjectClass = nil {TWlCallback}): TWlCallback;
    function GetRegistry(AProxyClass: TWLProxyObjectClass = nil {TWlRegistry}): TWlRegistry;
    function AddListener(AIntf: IWlDisplayListener): LongInt;
  end;

  TWlRegistry = class(TWLProxyObject)
  private
    const _BIND = 0;
  public
    function Bind(AName: DWord; AInterface: Pwl_interface; AVersion: LongInt): Pwl_proxy;
    function AddListener(AIntf: IWlRegistryListener): LongInt;
  end;

  TWlCallback = class(TWLProxyObject)
    function AddListener(AIntf: IWlCallbackListener): LongInt;
  end;

  TWlCompositor = class(TWLProxyObject)
  private
    const _CREATE_SURFACE = 0;
    const _CREATE_REGION = 1;
  public
    function CreateSurface(AProxyClass: TWLProxyObjectClass = nil {TWlSurface}): TWlSurface;
    function CreateRegion(AProxyClass: TWLProxyObjectClass = nil {TWlRegion}): TWlRegion;
    function AddListener(AIntf: IWlCompositorListener): LongInt;
  end;

  TWlShmPool = class(TWlShmPoolBase)
  private
    const _CREATE_BUFFER = 0;
    const _DESTROY = 1;
    const _RESIZE = 2;
  public
    function CreateBuffer(AOffset: LongInt; AWidth: LongInt; AHeight: LongInt; AStride: LongInt; AFormat: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer;
    destructor Destroy; override;
    procedure Resize(ASize: LongInt);
    function AddListener(AIntf: IWlShmPoolListener): LongInt;
  end;

  TWlShm = class(TWlShmBase)
  private
    const _CREATE_POOL = 0;
  public
    function CreatePool(AFd: LongInt{fd}; ASize: LongInt; AProxyClass: TWLProxyObjectClass = nil {TWlShmPool}): TWlShmPool;
    function AddListener(AIntf: IWlShmListener): LongInt;
  end;

  TWlBuffer = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWlBufferListener): LongInt;
  end;

  TWlDataOffer = class(TWLProxyObject)
  private
    const _ACCEPT = 0;
    const _RECEIVE = 1;
    const _DESTROY = 2;
    const _FINISH = 3;
    const _SET_ACTIONS = 4;
  public
    procedure Accept(ASerial: DWord; AMimeType: String);
    procedure Receive(AMimeType: String; AFd: LongInt{fd});
    destructor Destroy; override;
    procedure Finish;
    procedure SetActions(ADndActions: DWord; APreferredAction: DWord);
    function AddListener(AIntf: IWlDataOfferListener): LongInt;
  end;

  TWlDataSource = class(TWLProxyObject)
  private
    const _OFFER = 0;
    const _DESTROY = 1;
    const _SET_ACTIONS = 2;
  public
    procedure Offer(AMimeType: String);
    destructor Destroy; override;
    procedure SetActions(ADndActions: DWord);
    function AddListener(AIntf: IWlDataSourceListener): LongInt;
  end;

  TWlDataDevice = class(TWLProxyObject)
  private
    const _START_DRAG = 0;
    const _SET_SELECTION = 1;
    const _RELEASE = 2;
  public
    procedure StartDrag(ASource: TWlDataSource; AOrigin: TWlSurface; AIcon: TWlSurface; ASerial: DWord);
    procedure SetSelection(ASource: TWlDataSource; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWlDataDeviceListener): LongInt;
  end;

  TWlDataDeviceManager = class(TWLProxyObject)
  private
    const _CREATE_DATA_SOURCE = 0;
    const _GET_DATA_DEVICE = 1;
  public
    function CreateDataSource(AProxyClass: TWLProxyObjectClass = nil {TWlDataSource}): TWlDataSource;
    function GetDataDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWlDataDevice}): TWlDataDevice;
    function AddListener(AIntf: IWlDataDeviceManagerListener): LongInt;
  end;

  TWlShell = class(TWLProxyObject)
  private
    const _GET_SHELL_SURFACE = 0;
  public
    function GetShellSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWlShellSurface}): TWlShellSurface;
    function AddListener(AIntf: IWlShellListener): LongInt;
  end;

  TWlShellSurface = class(TWLProxyObject)
  private
    const _PONG = 0;
    const _MOVE = 1;
    const _RESIZE = 2;
    const _SET_TOPLEVEL = 3;
    const _SET_TRANSIENT = 4;
    const _SET_FULLSCREEN = 5;
    const _SET_POPUP = 6;
    const _SET_MAXIMIZED = 7;
    const _SET_TITLE = 8;
    const _SET_CLASS = 9;
  public
    procedure Pong(ASerial: DWord);
    procedure Move(ASeat: TWlSeat; ASerial: DWord);
    procedure Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
    procedure SetToplevel;
    procedure SetTransient(AParent: TWlSurface; AX: LongInt; AY: LongInt; AFlags: DWord);
    procedure SetFullscreen(AMethod: DWord; AFramerate: DWord; AOutput: TWlOutput);
    procedure SetPopup(ASeat: TWlSeat; ASerial: DWord; AParent: TWlSurface; AX: LongInt; AY: LongInt; AFlags: DWord);
    procedure SetMaximized(AOutput: TWlOutput);
    procedure SetTitle(ATitle: String);
    procedure SetClass(AClass: String);
    function AddListener(AIntf: IWlShellSurfaceListener): LongInt;
  end;

  TWlSurface = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _ATTACH = 1;
    const _DAMAGE = 2;
    const _FRAME = 3;
    const _SET_OPAQUE_REGION = 4;
    const _SET_INPUT_REGION = 5;
    const _COMMIT = 6;
    const _SET_BUFFER_TRANSFORM = 7;
    const _SET_BUFFER_SCALE = 8;
    const _DAMAGE_BUFFER = 9;
    const _OFFSET = 10;
  public
    destructor Destroy; override;
    procedure Attach(ABuffer: TWlBuffer; AX: LongInt; AY: LongInt);
    procedure Damage(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    function Frame(AProxyClass: TWLProxyObjectClass = nil {TWlCallback}): TWlCallback;
    procedure SetOpaqueRegion(ARegion: TWlRegion);
    procedure SetInputRegion(ARegion: TWlRegion);
    procedure Commit;
    procedure SetBufferTransform(ATransform: LongInt);
    procedure SetBufferScale(AScale: LongInt);
    procedure DamageBuffer(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure Offset(AX: LongInt; AY: LongInt);
    function AddListener(AIntf: IWlSurfaceListener): LongInt;
  end;

  TWlSeat = class(TWLProxyObject)
  private
    const _GET_POINTER = 0;
    const _GET_KEYBOARD = 1;
    const _GET_TOUCH = 2;
    const _RELEASE = 3;
  public
    function GetPointer(AProxyClass: TWLProxyObjectClass = nil {TWlPointer}): TWlPointer;
    function GetKeyboard(AProxyClass: TWLProxyObjectClass = nil {TWlKeyboard}): TWlKeyboard;
    function GetTouch(AProxyClass: TWLProxyObjectClass = nil {TWlTouch}): TWlTouch;
    destructor Destroy; override;
    function AddListener(AIntf: IWlSeatListener): LongInt;
  end;

  TWlPointer = class(TWLProxyObject)
  private
    const _SET_CURSOR = 0;
    const _RELEASE = 1;
  public
    procedure SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
    destructor Destroy; override;
    function AddListener(AIntf: IWlPointerListener): LongInt;
  end;

  TWlKeyboard = class(TWLProxyObject)
  private
    const _RELEASE = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWlKeyboardListener): LongInt;
  end;

  TWlTouch = class(TWLProxyObject)
  private
    const _RELEASE = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWlTouchListener): LongInt;
  end;

  TWlOutput = class(TWLProxyObject)
  private
    const _RELEASE = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWlOutputListener): LongInt;
  end;

  TWlRegion = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _ADD = 1;
    const _SUBTRACT = 2;
  public
    destructor Destroy; override;
    procedure Add(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure Subtract(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    function AddListener(AIntf: IWlRegionListener): LongInt;
  end;

  TWlSubcompositor = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_SUBSURFACE = 1;
  public
    destructor Destroy; override;
    function GetSubsurface(ASurface: TWlSurface; AParent: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWlSubsurface}): TWlSubsurface;
    function AddListener(AIntf: IWlSubcompositorListener): LongInt;
  end;

  TWlSubsurface = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_POSITION = 1;
    const _PLACE_ABOVE = 2;
    const _PLACE_BELOW = 3;
    const _SET_SYNC = 4;
    const _SET_DESYNC = 5;
  public
    destructor Destroy; override;
    procedure SetPosition(AX: LongInt; AY: LongInt);
    procedure PlaceAbove(ASibling: TWlSurface);
    procedure PlaceBelow(ASibling: TWlSurface);
    procedure SetSync;
    procedure SetDesync;
    function AddListener(AIntf: IWlSubsurfaceListener): LongInt;
  end;






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



function TWlDisplay.Sync(AProxyClass: TWLProxyObjectClass = nil {TWlCallback}): TWlCallback;
var
  callback: Pwl_proxy;
begin
  callback := wl_proxy_marshal_constructor(FProxy,
      _SYNC, @wl_callback_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlCallback;
  Result := TWlCallback(AProxyClass.Create(callback));
  if not AProxyClass.InheritsFrom(TWlCallback) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlCallback]);
end;

function TWlDisplay.GetRegistry(AProxyClass: TWLProxyObjectClass = nil {TWlRegistry}): TWlRegistry;
var
  registry: Pwl_proxy;
begin
  registry := wl_proxy_marshal_constructor(FProxy,
      _GET_REGISTRY, @wl_registry_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlRegistry;
  Result := TWlRegistry(AProxyClass.Create(registry));
  if not AProxyClass.InheritsFrom(TWlRegistry) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlRegistry]);
end;

function TWlDisplay.AddListener(AIntf: IWlDisplayListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_display_Listener, @FUserDataRec);
end;
function TWlRegistry.Bind(AName: DWord; AInterface: Pwl_interface; AVersion: LongInt): Pwl_proxy;
begin
  Result := wl_proxy_marshal_constructor_versioned(FProxy,
      _BIND, AInterface, AVersion, AName, AInterface^.name, AVersion, nil);
end;

function TWlRegistry.AddListener(AIntf: IWlRegistryListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_registry_Listener, @FUserDataRec);
end;
function TWlCallback.AddListener(AIntf: IWlCallbackListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_callback_Listener, @FUserDataRec);
end;
function TWlCompositor.CreateSurface(AProxyClass: TWLProxyObjectClass = nil {TWlSurface}): TWlSurface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_SURFACE, @wl_surface_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlSurface;
  Result := TWlSurface(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlSurface) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlSurface]);
end;

function TWlCompositor.CreateRegion(AProxyClass: TWLProxyObjectClass = nil {TWlRegion}): TWlRegion;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_REGION, @wl_region_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlRegion;
  Result := TWlRegion(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlRegion) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlRegion]);
end;

function TWlCompositor.AddListener(AIntf: IWlCompositorListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_compositor_Listener, @FUserDataRec);
end;
function TWlShmPool.CreateBuffer(AOffset: LongInt; AWidth: LongInt; AHeight: LongInt; AStride: LongInt; AFormat: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_BUFFER, @wl_buffer_interface, nil, AOffset, AWidth, AHeight, AStride, AFormat);
  if AProxyClass = nil then
    AProxyClass := TWlBuffer;
  Result := TWlBuffer(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlBuffer) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlBuffer]);
end;

destructor TWlShmPool.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWlShmPool.Resize(ASize: LongInt);
begin
  wl_proxy_marshal(FProxy, _RESIZE, ASize);
end;

function TWlShmPool.AddListener(AIntf: IWlShmPoolListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_shm_pool_Listener, @FUserDataRec);
end;
function TWlShm.CreatePool(AFd: LongInt{fd}; ASize: LongInt; AProxyClass: TWLProxyObjectClass = nil {TWlShmPool}): TWlShmPool;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_POOL, @wl_shm_pool_interface, nil, AFd, ASize);
  if AProxyClass = nil then
    AProxyClass := TWlShmPool;
  Result := TWlShmPool(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlShmPool) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlShmPool]);
end;

function TWlShm.AddListener(AIntf: IWlShmListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_shm_Listener, @FUserDataRec);
end;
destructor TWlBuffer.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWlBuffer.AddListener(AIntf: IWlBufferListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_buffer_Listener, @FUserDataRec);
end;
procedure TWlDataOffer.Accept(ASerial: DWord; AMimeType: String);
begin
  wl_proxy_marshal(FProxy, _ACCEPT, ASerial, PChar(AMimeType));
end;

procedure TWlDataOffer.Receive(AMimeType: String; AFd: LongInt{fd});
begin
  wl_proxy_marshal(FProxy, _RECEIVE, PChar(AMimeType), AFd);
end;

destructor TWlDataOffer.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWlDataOffer.Finish;
begin
  wl_proxy_marshal(FProxy, _FINISH);
end;

procedure TWlDataOffer.SetActions(ADndActions: DWord; APreferredAction: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ACTIONS, ADndActions, APreferredAction);
end;

function TWlDataOffer.AddListener(AIntf: IWlDataOfferListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_data_offer_Listener, @FUserDataRec);
end;
procedure TWlDataSource.Offer(AMimeType: String);
begin
  wl_proxy_marshal(FProxy, _OFFER, PChar(AMimeType));
end;

destructor TWlDataSource.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWlDataSource.SetActions(ADndActions: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ACTIONS, ADndActions);
end;

function TWlDataSource.AddListener(AIntf: IWlDataSourceListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_data_source_Listener, @FUserDataRec);
end;
procedure TWlDataDevice.StartDrag(ASource: TWlDataSource; AOrigin: TWlSurface; AIcon: TWlSurface; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _START_DRAG, ASource.Proxy, AOrigin.Proxy, AIcon.Proxy, ASerial);
end;

procedure TWlDataDevice.SetSelection(ASource: TWlDataSource; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_SELECTION, ASource.Proxy, ASerial);
end;

destructor TWlDataDevice.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TWlDataDevice.AddListener(AIntf: IWlDataDeviceListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_data_device_Listener, @FUserDataRec);
end;
function TWlDataDeviceManager.CreateDataSource(AProxyClass: TWLProxyObjectClass = nil {TWlDataSource}): TWlDataSource;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_DATA_SOURCE, @wl_data_source_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlDataSource;
  Result := TWlDataSource(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlDataSource) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlDataSource]);
end;

function TWlDataDeviceManager.GetDataDevice(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWlDataDevice}): TWlDataDevice;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_DATA_DEVICE, @wl_data_device_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWlDataDevice;
  Result := TWlDataDevice(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlDataDevice) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlDataDevice]);
end;

function TWlDataDeviceManager.AddListener(AIntf: IWlDataDeviceManagerListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_data_device_manager_Listener, @FUserDataRec);
end;
function TWlShell.GetShellSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWlShellSurface}): TWlShellSurface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SHELL_SURFACE, @wl_shell_surface_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWlShellSurface;
  Result := TWlShellSurface(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlShellSurface) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlShellSurface]);
end;

function TWlShell.AddListener(AIntf: IWlShellListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_shell_Listener, @FUserDataRec);
end;
procedure TWlShellSurface.Pong(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _PONG, ASerial);
end;

procedure TWlShellSurface.Move(ASeat: TWlSeat; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _MOVE, ASeat.Proxy, ASerial);
end;

procedure TWlShellSurface.Resize(ASeat: TWlSeat; ASerial: DWord; AEdges: DWord);
begin
  wl_proxy_marshal(FProxy, _RESIZE, ASeat.Proxy, ASerial, AEdges);
end;

procedure TWlShellSurface.SetToplevel;
begin
  wl_proxy_marshal(FProxy, _SET_TOPLEVEL);
end;

procedure TWlShellSurface.SetTransient(AParent: TWlSurface; AX: LongInt; AY: LongInt; AFlags: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TRANSIENT, AParent.Proxy, AX, AY, AFlags);
end;

procedure TWlShellSurface.SetFullscreen(AMethod: DWord; AFramerate: DWord; AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _SET_FULLSCREEN, AMethod, AFramerate, AOutput.Proxy);
end;

procedure TWlShellSurface.SetPopup(ASeat: TWlSeat; ASerial: DWord; AParent: TWlSurface; AX: LongInt; AY: LongInt; AFlags: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_POPUP, ASeat.Proxy, ASerial, AParent.Proxy, AX, AY, AFlags);
end;

procedure TWlShellSurface.SetMaximized(AOutput: TWlOutput);
begin
  wl_proxy_marshal(FProxy, _SET_MAXIMIZED, AOutput.Proxy);
end;

procedure TWlShellSurface.SetTitle(ATitle: String);
begin
  wl_proxy_marshal(FProxy, _SET_TITLE, PChar(ATitle));
end;

procedure TWlShellSurface.SetClass(AClass: String);
begin
  wl_proxy_marshal(FProxy, _SET_CLASS, PChar(AClass));
end;

function TWlShellSurface.AddListener(AIntf: IWlShellSurfaceListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_shell_surface_Listener, @FUserDataRec);
end;
destructor TWlSurface.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWlSurface.Attach(ABuffer: TWlBuffer; AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _ATTACH, ABuffer.Proxy, AX, AY);
end;

procedure TWlSurface.Damage(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _DAMAGE, AX, AY, AWidth, AHeight);
end;

function TWlSurface.Frame(AProxyClass: TWLProxyObjectClass = nil {TWlCallback}): TWlCallback;
var
  callback: Pwl_proxy;
begin
  callback := wl_proxy_marshal_constructor(FProxy,
      _FRAME, @wl_callback_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlCallback;
  Result := TWlCallback(AProxyClass.Create(callback));
  if not AProxyClass.InheritsFrom(TWlCallback) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlCallback]);
end;

procedure TWlSurface.SetOpaqueRegion(ARegion: TWlRegion);
begin
  wl_proxy_marshal(FProxy, _SET_OPAQUE_REGION, ARegion.Proxy);
end;

procedure TWlSurface.SetInputRegion(ARegion: TWlRegion);
begin
  wl_proxy_marshal(FProxy, _SET_INPUT_REGION, ARegion.Proxy);
end;

procedure TWlSurface.Commit;
begin
  wl_proxy_marshal(FProxy, _COMMIT);
end;

procedure TWlSurface.SetBufferTransform(ATransform: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_BUFFER_TRANSFORM, ATransform);
end;

procedure TWlSurface.SetBufferScale(AScale: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_BUFFER_SCALE, AScale);
end;

procedure TWlSurface.DamageBuffer(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _DAMAGE_BUFFER, AX, AY, AWidth, AHeight);
end;

procedure TWlSurface.Offset(AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _OFFSET, AX, AY);
end;

function TWlSurface.AddListener(AIntf: IWlSurfaceListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_surface_Listener, @FUserDataRec);
end;
function TWlSeat.GetPointer(AProxyClass: TWLProxyObjectClass = nil {TWlPointer}): TWlPointer;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_POINTER, @wl_pointer_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlPointer;
  Result := TWlPointer(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlPointer) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlPointer]);
end;

function TWlSeat.GetKeyboard(AProxyClass: TWLProxyObjectClass = nil {TWlKeyboard}): TWlKeyboard;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_KEYBOARD, @wl_keyboard_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlKeyboard;
  Result := TWlKeyboard(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlKeyboard) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlKeyboard]);
end;

function TWlSeat.GetTouch(AProxyClass: TWLProxyObjectClass = nil {TWlTouch}): TWlTouch;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOUCH, @wl_touch_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWlTouch;
  Result := TWlTouch(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlTouch) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlTouch]);
end;

destructor TWlSeat.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TWlSeat.AddListener(AIntf: IWlSeatListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_seat_Listener, @FUserDataRec);
end;
procedure TWlPointer.SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR, ASerial, ASurface.Proxy, AHotspotX, AHotspotY);
end;

destructor TWlPointer.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TWlPointer.AddListener(AIntf: IWlPointerListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_pointer_Listener, @FUserDataRec);
end;
destructor TWlKeyboard.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TWlKeyboard.AddListener(AIntf: IWlKeyboardListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_keyboard_Listener, @FUserDataRec);
end;
destructor TWlTouch.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TWlTouch.AddListener(AIntf: IWlTouchListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_touch_Listener, @FUserDataRec);
end;
destructor TWlOutput.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TWlOutput.AddListener(AIntf: IWlOutputListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_output_Listener, @FUserDataRec);
end;
destructor TWlRegion.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWlRegion.Add(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _ADD, AX, AY, AWidth, AHeight);
end;

procedure TWlRegion.Subtract(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SUBTRACT, AX, AY, AWidth, AHeight);
end;

function TWlRegion.AddListener(AIntf: IWlRegionListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_region_Listener, @FUserDataRec);
end;
destructor TWlSubcompositor.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWlSubcompositor.GetSubsurface(ASurface: TWlSurface; AParent: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWlSubsurface}): TWlSubsurface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SUBSURFACE, @wl_subsurface_interface, nil, ASurface.Proxy, AParent.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWlSubsurface;
  Result := TWlSubsurface(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWlSubsurface) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlSubsurface]);
end;

function TWlSubcompositor.AddListener(AIntf: IWlSubcompositorListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_subcompositor_Listener, @FUserDataRec);
end;
destructor TWlSubsurface.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWlSubsurface.SetPosition(AX: LongInt; AY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_POSITION, AX, AY);
end;

procedure TWlSubsurface.PlaceAbove(ASibling: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _PLACE_ABOVE, ASibling.Proxy);
end;

procedure TWlSubsurface.PlaceBelow(ASibling: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _PLACE_BELOW, ASibling.Proxy);
end;

procedure TWlSubsurface.SetSync;
begin
  wl_proxy_marshal(FProxy, _SET_SYNC);
end;

procedure TWlSubsurface.SetDesync;
begin
  wl_proxy_marshal(FProxy, _SET_DESYNC);
end;

function TWlSubsurface.AddListener(AIntf: IWlSubsurfaceListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wl_subsurface_Listener, @FUserDataRec);
end;




procedure wl_display_error_Intf(AData: PWLUserData; Awl_display: Pwl_display; AObjectId: Pointer; ACode: DWord; AMessage: Pchar); cdecl;
var
  AIntf: IWlDisplayListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDisplayListener(AData^.ListenerUserData);
  AIntf.wl_display_error(TWlDisplay(AData^.PascalObject),  Pointer(TWLProxyObject.WLToObj(AObjectId)), ACode, AMessage);
end;

procedure wl_display_delete_id_Intf(AData: PWLUserData; Awl_display: Pwl_display; AId: DWord); cdecl;
var
  AIntf: IWlDisplayListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDisplayListener(AData^.ListenerUserData);
  AIntf.wl_display_delete_id(TWlDisplay(AData^.PascalObject), AId);
end;

procedure wl_registry_global_Intf(AData: PWLUserData; Awl_registry: Pwl_registry; AName: DWord; AInterface: Pchar; AVersion: DWord); cdecl;
var
  AIntf: IWlRegistryListener;
begin
  if AData = nil then Exit;
  AIntf := IWlRegistryListener(AData^.ListenerUserData);
  AIntf.wl_registry_global(TWlRegistry(AData^.PascalObject), AName, AInterface, AVersion);
end;

procedure wl_registry_global_remove_Intf(AData: PWLUserData; Awl_registry: Pwl_registry; AName: DWord); cdecl;
var
  AIntf: IWlRegistryListener;
begin
  if AData = nil then Exit;
  AIntf := IWlRegistryListener(AData^.ListenerUserData);
  AIntf.wl_registry_global_remove(TWlRegistry(AData^.PascalObject), AName);
end;

procedure wl_callback_done_Intf(AData: PWLUserData; Awl_callback: Pwl_callback; ACallbackData: DWord); cdecl;
var
  AIntf: IWlCallbackListener;
begin
  if AData = nil then Exit;
  AIntf := IWlCallbackListener(AData^.ListenerUserData);
  AIntf.wl_callback_done(TWlCallback(AData^.PascalObject), ACallbackData);
end;

procedure wl_shm_format_Intf(AData: PWLUserData; Awl_shm: Pwl_shm; AFormat: DWord); cdecl;
var
  AIntf: IWlShmListener;
begin
  if AData = nil then Exit;
  AIntf := IWlShmListener(AData^.ListenerUserData);
  AIntf.wl_shm_format(TWlShm(AData^.PascalObject), AFormat);
end;

procedure wl_buffer_release_Intf(AData: PWLUserData; Awl_buffer: Pwl_buffer); cdecl;
var
  AIntf: IWlBufferListener;
begin
  if AData = nil then Exit;
  AIntf := IWlBufferListener(AData^.ListenerUserData);
  AIntf.wl_buffer_release(TWlBuffer(AData^.PascalObject));
end;

procedure wl_data_offer_offer_Intf(AData: PWLUserData; Awl_data_offer: Pwl_data_offer; AMimeType: Pchar); cdecl;
var
  AIntf: IWlDataOfferListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataOfferListener(AData^.ListenerUserData);
  AIntf.wl_data_offer_offer(TWlDataOffer(AData^.PascalObject), AMimeType);
end;

procedure wl_data_offer_source_actions_Intf(AData: PWLUserData; Awl_data_offer: Pwl_data_offer; ASourceActions: DWord); cdecl;
var
  AIntf: IWlDataOfferListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataOfferListener(AData^.ListenerUserData);
  AIntf.wl_data_offer_source_actions(TWlDataOffer(AData^.PascalObject), ASourceActions);
end;

procedure wl_data_offer_action_Intf(AData: PWLUserData; Awl_data_offer: Pwl_data_offer; ADndAction: DWord); cdecl;
var
  AIntf: IWlDataOfferListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataOfferListener(AData^.ListenerUserData);
  AIntf.wl_data_offer_action(TWlDataOffer(AData^.PascalObject), ADndAction);
end;

procedure wl_data_source_target_Intf(AData: PWLUserData; Awl_data_source: Pwl_data_source; AMimeType: Pchar); cdecl;
var
  AIntf: IWlDataSourceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataSourceListener(AData^.ListenerUserData);
  AIntf.wl_data_source_target(TWlDataSource(AData^.PascalObject), AMimeType);
end;

procedure wl_data_source_send_Intf(AData: PWLUserData; Awl_data_source: Pwl_data_source; AMimeType: Pchar; AFd: LongInt{fd}); cdecl;
var
  AIntf: IWlDataSourceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataSourceListener(AData^.ListenerUserData);
  AIntf.wl_data_source_send(TWlDataSource(AData^.PascalObject), AMimeType, AFd);
end;

procedure wl_data_source_cancelled_Intf(AData: PWLUserData; Awl_data_source: Pwl_data_source); cdecl;
var
  AIntf: IWlDataSourceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataSourceListener(AData^.ListenerUserData);
  AIntf.wl_data_source_cancelled(TWlDataSource(AData^.PascalObject));
end;

procedure wl_data_source_dnd_drop_performed_Intf(AData: PWLUserData; Awl_data_source: Pwl_data_source); cdecl;
var
  AIntf: IWlDataSourceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataSourceListener(AData^.ListenerUserData);
  AIntf.wl_data_source_dnd_drop_performed(TWlDataSource(AData^.PascalObject));
end;

procedure wl_data_source_dnd_finished_Intf(AData: PWLUserData; Awl_data_source: Pwl_data_source); cdecl;
var
  AIntf: IWlDataSourceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataSourceListener(AData^.ListenerUserData);
  AIntf.wl_data_source_dnd_finished(TWlDataSource(AData^.PascalObject));
end;

procedure wl_data_source_action_Intf(AData: PWLUserData; Awl_data_source: Pwl_data_source; ADndAction: DWord); cdecl;
var
  AIntf: IWlDataSourceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataSourceListener(AData^.ListenerUserData);
  AIntf.wl_data_source_action(TWlDataSource(AData^.PascalObject), ADndAction);
end;

procedure wl_data_device_data_offer_Intf(AData: PWLUserData; Awl_data_device: Pwl_data_device; AId: Pwl_data_offer); cdecl;
var
  AIntf: IWlDataDeviceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataDeviceListener(AData^.ListenerUserData);
  AIntf.wl_data_device_data_offer(TWlDataDevice(AData^.PascalObject),  TWlDataOffer.Create(AId));
end;

procedure wl_data_device_enter_Intf(AData: PWLUserData; Awl_data_device: Pwl_data_device; ASerial: DWord; ASurface: Pwl_surface; AX: Longint{24.8}; AY: Longint{24.8}; AId: Pwl_data_offer); cdecl;
var
  AIntf: IWlDataDeviceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataDeviceListener(AData^.ListenerUserData);
  AIntf.wl_data_device_enter(TWlDataDevice(AData^.PascalObject), ASerial,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AX, AY,  TWlDataOffer(TWLProxyObject.WLToObj(AId)));
end;

procedure wl_data_device_leave_Intf(AData: PWLUserData; Awl_data_device: Pwl_data_device); cdecl;
var
  AIntf: IWlDataDeviceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataDeviceListener(AData^.ListenerUserData);
  AIntf.wl_data_device_leave(TWlDataDevice(AData^.PascalObject));
end;

procedure wl_data_device_motion_Intf(AData: PWLUserData; Awl_data_device: Pwl_data_device; ATime: DWord; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
var
  AIntf: IWlDataDeviceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataDeviceListener(AData^.ListenerUserData);
  AIntf.wl_data_device_motion(TWlDataDevice(AData^.PascalObject), ATime, AX, AY);
end;

procedure wl_data_device_drop_Intf(AData: PWLUserData; Awl_data_device: Pwl_data_device); cdecl;
var
  AIntf: IWlDataDeviceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataDeviceListener(AData^.ListenerUserData);
  AIntf.wl_data_device_drop(TWlDataDevice(AData^.PascalObject));
end;

procedure wl_data_device_selection_Intf(AData: PWLUserData; Awl_data_device: Pwl_data_device; AId: Pwl_data_offer); cdecl;
var
  AIntf: IWlDataDeviceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlDataDeviceListener(AData^.ListenerUserData);
  AIntf.wl_data_device_selection(TWlDataDevice(AData^.PascalObject),  TWlDataOffer(TWLProxyObject.WLToObj(AId)));
end;

procedure wl_shell_surface_ping_Intf(AData: PWLUserData; Awl_shell_surface: Pwl_shell_surface; ASerial: DWord); cdecl;
var
  AIntf: IWlShellSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlShellSurfaceListener(AData^.ListenerUserData);
  AIntf.wl_shell_surface_ping(TWlShellSurface(AData^.PascalObject), ASerial);
end;

procedure wl_shell_surface_configure_Intf(AData: PWLUserData; Awl_shell_surface: Pwl_shell_surface; AEdges: DWord; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IWlShellSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlShellSurfaceListener(AData^.ListenerUserData);
  AIntf.wl_shell_surface_configure(TWlShellSurface(AData^.PascalObject), AEdges, AWidth, AHeight);
end;

procedure wl_shell_surface_popup_done_Intf(AData: PWLUserData; Awl_shell_surface: Pwl_shell_surface); cdecl;
var
  AIntf: IWlShellSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlShellSurfaceListener(AData^.ListenerUserData);
  AIntf.wl_shell_surface_popup_done(TWlShellSurface(AData^.PascalObject));
end;

procedure wl_surface_enter_Intf(AData: PWLUserData; Awl_surface: Pwl_surface; AOutput: Pwl_output); cdecl;
var
  AIntf: IWlSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlSurfaceListener(AData^.ListenerUserData);
  AIntf.wl_surface_enter(TWlSurface(AData^.PascalObject),  TWlOutput(TWLProxyObject.WLToObj(AOutput)));
end;

procedure wl_surface_leave_Intf(AData: PWLUserData; Awl_surface: Pwl_surface; AOutput: Pwl_output); cdecl;
var
  AIntf: IWlSurfaceListener;
begin
  if AData = nil then Exit;
  AIntf := IWlSurfaceListener(AData^.ListenerUserData);
  AIntf.wl_surface_leave(TWlSurface(AData^.PascalObject),  TWlOutput(TWLProxyObject.WLToObj(AOutput)));
end;

procedure wl_seat_capabilities_Intf(AData: PWLUserData; Awl_seat: Pwl_seat; ACapabilities: DWord); cdecl;
var
  AIntf: IWlSeatListener;
begin
  if AData = nil then Exit;
  AIntf := IWlSeatListener(AData^.ListenerUserData);
  AIntf.wl_seat_capabilities(TWlSeat(AData^.PascalObject), ACapabilities);
end;

procedure wl_seat_name_Intf(AData: PWLUserData; Awl_seat: Pwl_seat; AName: Pchar); cdecl;
var
  AIntf: IWlSeatListener;
begin
  if AData = nil then Exit;
  AIntf := IWlSeatListener(AData^.ListenerUserData);
  AIntf.wl_seat_name(TWlSeat(AData^.PascalObject), AName);
end;

procedure wl_pointer_enter_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; ASerial: DWord; ASurface: Pwl_surface; ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8}); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_enter(TWlPointer(AData^.PascalObject), ASerial,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), ASurfaceX, ASurfaceY);
end;

procedure wl_pointer_leave_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; ASerial: DWord; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_leave(TWlPointer(AData^.PascalObject), ASerial,  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wl_pointer_motion_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; ATime: DWord; ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8}); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_motion(TWlPointer(AData^.PascalObject), ATime, ASurfaceX, ASurfaceY);
end;

procedure wl_pointer_button_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; ASerial: DWord; ATime: DWord; AButton: DWord; AState: DWord); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_button(TWlPointer(AData^.PascalObject), ASerial, ATime, AButton, AState);
end;

procedure wl_pointer_axis_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; ATime: DWord; AAxis: DWord; AValue: Longint{24.8}); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_axis(TWlPointer(AData^.PascalObject), ATime, AAxis, AValue);
end;

procedure wl_pointer_frame_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_frame(TWlPointer(AData^.PascalObject));
end;

procedure wl_pointer_axis_source_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; AAxisSource: DWord); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_axis_source(TWlPointer(AData^.PascalObject), AAxisSource);
end;

procedure wl_pointer_axis_stop_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; ATime: DWord; AAxis: DWord); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_axis_stop(TWlPointer(AData^.PascalObject), ATime, AAxis);
end;

procedure wl_pointer_axis_discrete_Intf(AData: PWLUserData; Awl_pointer: Pwl_pointer; AAxis: DWord; ADiscrete: LongInt); cdecl;
var
  AIntf: IWlPointerListener;
begin
  if AData = nil then Exit;
  AIntf := IWlPointerListener(AData^.ListenerUserData);
  AIntf.wl_pointer_axis_discrete(TWlPointer(AData^.PascalObject), AAxis, ADiscrete);
end;

procedure wl_keyboard_keymap_Intf(AData: PWLUserData; Awl_keyboard: Pwl_keyboard; AFormat: DWord; AFd: LongInt{fd}; ASize: DWord); cdecl;
var
  AIntf: IWlKeyboardListener;
begin
  if AData = nil then Exit;
  AIntf := IWlKeyboardListener(AData^.ListenerUserData);
  AIntf.wl_keyboard_keymap(TWlKeyboard(AData^.PascalObject), AFormat, AFd, ASize);
end;

procedure wl_keyboard_enter_Intf(AData: PWLUserData; Awl_keyboard: Pwl_keyboard; ASerial: DWord; ASurface: Pwl_surface; AKeys: Pwl_array); cdecl;
var
  AIntf: IWlKeyboardListener;
begin
  if AData = nil then Exit;
  AIntf := IWlKeyboardListener(AData^.ListenerUserData);
  AIntf.wl_keyboard_enter(TWlKeyboard(AData^.PascalObject), ASerial,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AKeys);
end;

procedure wl_keyboard_leave_Intf(AData: PWLUserData; Awl_keyboard: Pwl_keyboard; ASerial: DWord; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWlKeyboardListener;
begin
  if AData = nil then Exit;
  AIntf := IWlKeyboardListener(AData^.ListenerUserData);
  AIntf.wl_keyboard_leave(TWlKeyboard(AData^.PascalObject), ASerial,  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wl_keyboard_key_Intf(AData: PWLUserData; Awl_keyboard: Pwl_keyboard; ASerial: DWord; ATime: DWord; AKey: DWord; AState: DWord); cdecl;
var
  AIntf: IWlKeyboardListener;
begin
  if AData = nil then Exit;
  AIntf := IWlKeyboardListener(AData^.ListenerUserData);
  AIntf.wl_keyboard_key(TWlKeyboard(AData^.PascalObject), ASerial, ATime, AKey, AState);
end;

procedure wl_keyboard_modifiers_Intf(AData: PWLUserData; Awl_keyboard: Pwl_keyboard; ASerial: DWord; AModsDepressed: DWord; AModsLatched: DWord; AModsLocked: DWord; AGroup: DWord); cdecl;
var
  AIntf: IWlKeyboardListener;
begin
  if AData = nil then Exit;
  AIntf := IWlKeyboardListener(AData^.ListenerUserData);
  AIntf.wl_keyboard_modifiers(TWlKeyboard(AData^.PascalObject), ASerial, AModsDepressed, AModsLatched, AModsLocked, AGroup);
end;

procedure wl_keyboard_repeat_info_Intf(AData: PWLUserData; Awl_keyboard: Pwl_keyboard; ARate: LongInt; ADelay: LongInt); cdecl;
var
  AIntf: IWlKeyboardListener;
begin
  if AData = nil then Exit;
  AIntf := IWlKeyboardListener(AData^.ListenerUserData);
  AIntf.wl_keyboard_repeat_info(TWlKeyboard(AData^.PascalObject), ARate, ADelay);
end;

procedure wl_touch_down_Intf(AData: PWLUserData; Awl_touch: Pwl_touch; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AId: LongInt; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
var
  AIntf: IWlTouchListener;
begin
  if AData = nil then Exit;
  AIntf := IWlTouchListener(AData^.ListenerUserData);
  AIntf.wl_touch_down(TWlTouch(AData^.PascalObject), ASerial, ATime,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AId, AX, AY);
end;

procedure wl_touch_up_Intf(AData: PWLUserData; Awl_touch: Pwl_touch; ASerial: DWord; ATime: DWord; AId: LongInt); cdecl;
var
  AIntf: IWlTouchListener;
begin
  if AData = nil then Exit;
  AIntf := IWlTouchListener(AData^.ListenerUserData);
  AIntf.wl_touch_up(TWlTouch(AData^.PascalObject), ASerial, ATime, AId);
end;

procedure wl_touch_motion_Intf(AData: PWLUserData; Awl_touch: Pwl_touch; ATime: DWord; AId: LongInt; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
var
  AIntf: IWlTouchListener;
begin
  if AData = nil then Exit;
  AIntf := IWlTouchListener(AData^.ListenerUserData);
  AIntf.wl_touch_motion(TWlTouch(AData^.PascalObject), ATime, AId, AX, AY);
end;

procedure wl_touch_frame_Intf(AData: PWLUserData; Awl_touch: Pwl_touch); cdecl;
var
  AIntf: IWlTouchListener;
begin
  if AData = nil then Exit;
  AIntf := IWlTouchListener(AData^.ListenerUserData);
  AIntf.wl_touch_frame(TWlTouch(AData^.PascalObject));
end;

procedure wl_touch_cancel_Intf(AData: PWLUserData; Awl_touch: Pwl_touch); cdecl;
var
  AIntf: IWlTouchListener;
begin
  if AData = nil then Exit;
  AIntf := IWlTouchListener(AData^.ListenerUserData);
  AIntf.wl_touch_cancel(TWlTouch(AData^.PascalObject));
end;

procedure wl_touch_shape_Intf(AData: PWLUserData; Awl_touch: Pwl_touch; AId: LongInt; AMajor: Longint{24.8}; AMinor: Longint{24.8}); cdecl;
var
  AIntf: IWlTouchListener;
begin
  if AData = nil then Exit;
  AIntf := IWlTouchListener(AData^.ListenerUserData);
  AIntf.wl_touch_shape(TWlTouch(AData^.PascalObject), AId, AMajor, AMinor);
end;

procedure wl_touch_orientation_Intf(AData: PWLUserData; Awl_touch: Pwl_touch; AId: LongInt; AOrientation: Longint{24.8}); cdecl;
var
  AIntf: IWlTouchListener;
begin
  if AData = nil then Exit;
  AIntf := IWlTouchListener(AData^.ListenerUserData);
  AIntf.wl_touch_orientation(TWlTouch(AData^.PascalObject), AId, AOrientation);
end;

procedure wl_output_geometry_Intf(AData: PWLUserData; Awl_output: Pwl_output; AX: LongInt; AY: LongInt; APhysicalWidth: LongInt; APhysicalHeight: LongInt; ASubpixel: LongInt; AMake: Pchar; AModel: Pchar; ATransform: LongInt); cdecl;
var
  AIntf: IWlOutputListener;
begin
  if AData = nil then Exit;
  AIntf := IWlOutputListener(AData^.ListenerUserData);
  AIntf.wl_output_geometry(TWlOutput(AData^.PascalObject), AX, AY, APhysicalWidth, APhysicalHeight, ASubpixel, AMake, AModel, ATransform);
end;

procedure wl_output_mode_Intf(AData: PWLUserData; Awl_output: Pwl_output; AFlags: DWord; AWidth: LongInt; AHeight: LongInt; ARefresh: LongInt); cdecl;
var
  AIntf: IWlOutputListener;
begin
  if AData = nil then Exit;
  AIntf := IWlOutputListener(AData^.ListenerUserData);
  AIntf.wl_output_mode(TWlOutput(AData^.PascalObject), AFlags, AWidth, AHeight, ARefresh);
end;

procedure wl_output_done_Intf(AData: PWLUserData; Awl_output: Pwl_output); cdecl;
var
  AIntf: IWlOutputListener;
begin
  if AData = nil then Exit;
  AIntf := IWlOutputListener(AData^.ListenerUserData);
  AIntf.wl_output_done(TWlOutput(AData^.PascalObject));
end;

procedure wl_output_scale_Intf(AData: PWLUserData; Awl_output: Pwl_output; AFactor: LongInt); cdecl;
var
  AIntf: IWlOutputListener;
begin
  if AData = nil then Exit;
  AIntf := IWlOutputListener(AData^.ListenerUserData);
  AIntf.wl_output_scale(TWlOutput(AData^.PascalObject), AFactor);
end;

procedure wl_output_name_Intf(AData: PWLUserData; Awl_output: Pwl_output; AName: Pchar); cdecl;
var
  AIntf: IWlOutputListener;
begin
  if AData = nil then Exit;
  AIntf := IWlOutputListener(AData^.ListenerUserData);
  AIntf.wl_output_name(TWlOutput(AData^.PascalObject), AName);
end;

procedure wl_output_description_Intf(AData: PWLUserData; Awl_output: Pwl_output; ADescription: Pchar); cdecl;
var
  AIntf: IWlOutputListener;
begin
  if AData = nil then Exit;
  AIntf := IWlOutputListener(AData^.ListenerUserData);
  AIntf.wl_output_description(TWlOutput(AData^.PascalObject), ADescription);
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
  wl_surface_requests: array[0..10] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'attach'; signature: '?oii'; types: @pInterfaces[57]),
    (name: 'damage'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'n'; types: @pInterfaces[60]),
    (name: 'set_opaque_region'; signature: '?o'; types: @pInterfaces[61]),
    (name: 'set_input_region'; signature: '?o'; types: @pInterfaces[62]),
    (name: 'commit'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_buffer_transform'; signature: '2i'; types: @pInterfaces[0]),
    (name: 'set_buffer_scale'; signature: '3i'; types: @pInterfaces[0]),
    (name: 'damage_buffer'; signature: '4iiii'; types: @pInterfaces[0]),
    (name: 'offset'; signature: '5ii'; types: @pInterfaces[0])
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
  wl_output_events: array[0..5] of Twl_message = (
    (name: 'geometry'; signature: 'iiiiissi'; types: @pInterfaces[0]),
    (name: 'mode'; signature: 'uiii'; types: @pInterfaces[0]),
    (name: 'done'; signature: '2'; types: @pInterfaces[0]),
    (name: 'scale'; signature: '2i'; types: @pInterfaces[0]),
    (name: 'name'; signature: '4s'; types: @pInterfaces[0]),
    (name: 'description'; signature: '4s'; types: @pInterfaces[0])
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
  Pointer(vIntf_wl_output_Listener.name) := @wl_output_name_Intf;
  Pointer(vIntf_wl_output_Listener.description) := @wl_output_description_Intf;


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
  wl_compositor_interface.version := 5;
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
  wl_surface_interface.version := 5;
  wl_surface_interface.method_count := 11;
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
  wl_output_interface.version := 4;
  wl_output_interface.method_count := 1;
  wl_output_interface.methods := @wl_output_requests;
  wl_output_interface.event_count := 6;
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
