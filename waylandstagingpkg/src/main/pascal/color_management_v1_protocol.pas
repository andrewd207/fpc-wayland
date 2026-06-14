unit color_management_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_color_manager_v1 = Pointer;
  Pwp_color_management_output_v1 = Pointer;
  Pwp_color_management_surface_v1 = Pointer;
  Pwp_color_management_surface_feedback_v1 = Pointer;
  Pwp_image_description_creator_icc_v1 = Pointer;
  Pwp_image_description_creator_params_v1 = Pointer;
  Pwp_image_description_v1 = Pointer;
  Pwp_image_description_info_v1 = Pointer;
const
  WP_COLOR_MANAGER_V1_ERROR_UNSUPPORTED_FEATURE = 0; // request not supported
  WP_COLOR_MANAGER_V1_ERROR_SURFACE_EXISTS = 1; // color management surface exists already
  WP_COLOR_MANAGER_V1_RENDER_INTENT_PERCEPTUAL = 0; // perceptual
  WP_COLOR_MANAGER_V1_RENDER_INTENT_RELATIVE = 1; // media-relative colorimetric
  WP_COLOR_MANAGER_V1_RENDER_INTENT_SATURATION = 2; // saturation
  WP_COLOR_MANAGER_V1_RENDER_INTENT_ABSOLUTE = 3; // ICC-absolute colorimetric
  WP_COLOR_MANAGER_V1_RENDER_INTENT_RELATIVE_BPC = 4; // media-relative colorimetric + black point compensation
  WP_COLOR_MANAGER_V1_FEATURE_ICC_V2_V4 = 0; // create_icc_creator request
  WP_COLOR_MANAGER_V1_FEATURE_PARAMETRIC = 1; // create_parametric_creator request
  WP_COLOR_MANAGER_V1_FEATURE_SET_PRIMARIES = 2; // parametric set_primaries request
  WP_COLOR_MANAGER_V1_FEATURE_SET_TF_POWER = 3; // parametric set_tf_power request
  WP_COLOR_MANAGER_V1_FEATURE_SET_LUMINANCES = 4; // parametric set_luminances request
  WP_COLOR_MANAGER_V1_FEATURE_SET_MASTERING_DISPLAY_PRIMARIES = 5; // 
  WP_COLOR_MANAGER_V1_FEATURE_EXTENDED_TARGET_VOLUME = 6; // 
  WP_COLOR_MANAGER_V1_FEATURE_WINDOWS_SCRGB = 7; // create_windows_scrgb request
  WP_COLOR_MANAGER_V1_PRIMARIES_SRGB = 1; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_PAL_M = 2; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_PAL = 3; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_NTSC = 4; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_GENERIC_FILM = 5; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_BT2020 = 6; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_CIE1931_XYZ = 7; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_DCI_P3 = 8; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_DISPLAY_P3 = 9; // 
  WP_COLOR_MANAGER_V1_PRIMARIES_ADOBE_RGB = 10; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_BT1886 = 1; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_GAMMA22 = 2; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_GAMMA28 = 3; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_ST240 = 4; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_EXT_LINEAR = 5; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_LOG_100 = 6; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_LOG_316 = 7; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_XVYCC = 8; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_SRGB = 9; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_EXT_SRGB = 10; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_ST2084_PQ = 11; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_ST428 = 12; // 
  WP_COLOR_MANAGER_V1_TRANSFER_FUNCTION_HLG = 13; // 

type
  Pwp_color_manager_v1_listener = ^Twp_color_manager_v1_listener;
  Twp_color_manager_v1_listener = record
    supported_intent : procedure(data: Pointer; AWpColorManagerV1: Pwp_color_manager_v1; ARenderIntent: DWord); cdecl;
    supported_feature : procedure(data: Pointer; AWpColorManagerV1: Pwp_color_manager_v1; AFeature: DWord); cdecl;
    supported_tf_named : procedure(data: Pointer; AWpColorManagerV1: Pwp_color_manager_v1; ATf: DWord); cdecl;
    supported_primaries_named : procedure(data: Pointer; AWpColorManagerV1: Pwp_color_manager_v1; APrimaries: DWord); cdecl;
    done : procedure(data: Pointer; AWpColorManagerV1: Pwp_color_manager_v1); cdecl;
  end;

  Pwp_color_management_output_v1_listener = ^Twp_color_management_output_v1_listener;
  Twp_color_management_output_v1_listener = record
    image_description_changed : procedure(data: Pointer; AWpColorManagementOutputV1: Pwp_color_management_output_v1); cdecl;
  end;

const
  WP_COLOR_MANAGEMENT_SURFACE_V1_ERROR_RENDER_INTENT = 0; // unsupported rendering intent
  WP_COLOR_MANAGEMENT_SURFACE_V1_ERROR_IMAGE_DESCRIPTION = 1; // invalid image description
  WP_COLOR_MANAGEMENT_SURFACE_V1_ERROR_INERT = 2; // forbidden request on inert object

type
  Pwp_color_management_surface_v1_listener = ^Twp_color_management_surface_v1_listener;
  Twp_color_management_surface_v1_listener = record
  end;

const
  WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_ERROR_INERT = 0; // forbidden request on inert object
  WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_ERROR_UNSUPPORTED_FEATURE = 1; // attempted to use an unsupported feature

type
  Pwp_color_management_surface_feedback_v1_listener = ^Twp_color_management_surface_feedback_v1_listener;
  Twp_color_management_surface_feedback_v1_listener = record
    preferred_changed : procedure(data: Pointer; AWpColorManagementSurfaceFeedbackV1: Pwp_color_management_surface_feedback_v1; AIdentity: DWord); cdecl;
  end;

const
  WP_IMAGE_DESCRIPTION_CREATOR_ICC_V1_ERROR_INCOMPLETE_SET = 0; // incomplete parameter set
  WP_IMAGE_DESCRIPTION_CREATOR_ICC_V1_ERROR_ALREADY_SET = 1; // property already set
  WP_IMAGE_DESCRIPTION_CREATOR_ICC_V1_ERROR_BAD_FD = 2; // fd not seekable and readable
  WP_IMAGE_DESCRIPTION_CREATOR_ICC_V1_ERROR_BAD_SIZE = 3; // no or too much data
  WP_IMAGE_DESCRIPTION_CREATOR_ICC_V1_ERROR_OUT_OF_FILE = 4; // offset + length exceeds file size

type
  Pwp_image_description_creator_icc_v1_listener = ^Twp_image_description_creator_icc_v1_listener;
  Twp_image_description_creator_icc_v1_listener = record
  end;

const
  WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_ERROR_INCOMPLETE_SET = 0; // incomplete parameter set
  WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_ERROR_ALREADY_SET = 1; // property already set
  WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_ERROR_UNSUPPORTED_FEATURE = 2; // request not supported
  WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_ERROR_INVALID_TF = 3; // invalid transfer characteristic
  WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_ERROR_INVALID_PRIMARIES_NAMED = 4; // invalid primaries named
  WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_ERROR_INVALID_LUMINANCE = 5; // invalid luminance value or range

type
  Pwp_image_description_creator_params_v1_listener = ^Twp_image_description_creator_params_v1_listener;
  Twp_image_description_creator_params_v1_listener = record
  end;

const
  WP_IMAGE_DESCRIPTION_V1_ERROR_NOT_READY = 0; // attempted to use an object which is not ready
  WP_IMAGE_DESCRIPTION_V1_ERROR_NO_INFORMATION = 1; // get_information not allowed
  WP_IMAGE_DESCRIPTION_V1_CAUSE_LOW_VERSION = 0; // interface version too low
  WP_IMAGE_DESCRIPTION_V1_CAUSE_UNSUPPORTED = 1; // unsupported image description data
  WP_IMAGE_DESCRIPTION_V1_CAUSE_OPERATING_SYSTEM = 2; // error independent of the client
  WP_IMAGE_DESCRIPTION_V1_CAUSE_NO_OUTPUT = 3; // the relevant output no longer exists

type
  Pwp_image_description_v1_listener = ^Twp_image_description_v1_listener;
  Twp_image_description_v1_listener = record
    failed : procedure(data: Pointer; AWpImageDescriptionV1: Pwp_image_description_v1; ACause: DWord; AMsg: Pchar); cdecl;
    ready : procedure(data: Pointer; AWpImageDescriptionV1: Pwp_image_description_v1; AIdentity: DWord); cdecl;
  end;

  Pwp_image_description_info_v1_listener = ^Twp_image_description_info_v1_listener;
  Twp_image_description_info_v1_listener = record
    done : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1); cdecl;
    icc_file : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; AIcc: LongInt{fd}; AIccSize: DWord); cdecl;
    primaries : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt); cdecl;
    primaries_named : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; APrimaries: DWord); cdecl;
    tf_power : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; AEexp: DWord); cdecl;
    tf_named : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; ATf: DWord); cdecl;
    luminances : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; AMinLum: DWord; AMaxLum: DWord; AReferenceLum: DWord); cdecl;
    target_primaries : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt); cdecl;
    target_luminance : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; AMinLum: DWord; AMaxLum: DWord); cdecl;
    target_max_cll : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; AMaxCll: DWord); cdecl;
    target_max_fall : procedure(data: Pointer; AWpImageDescriptionInfoV1: Pwp_image_description_info_v1; AMaxFall: DWord); cdecl;
  end;



  TWpColorManagerV1 = class;
  TWpColorManagementOutputV1 = class;
  TWpColorManagementSurfaceV1 = class;
  TWpColorManagementSurfaceFeedbackV1 = class;
  TWpImageDescriptionCreatorIccV1 = class;
  TWpImageDescriptionCreatorParamsV1 = class;
  TWpImageDescriptionV1 = class;
  TWpImageDescriptionInfoV1 = class;


  IWpColorManagerV1Listener = interface
  ['IWpColorManagerV1Listener']
    procedure wp_color_manager_v1_supported_intent(AWpColorManagerV1: TWpColorManagerV1; ARenderIntent: DWord);
    procedure wp_color_manager_v1_supported_feature(AWpColorManagerV1: TWpColorManagerV1; AFeature: DWord);
    procedure wp_color_manager_v1_supported_tf_named(AWpColorManagerV1: TWpColorManagerV1; ATf: DWord);
    procedure wp_color_manager_v1_supported_primaries_named(AWpColorManagerV1: TWpColorManagerV1; APrimaries: DWord);
    procedure wp_color_manager_v1_done(AWpColorManagerV1: TWpColorManagerV1);
  end;

  IWpColorManagementOutputV1Listener = interface
  ['IWpColorManagementOutputV1Listener']
    procedure wp_color_management_output_v1_image_description_changed(AWpColorManagementOutputV1: TWpColorManagementOutputV1);
  end;

  IWpColorManagementSurfaceV1Listener = interface
  ['IWpColorManagementSurfaceV1Listener']
  end;

  IWpColorManagementSurfaceFeedbackV1Listener = interface
  ['IWpColorManagementSurfaceFeedbackV1Listener']
    procedure wp_color_management_surface_feedback_v1_preferred_changed(AWpColorManagementSurfaceFeedbackV1: TWpColorManagementSurfaceFeedbackV1; AIdentity: DWord);
  end;

  IWpImageDescriptionCreatorIccV1Listener = interface
  ['IWpImageDescriptionCreatorIccV1Listener']
  end;

  IWpImageDescriptionCreatorParamsV1Listener = interface
  ['IWpImageDescriptionCreatorParamsV1Listener']
  end;

  IWpImageDescriptionV1Listener = interface
  ['IWpImageDescriptionV1Listener']
    procedure wp_image_description_v1_failed(AWpImageDescriptionV1: TWpImageDescriptionV1; ACause: DWord; AMsg: String);
    procedure wp_image_description_v1_ready(AWpImageDescriptionV1: TWpImageDescriptionV1; AIdentity: DWord);
  end;

  IWpImageDescriptionInfoV1Listener = interface
  ['IWpImageDescriptionInfoV1Listener']
    procedure wp_image_description_info_v1_done(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1);
    procedure wp_image_description_info_v1_icc_file(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; AIcc: LongInt{fd}; AIccSize: DWord);
    procedure wp_image_description_info_v1_primaries(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt);
    procedure wp_image_description_info_v1_primaries_named(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; APrimaries: DWord);
    procedure wp_image_description_info_v1_tf_power(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; AEexp: DWord);
    procedure wp_image_description_info_v1_tf_named(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; ATf: DWord);
    procedure wp_image_description_info_v1_luminances(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; AMinLum: DWord; AMaxLum: DWord; AReferenceLum: DWord);
    procedure wp_image_description_info_v1_target_primaries(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt);
    procedure wp_image_description_info_v1_target_luminance(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; AMinLum: DWord; AMaxLum: DWord);
    procedure wp_image_description_info_v1_target_max_cll(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; AMaxCll: DWord);
    procedure wp_image_description_info_v1_target_max_fall(AWpImageDescriptionInfoV1: TWpImageDescriptionInfoV1; AMaxFall: DWord);
  end;




  TWpColorManagerV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_OUTPUT = 1;
    const _GET_SURFACE = 2;
    const _GET_SURFACE_FEEDBACK = 3;
    const _CREATE_ICC_CREATOR = 4;
    const _CREATE_PARAMETRIC_CREATOR = 5;
    const _CREATE_WINDOWS_SCRGB = 6;
  public
    destructor Destroy; override;
    function GetOutput(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TWpColorManagementOutputV1}): TWpColorManagementOutputV1;
    function GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpColorManagementSurfaceV1}): TWpColorManagementSurfaceV1;
    function GetSurfaceFeedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpColorManagementSurfaceFeedbackV1}): TWpColorManagementSurfaceFeedbackV1;
    function CreateIccCreator(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionCreatorIccV1}): TWpImageDescriptionCreatorIccV1;
    function CreateParametricCreator(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionCreatorParamsV1}): TWpImageDescriptionCreatorParamsV1;
    function CreateWindowsScrgb(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
    function AddListener(AIntf: IWpColorManagerV1Listener): LongInt;
  end;

  TWpColorManagementOutputV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_IMAGE_DESCRIPTION = 1;
  public
    destructor Destroy; override;
    function GetImageDescription(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
    function AddListener(AIntf: IWpColorManagementOutputV1Listener): LongInt;
  end;

  TWpColorManagementSurfaceV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_IMAGE_DESCRIPTION = 1;
    const _UNSET_IMAGE_DESCRIPTION = 2;
  public
    destructor Destroy; override;
    procedure SetImageDescription(AImageDescription: TWpImageDescriptionV1; ARenderIntent: DWord);
    procedure UnsetImageDescription;
    function AddListener(AIntf: IWpColorManagementSurfaceV1Listener): LongInt;
  end;

  TWpColorManagementSurfaceFeedbackV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_PREFERRED = 1;
    const _GET_PREFERRED_PARAMETRIC = 2;
  public
    destructor Destroy; override;
    function GetPreferred(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
    function GetPreferredParametric(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
    function AddListener(AIntf: IWpColorManagementSurfaceFeedbackV1Listener): LongInt;
  end;

  TWpImageDescriptionCreatorIccV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE = 0;
    const _SET_ICC_FILE = 1;
  public
    function Create(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
    procedure SetIccFile(AIccProfile: LongInt{fd}; AOffset: DWord; ALength: DWord);
    function AddListener(AIntf: IWpImageDescriptionCreatorIccV1Listener): LongInt;
  end;

  TWpImageDescriptionCreatorParamsV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE = 0;
    const _SET_TF_NAMED = 1;
    const _SET_TF_POWER = 2;
    const _SET_PRIMARIES_NAMED = 3;
    const _SET_PRIMARIES = 4;
    const _SET_LUMINANCES = 5;
    const _SET_MASTERING_DISPLAY_PRIMARIES = 6;
    const _SET_MASTERING_LUMINANCE = 7;
    const _SET_MAX_CLL = 8;
    const _SET_MAX_FALL = 9;
  public
    function Create(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
    procedure SetTfNamed(ATf: DWord);
    procedure SetTfPower(AEexp: DWord);
    procedure SetPrimariesNamed(APrimaries: DWord);
    procedure SetPrimaries(ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt);
    procedure SetLuminances(AMinLum: DWord; AMaxLum: DWord; AReferenceLum: DWord);
    procedure SetMasteringDisplayPrimaries(ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt);
    procedure SetMasteringLuminance(AMinLum: DWord; AMaxLum: DWord);
    procedure SetMaxCll(AMaxCll: DWord);
    procedure SetMaxFall(AMaxFall: DWord);
    function AddListener(AIntf: IWpImageDescriptionCreatorParamsV1Listener): LongInt;
  end;

  TWpImageDescriptionV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_INFORMATION = 1;
  public
    destructor Destroy; override;
    function GetInformation(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionInfoV1}): TWpImageDescriptionInfoV1;
    function AddListener(AIntf: IWpImageDescriptionV1Listener): LongInt;
  end;

  TWpImageDescriptionInfoV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
    function AddListener(AIntf: IWpImageDescriptionInfoV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_color_manager_v1_interface: Twl_interface;
  WP_COLOR_MANAGER_V1_INTERFACE_NAME: String = 'wp_color_manager_v1';
  wp_color_management_output_v1_interface: Twl_interface;
  WP_COLOR_MANAGEMENT_OUTPUT_V1_INTERFACE_NAME: String = 'wp_color_management_output_v1';
  wp_color_management_surface_v1_interface: Twl_interface;
  WP_COLOR_MANAGEMENT_SURFACE_V1_INTERFACE_NAME: String = 'wp_color_management_surface_v1';
  wp_color_management_surface_feedback_v1_interface: Twl_interface;
  WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_INTERFACE_NAME: String = 'wp_color_management_surface_feedback_v1';
  wp_image_description_creator_icc_v1_interface: Twl_interface;
  WP_IMAGE_DESCRIPTION_CREATOR_ICC_V1_INTERFACE_NAME: String = 'wp_image_description_creator_icc_v1';
  wp_image_description_creator_params_v1_interface: Twl_interface;
  WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_INTERFACE_NAME: String = 'wp_image_description_creator_params_v1';
  wp_image_description_v1_interface: Twl_interface;
  WP_IMAGE_DESCRIPTION_V1_INTERFACE_NAME: String = 'wp_image_description_v1';
  wp_image_description_info_v1_interface: Twl_interface;
  WP_IMAGE_DESCRIPTION_INFO_V1_INTERFACE_NAME: String = 'wp_image_description_info_v1';



implementation

var
  vIntf_wp_color_manager_v1_Listener: Twp_color_manager_v1_listener;
  vIntf_wp_color_management_output_v1_Listener: Twp_color_management_output_v1_listener;
  vIntf_wp_color_management_surface_v1_Listener: Twp_color_management_surface_v1_listener;
  vIntf_wp_color_management_surface_feedback_v1_Listener: Twp_color_management_surface_feedback_v1_listener;
  vIntf_wp_image_description_creator_icc_v1_Listener: Twp_image_description_creator_icc_v1_listener;
  vIntf_wp_image_description_creator_params_v1_Listener: Twp_image_description_creator_params_v1_listener;
  vIntf_wp_image_description_v1_Listener: Twp_image_description_v1_listener;
  vIntf_wp_image_description_info_v1_Listener: Twp_image_description_info_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpColorManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpColorManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpColorManagerV1.GetOutput(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TWpColorManagementOutputV1}): TWpColorManagementOutputV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_OUTPUT, @wp_color_management_output_v1_interface, nil, AOutput.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpColorManagementOutputV1;
  Result := TWpColorManagementOutputV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpColorManagementOutputV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpColorManagementOutputV1]);
end;

function TWpColorManagerV1.GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpColorManagementSurfaceV1}): TWpColorManagementSurfaceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE, @wp_color_management_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpColorManagementSurfaceV1;
  Result := TWpColorManagementSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpColorManagementSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpColorManagementSurfaceV1]);
end;

function TWpColorManagerV1.GetSurfaceFeedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpColorManagementSurfaceFeedbackV1}): TWpColorManagementSurfaceFeedbackV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE_FEEDBACK, @wp_color_management_surface_feedback_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpColorManagementSurfaceFeedbackV1;
  Result := TWpColorManagementSurfaceFeedbackV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpColorManagementSurfaceFeedbackV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpColorManagementSurfaceFeedbackV1]);
end;

function TWpColorManagerV1.CreateIccCreator(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionCreatorIccV1}): TWpImageDescriptionCreatorIccV1;
var
  obj: Pwl_proxy;
begin
  obj := wl_proxy_marshal_constructor(FProxy,
      _CREATE_ICC_CREATOR, @wp_image_description_creator_icc_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionCreatorIccV1;
  Result := TWpImageDescriptionCreatorIccV1(AProxyClass.Create(obj));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionCreatorIccV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionCreatorIccV1]);
end;

function TWpColorManagerV1.CreateParametricCreator(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionCreatorParamsV1}): TWpImageDescriptionCreatorParamsV1;
var
  obj: Pwl_proxy;
begin
  obj := wl_proxy_marshal_constructor(FProxy,
      _CREATE_PARAMETRIC_CREATOR, @wp_image_description_creator_params_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionCreatorParamsV1;
  Result := TWpImageDescriptionCreatorParamsV1(AProxyClass.Create(obj));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionCreatorParamsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionCreatorParamsV1]);
end;

function TWpColorManagerV1.CreateWindowsScrgb(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
var
  image_description: Pwl_proxy;
begin
  image_description := wl_proxy_marshal_constructor(FProxy,
      _CREATE_WINDOWS_SCRGB, @wp_image_description_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionV1;
  Result := TWpImageDescriptionV1(AProxyClass.Create(image_description));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionV1]);
end;

function TWpColorManagerV1.AddListener(AIntf: IWpColorManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_color_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpColorManagementOutputV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpColorManagementOutputV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpColorManagementOutputV1.GetImageDescription(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
var
  image_description: Pwl_proxy;
begin
  image_description := wl_proxy_marshal_constructor(FProxy,
      _GET_IMAGE_DESCRIPTION, @wp_image_description_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionV1;
  Result := TWpImageDescriptionV1(AProxyClass.Create(image_description));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionV1]);
end;

function TWpColorManagementOutputV1.AddListener(AIntf: IWpColorManagementOutputV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_color_management_output_v1_Listener, @FUserDataRec);
end;
constructor TWpColorManagementSurfaceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpColorManagementSurfaceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpColorManagementSurfaceV1.SetImageDescription(AImageDescription: TWpImageDescriptionV1; ARenderIntent: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_IMAGE_DESCRIPTION, AImageDescription.Proxy, ARenderIntent);
end;

procedure TWpColorManagementSurfaceV1.UnsetImageDescription;
begin
  wl_proxy_marshal(FProxy, _UNSET_IMAGE_DESCRIPTION);
end;

function TWpColorManagementSurfaceV1.AddListener(AIntf: IWpColorManagementSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_color_management_surface_v1_Listener, @FUserDataRec);
end;
constructor TWpColorManagementSurfaceFeedbackV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpColorManagementSurfaceFeedbackV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpColorManagementSurfaceFeedbackV1.GetPreferred(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
var
  image_description: Pwl_proxy;
begin
  image_description := wl_proxy_marshal_constructor(FProxy,
      _GET_PREFERRED, @wp_image_description_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionV1;
  Result := TWpImageDescriptionV1(AProxyClass.Create(image_description));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionV1]);
end;

function TWpColorManagementSurfaceFeedbackV1.GetPreferredParametric(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
var
  image_description: Pwl_proxy;
begin
  image_description := wl_proxy_marshal_constructor(FProxy,
      _GET_PREFERRED_PARAMETRIC, @wp_image_description_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionV1;
  Result := TWpImageDescriptionV1(AProxyClass.Create(image_description));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionV1]);
end;

function TWpColorManagementSurfaceFeedbackV1.AddListener(AIntf: IWpColorManagementSurfaceFeedbackV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_color_management_surface_feedback_v1_Listener, @FUserDataRec);
end;
constructor TWpImageDescriptionCreatorIccV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

function TWpImageDescriptionCreatorIccV1.Create(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
var
  image_description: Pwl_proxy;
begin
  image_description := wl_proxy_marshal_constructor(FProxy,
      _CREATE, @wp_image_description_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionV1;
  Result := TWpImageDescriptionV1(AProxyClass.Create(image_description));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionV1]);
  inherited Destroy;
end;

procedure TWpImageDescriptionCreatorIccV1.SetIccFile(AIccProfile: LongInt{fd}; AOffset: DWord; ALength: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ICC_FILE, AIccProfile, AOffset, ALength);
end;

function TWpImageDescriptionCreatorIccV1.AddListener(AIntf: IWpImageDescriptionCreatorIccV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_image_description_creator_icc_v1_Listener, @FUserDataRec);
end;
constructor TWpImageDescriptionCreatorParamsV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

function TWpImageDescriptionCreatorParamsV1.Create(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionV1}): TWpImageDescriptionV1;
var
  image_description: Pwl_proxy;
begin
  image_description := wl_proxy_marshal_constructor(FProxy,
      _CREATE, @wp_image_description_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionV1;
  Result := TWpImageDescriptionV1(AProxyClass.Create(image_description));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionV1]);
  inherited Destroy;
end;

procedure TWpImageDescriptionCreatorParamsV1.SetTfNamed(ATf: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TF_NAMED, ATf);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetTfPower(AEexp: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TF_POWER, AEexp);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetPrimariesNamed(APrimaries: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_PRIMARIES_NAMED, APrimaries);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetPrimaries(ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_PRIMARIES, ARX, ARY, AGX, AGY, ABX, ABY, AWX, AWY);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetLuminances(AMinLum: DWord; AMaxLum: DWord; AReferenceLum: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_LUMINANCES, AMinLum, AMaxLum, AReferenceLum);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetMasteringDisplayPrimaries(ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_MASTERING_DISPLAY_PRIMARIES, ARX, ARY, AGX, AGY, ABX, ABY, AWX, AWY);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetMasteringLuminance(AMinLum: DWord; AMaxLum: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_MASTERING_LUMINANCE, AMinLum, AMaxLum);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetMaxCll(AMaxCll: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_MAX_CLL, AMaxCll);
end;

procedure TWpImageDescriptionCreatorParamsV1.SetMaxFall(AMaxFall: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_MAX_FALL, AMaxFall);
end;

function TWpImageDescriptionCreatorParamsV1.AddListener(AIntf: IWpImageDescriptionCreatorParamsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_image_description_creator_params_v1_Listener, @FUserDataRec);
end;
constructor TWpImageDescriptionV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpImageDescriptionV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpImageDescriptionV1.GetInformation(AProxyClass: TWLProxyObjectClass = nil {TWpImageDescriptionInfoV1}): TWpImageDescriptionInfoV1;
var
  information: Pwl_proxy;
begin
  information := wl_proxy_marshal_constructor(FProxy,
      _GET_INFORMATION, @wp_image_description_info_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpImageDescriptionInfoV1;
  Result := TWpImageDescriptionInfoV1(AProxyClass.Create(information));
  if not AProxyClass.InheritsFrom(TWpImageDescriptionInfoV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpImageDescriptionInfoV1]);
end;

function TWpImageDescriptionV1.AddListener(AIntf: IWpImageDescriptionV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_image_description_v1_Listener, @FUserDataRec);
end;
constructor TWpImageDescriptionInfoV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

function TWpImageDescriptionInfoV1.AddListener(AIntf: IWpImageDescriptionInfoV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_image_description_info_v1_Listener, @FUserDataRec);
end;




procedure wp_color_manager_v1_supported_intent_Intf(AData: PWLUserData; Awp_color_manager_v1: Pwp_color_manager_v1; ARenderIntent: DWord); cdecl;
var
  AIntf: IWpColorManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_manager_v1_supported_intent(TWpColorManagerV1(AData^.PascalObject), ARenderIntent);
end;

procedure wp_color_manager_v1_supported_feature_Intf(AData: PWLUserData; Awp_color_manager_v1: Pwp_color_manager_v1; AFeature: DWord); cdecl;
var
  AIntf: IWpColorManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_manager_v1_supported_feature(TWpColorManagerV1(AData^.PascalObject), AFeature);
end;

procedure wp_color_manager_v1_supported_tf_named_Intf(AData: PWLUserData; Awp_color_manager_v1: Pwp_color_manager_v1; ATf: DWord); cdecl;
var
  AIntf: IWpColorManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_manager_v1_supported_tf_named(TWpColorManagerV1(AData^.PascalObject), ATf);
end;

procedure wp_color_manager_v1_supported_primaries_named_Intf(AData: PWLUserData; Awp_color_manager_v1: Pwp_color_manager_v1; APrimaries: DWord); cdecl;
var
  AIntf: IWpColorManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_manager_v1_supported_primaries_named(TWpColorManagerV1(AData^.PascalObject), APrimaries);
end;

procedure wp_color_manager_v1_done_Intf(AData: PWLUserData; Awp_color_manager_v1: Pwp_color_manager_v1); cdecl;
var
  AIntf: IWpColorManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_manager_v1_done(TWpColorManagerV1(AData^.PascalObject));
end;

procedure wp_color_management_output_v1_image_description_changed_Intf(AData: PWLUserData; Awp_color_management_output_v1: Pwp_color_management_output_v1); cdecl;
var
  AIntf: IWpColorManagementOutputV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorManagementOutputV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_management_output_v1_image_description_changed(TWpColorManagementOutputV1(AData^.PascalObject));
end;

procedure wp_color_management_surface_feedback_v1_preferred_changed_Intf(AData: PWLUserData; Awp_color_management_surface_feedback_v1: Pwp_color_management_surface_feedback_v1; AIdentity: DWord); cdecl;
var
  AIntf: IWpColorManagementSurfaceFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorManagementSurfaceFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_management_surface_feedback_v1_preferred_changed(TWpColorManagementSurfaceFeedbackV1(AData^.PascalObject), AIdentity);
end;

procedure wp_image_description_v1_failed_Intf(AData: PWLUserData; Awp_image_description_v1: Pwp_image_description_v1; ACause: DWord; AMsg: Pchar); cdecl;
var
  AIntf: IWpImageDescriptionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_v1_failed(TWpImageDescriptionV1(AData^.PascalObject), ACause, AMsg);
end;

procedure wp_image_description_v1_ready_Intf(AData: PWLUserData; Awp_image_description_v1: Pwp_image_description_v1; AIdentity: DWord); cdecl;
var
  AIntf: IWpImageDescriptionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_v1_ready(TWpImageDescriptionV1(AData^.PascalObject), AIdentity);
end;

procedure wp_image_description_info_v1_done_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_done(TWpImageDescriptionInfoV1(AData^.PascalObject));
end;

procedure wp_image_description_info_v1_icc_file_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; AIcc: LongInt{fd}; AIccSize: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_icc_file(TWpImageDescriptionInfoV1(AData^.PascalObject), AIcc, AIccSize);
end;

procedure wp_image_description_info_v1_primaries_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_primaries(TWpImageDescriptionInfoV1(AData^.PascalObject), ARX, ARY, AGX, AGY, ABX, ABY, AWX, AWY);
end;

procedure wp_image_description_info_v1_primaries_named_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; APrimaries: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_primaries_named(TWpImageDescriptionInfoV1(AData^.PascalObject), APrimaries);
end;

procedure wp_image_description_info_v1_tf_power_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; AEexp: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_tf_power(TWpImageDescriptionInfoV1(AData^.PascalObject), AEexp);
end;

procedure wp_image_description_info_v1_tf_named_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; ATf: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_tf_named(TWpImageDescriptionInfoV1(AData^.PascalObject), ATf);
end;

procedure wp_image_description_info_v1_luminances_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; AMinLum: DWord; AMaxLum: DWord; AReferenceLum: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_luminances(TWpImageDescriptionInfoV1(AData^.PascalObject), AMinLum, AMaxLum, AReferenceLum);
end;

procedure wp_image_description_info_v1_target_primaries_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; ARX: LongInt; ARY: LongInt; AGX: LongInt; AGY: LongInt; ABX: LongInt; ABY: LongInt; AWX: LongInt; AWY: LongInt); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_target_primaries(TWpImageDescriptionInfoV1(AData^.PascalObject), ARX, ARY, AGX, AGY, ABX, ABY, AWX, AWY);
end;

procedure wp_image_description_info_v1_target_luminance_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; AMinLum: DWord; AMaxLum: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_target_luminance(TWpImageDescriptionInfoV1(AData^.PascalObject), AMinLum, AMaxLum);
end;

procedure wp_image_description_info_v1_target_max_cll_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; AMaxCll: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_target_max_cll(TWpImageDescriptionInfoV1(AData^.PascalObject), AMaxCll);
end;

procedure wp_image_description_info_v1_target_max_fall_Intf(AData: PWLUserData; Awp_image_description_info_v1: Pwp_image_description_info_v1; AMaxFall: DWord); cdecl;
var
  AIntf: IWpImageDescriptionInfoV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpImageDescriptionInfoV1Listener(AData^.ListenerUserData);
  AIntf.wp_image_description_info_v1_target_max_fall(TWpImageDescriptionInfoV1(AData^.PascalObject), AMaxFall);
end;



const
  pInterfaces: array[0..24] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_color_management_output_v1_interface),
    (@wl_output_interface),
    (@wp_color_management_surface_v1_interface),
    (@wl_surface_interface),
    (@wp_color_management_surface_feedback_v1_interface),
    (@wl_surface_interface),
    (@wp_image_description_creator_icc_v1_interface),
    (@wp_image_description_creator_params_v1_interface),
    (@wp_image_description_v1_interface),
    (@wp_image_description_v1_interface),
    (@wp_image_description_v1_interface),
    (nil),
    (@wp_image_description_v1_interface),
    (@wp_image_description_v1_interface),
    (@wp_image_description_v1_interface),
    (@wp_image_description_v1_interface),
    (@wp_image_description_info_v1_interface)
  );

  wp_color_manager_v1_requests: array[0..6] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_output'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_surface'; signature: 'no'; types: @pInterfaces[10]),
    (name: 'get_surface_feedback'; signature: 'no'; types: @pInterfaces[12]),
    (name: 'create_icc_creator'; signature: 'n'; types: @pInterfaces[14]),
    (name: 'create_parametric_creator'; signature: 'n'; types: @pInterfaces[15]),
    (name: 'create_windows_scrgb'; signature: 'n'; types: @pInterfaces[16])
  );
  wp_color_manager_v1_events: array[0..4] of Twl_message = (
    (name: 'supported_intent'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'supported_feature'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'supported_tf_named'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'supported_primaries_named'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0])
  );
  wp_color_management_output_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_image_description'; signature: 'n'; types: @pInterfaces[17])
  );
  wp_color_management_output_v1_events: array[0..0] of Twl_message = (
    (name: 'image_description_changed'; signature: ''; types: @pInterfaces[0])
  );
  wp_color_management_surface_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_image_description'; signature: 'ou'; types: @pInterfaces[18]),
    (name: 'unset_image_description'; signature: ''; types: @pInterfaces[0])
  );
  wp_color_management_surface_feedback_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_preferred'; signature: 'n'; types: @pInterfaces[20]),
    (name: 'get_preferred_parametric'; signature: 'n'; types: @pInterfaces[21])
  );
  wp_color_management_surface_feedback_v1_events: array[0..0] of Twl_message = (
    (name: 'preferred_changed'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_image_description_creator_icc_v1_requests: array[0..1] of Twl_message = (
    (name: 'create'; signature: 'n'; types: @pInterfaces[22]),
    (name: 'set_icc_file'; signature: 'huu'; types: @pInterfaces[0])
  );
  wp_image_description_creator_params_v1_requests: array[0..9] of Twl_message = (
    (name: 'create'; signature: 'n'; types: @pInterfaces[23]),
    (name: 'set_tf_named'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_tf_power'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_primaries_named'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_primaries'; signature: 'iiiiiiii'; types: @pInterfaces[0]),
    (name: 'set_luminances'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'set_mastering_display_primaries'; signature: 'iiiiiiii'; types: @pInterfaces[0]),
    (name: 'set_mastering_luminance'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'set_max_cll'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_max_fall'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_image_description_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_information'; signature: 'n'; types: @pInterfaces[24])
  );
  wp_image_description_v1_events: array[0..1] of Twl_message = (
    (name: 'failed'; signature: 'us'; types: @pInterfaces[0]),
    (name: 'ready'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_image_description_info_v1_events: array[0..10] of Twl_message = (
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'icc_file'; signature: 'hu'; types: @pInterfaces[0]),
    (name: 'primaries'; signature: 'iiiiiiii'; types: @pInterfaces[0]),
    (name: 'primaries_named'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'tf_power'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'tf_named'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'luminances'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'target_primaries'; signature: 'iiiiiiii'; types: @pInterfaces[0]),
    (name: 'target_luminance'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'target_max_cll'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'target_max_fall'; signature: 'u'; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_wp_color_manager_v1_Listener.supported_intent) := @wp_color_manager_v1_supported_intent_Intf;
  Pointer(vIntf_wp_color_manager_v1_Listener.supported_feature) := @wp_color_manager_v1_supported_feature_Intf;
  Pointer(vIntf_wp_color_manager_v1_Listener.supported_tf_named) := @wp_color_manager_v1_supported_tf_named_Intf;
  Pointer(vIntf_wp_color_manager_v1_Listener.supported_primaries_named) := @wp_color_manager_v1_supported_primaries_named_Intf;
  Pointer(vIntf_wp_color_manager_v1_Listener.done) := @wp_color_manager_v1_done_Intf;
  Pointer(vIntf_wp_color_management_output_v1_Listener.image_description_changed) := @wp_color_management_output_v1_image_description_changed_Intf;
  Pointer(vIntf_wp_color_management_surface_feedback_v1_Listener.preferred_changed) := @wp_color_management_surface_feedback_v1_preferred_changed_Intf;
  Pointer(vIntf_wp_image_description_v1_Listener.failed) := @wp_image_description_v1_failed_Intf;
  Pointer(vIntf_wp_image_description_v1_Listener.ready) := @wp_image_description_v1_ready_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.done) := @wp_image_description_info_v1_done_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.icc_file) := @wp_image_description_info_v1_icc_file_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.primaries) := @wp_image_description_info_v1_primaries_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.primaries_named) := @wp_image_description_info_v1_primaries_named_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.tf_power) := @wp_image_description_info_v1_tf_power_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.tf_named) := @wp_image_description_info_v1_tf_named_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.luminances) := @wp_image_description_info_v1_luminances_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.target_primaries) := @wp_image_description_info_v1_target_primaries_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.target_luminance) := @wp_image_description_info_v1_target_luminance_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.target_max_cll) := @wp_image_description_info_v1_target_max_cll_Intf;
  Pointer(vIntf_wp_image_description_info_v1_Listener.target_max_fall) := @wp_image_description_info_v1_target_max_fall_Intf;


  wp_color_manager_v1_interface.name := PChar(WP_COLOR_MANAGER_V1_INTERFACE_NAME);
  wp_color_manager_v1_interface.version := 1;
  wp_color_manager_v1_interface.method_count := 7;
  wp_color_manager_v1_interface.methods := @wp_color_manager_v1_requests;
  wp_color_manager_v1_interface.event_count := 5;
  wp_color_manager_v1_interface.events := @wp_color_manager_v1_events;

  wp_color_management_output_v1_interface.name := PChar(WP_COLOR_MANAGEMENT_OUTPUT_V1_INTERFACE_NAME);
  wp_color_management_output_v1_interface.version := 1;
  wp_color_management_output_v1_interface.method_count := 2;
  wp_color_management_output_v1_interface.methods := @wp_color_management_output_v1_requests;
  wp_color_management_output_v1_interface.event_count := 1;
  wp_color_management_output_v1_interface.events := @wp_color_management_output_v1_events;

  wp_color_management_surface_v1_interface.name := PChar(WP_COLOR_MANAGEMENT_SURFACE_V1_INTERFACE_NAME);
  wp_color_management_surface_v1_interface.version := 1;
  wp_color_management_surface_v1_interface.method_count := 3;
  wp_color_management_surface_v1_interface.methods := @wp_color_management_surface_v1_requests;
  wp_color_management_surface_v1_interface.event_count := 0;
  wp_color_management_surface_v1_interface.events := nil;

  wp_color_management_surface_feedback_v1_interface.name := PChar(WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_INTERFACE_NAME);
  wp_color_management_surface_feedback_v1_interface.version := 1;
  wp_color_management_surface_feedback_v1_interface.method_count := 3;
  wp_color_management_surface_feedback_v1_interface.methods := @wp_color_management_surface_feedback_v1_requests;
  wp_color_management_surface_feedback_v1_interface.event_count := 1;
  wp_color_management_surface_feedback_v1_interface.events := @wp_color_management_surface_feedback_v1_events;

  wp_image_description_creator_icc_v1_interface.name := PChar(WP_IMAGE_DESCRIPTION_CREATOR_ICC_V1_INTERFACE_NAME);
  wp_image_description_creator_icc_v1_interface.version := 1;
  wp_image_description_creator_icc_v1_interface.method_count := 2;
  wp_image_description_creator_icc_v1_interface.methods := @wp_image_description_creator_icc_v1_requests;
  wp_image_description_creator_icc_v1_interface.event_count := 0;
  wp_image_description_creator_icc_v1_interface.events := nil;

  wp_image_description_creator_params_v1_interface.name := PChar(WP_IMAGE_DESCRIPTION_CREATOR_PARAMS_V1_INTERFACE_NAME);
  wp_image_description_creator_params_v1_interface.version := 1;
  wp_image_description_creator_params_v1_interface.method_count := 10;
  wp_image_description_creator_params_v1_interface.methods := @wp_image_description_creator_params_v1_requests;
  wp_image_description_creator_params_v1_interface.event_count := 0;
  wp_image_description_creator_params_v1_interface.events := nil;

  wp_image_description_v1_interface.name := PChar(WP_IMAGE_DESCRIPTION_V1_INTERFACE_NAME);
  wp_image_description_v1_interface.version := 1;
  wp_image_description_v1_interface.method_count := 2;
  wp_image_description_v1_interface.methods := @wp_image_description_v1_requests;
  wp_image_description_v1_interface.event_count := 2;
  wp_image_description_v1_interface.events := @wp_image_description_v1_events;

  wp_image_description_info_v1_interface.name := PChar(WP_IMAGE_DESCRIPTION_INFO_V1_INTERFACE_NAME);
  wp_image_description_info_v1_interface.version := 1;
  wp_image_description_info_v1_interface.method_count := 0;
  wp_image_description_info_v1_interface.methods := nil;
  wp_image_description_info_v1_interface.event_count := 11;
  wp_image_description_info_v1_interface.events := @wp_image_description_info_v1_events;

end;

end.
