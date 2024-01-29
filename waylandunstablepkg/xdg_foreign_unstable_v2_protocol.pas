unit xdg_foreign_unstable_v2_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzxdg_exporter_v2 = Pointer;
  Pzxdg_importer_v2 = Pointer;
  Pzxdg_exported_v2 = Pointer;
  Pzxdg_imported_v2 = Pointer;
const
  ZXDG_EXPORTER_V2_ERROR_INVALID_SURFACE = 0; // surface is not an xdg_toplevel

type
  Pzxdg_exporter_v2_listener = ^Tzxdg_exporter_v2_listener;
  Tzxdg_exporter_v2_listener = record
  end;

  Pzxdg_importer_v2_listener = ^Tzxdg_importer_v2_listener;
  Tzxdg_importer_v2_listener = record
  end;

  Pzxdg_exported_v2_listener = ^Tzxdg_exported_v2_listener;
  Tzxdg_exported_v2_listener = record
    handle : procedure(data: Pointer; AZxdgExportedV2: Pzxdg_exported_v2; AHandle: Pchar); cdecl;
  end;

const
  ZXDG_IMPORTED_V2_ERROR_INVALID_SURFACE = 0; // surface is not an xdg_toplevel

type
  Pzxdg_imported_v2_listener = ^Tzxdg_imported_v2_listener;
  Tzxdg_imported_v2_listener = record
    destroyed : procedure(data: Pointer; AZxdgImportedV2: Pzxdg_imported_v2); cdecl;
  end;



  TZxdgExporterV2 = class;
  TZxdgImporterV2 = class;
  TZxdgExportedV2 = class;
  TZxdgImportedV2 = class;


  IZxdgExporterV2Listener = interface
  ['IZxdgExporterV2Listener']
  end;

  IZxdgImporterV2Listener = interface
  ['IZxdgImporterV2Listener']
  end;

  IZxdgExportedV2Listener = interface
  ['IZxdgExportedV2Listener']
    procedure zxdg_exported_v2_handle(AZxdgExportedV2: TZxdgExportedV2; AHandle: String);
  end;

  IZxdgImportedV2Listener = interface
  ['IZxdgImportedV2Listener']
    procedure zxdg_imported_v2_destroyed(AZxdgImportedV2: TZxdgImportedV2);
  end;




  TZxdgExporterV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _EXPORT_TOPLEVEL = 1;
  public
    destructor Destroy; override;
    function ExportToplevel(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZxdgExportedV2}): TZxdgExportedV2;
    function AddListener(AIntf: IZxdgExporterV2Listener): LongInt;
  end;

  TZxdgImporterV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _IMPORT_TOPLEVEL = 1;
  public
    destructor Destroy; override;
    function ImportToplevel(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TZxdgImportedV2}): TZxdgImportedV2;
    function AddListener(AIntf: IZxdgImporterV2Listener): LongInt;
  end;

  TZxdgExportedV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZxdgExportedV2Listener): LongInt;
  end;

  TZxdgImportedV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_PARENT_OF = 1;
  public
    destructor Destroy; override;
    procedure SetParentOf(ASurface: TWlSurface);
    function AddListener(AIntf: IZxdgImportedV2Listener): LongInt;
  end;






var
  zxdg_exporter_v2_interface: Twl_interface;
  zxdg_importer_v2_interface: Twl_interface;
  zxdg_exported_v2_interface: Twl_interface;
  zxdg_imported_v2_interface: Twl_interface;



implementation

var
  vIntf_zxdg_exporter_v2_Listener: Tzxdg_exporter_v2_listener;
  vIntf_zxdg_importer_v2_Listener: Tzxdg_importer_v2_listener;
  vIntf_zxdg_exported_v2_Listener: Tzxdg_exported_v2_listener;
  vIntf_zxdg_imported_v2_Listener: Tzxdg_imported_v2_listener;



destructor TZxdgExporterV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgExporterV2.ExportToplevel(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZxdgExportedV2}): TZxdgExportedV2;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _EXPORT_TOPLEVEL, @zxdg_exported_v2_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZxdgExportedV2;
  if not AProxyClass.InheritsFrom(TZxdgExportedV2) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgExportedV2]);
  Result := TZxdgExportedV2(AProxyClass.Create(id));
end;

function TZxdgExporterV2.AddListener(AIntf: IZxdgExporterV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_exporter_v2_Listener, @FUserDataRec);
end;
destructor TZxdgImporterV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgImporterV2.ImportToplevel(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TZxdgImportedV2}): TZxdgImportedV2;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _IMPORT_TOPLEVEL, @zxdg_imported_v2_interface, nil, PChar(AHandle));
  if AProxyClass = nil then
    AProxyClass := TZxdgImportedV2;
  if not AProxyClass.InheritsFrom(TZxdgImportedV2) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgImportedV2]);
  Result := TZxdgImportedV2(AProxyClass.Create(id));
end;

function TZxdgImporterV2.AddListener(AIntf: IZxdgImporterV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_importer_v2_Listener, @FUserDataRec);
end;
destructor TZxdgExportedV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgExportedV2.AddListener(AIntf: IZxdgExportedV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_exported_v2_Listener, @FUserDataRec);
end;
destructor TZxdgImportedV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZxdgImportedV2.SetParentOf(ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT_OF, ASurface.Proxy);
end;

function TZxdgImportedV2.AddListener(AIntf: IZxdgImportedV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_imported_v2_Listener, @FUserDataRec);
end;




procedure zxdg_exported_v2_handle_Intf(AData: PWLUserData; Azxdg_exported_v2: Pzxdg_exported_v2; AHandle: Pchar); cdecl;
var
  AIntf: IZxdgExportedV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgExportedV2Listener(AData^.ListenerUserData);
  AIntf.zxdg_exported_v2_handle(TZxdgExportedV2(AData^.PascalObject), AHandle);
end;

procedure zxdg_imported_v2_destroyed_Intf(AData: PWLUserData; Azxdg_imported_v2: Pzxdg_imported_v2); cdecl;
var
  AIntf: IZxdgImportedV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgImportedV2Listener(AData^.ListenerUserData);
  AIntf.zxdg_imported_v2_destroyed(TZxdgImportedV2(AData^.PascalObject));
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
    (@zxdg_exported_v2_interface),
    (@wl_surface_interface),
    (@zxdg_imported_v2_interface),
    (nil),
    (@wl_surface_interface)
  );

  zxdg_exporter_v2_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'export_toplevel'; signature: 'no'; types: @pInterfaces[8])
  );
  zxdg_importer_v2_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'import_toplevel'; signature: 'ns'; types: @pInterfaces[10])
  );
  zxdg_exported_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_exported_v2_events: array[0..0] of Twl_message = (
    (name: 'handle'; signature: 's'; types: @pInterfaces[0])
  );
  zxdg_imported_v2_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent_of'; signature: 'o'; types: @pInterfaces[12])
  );
  zxdg_imported_v2_events: array[0..0] of Twl_message = (
    (name: 'destroyed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_exported_v2_Listener.handle) := @zxdg_exported_v2_handle_Intf;
  Pointer(vIntf_zxdg_imported_v2_Listener.destroyed) := @zxdg_imported_v2_destroyed_Intf;


  zxdg_exporter_v2_interface.name := 'zxdg_exporter_v2';
  zxdg_exporter_v2_interface.version := 1;
  zxdg_exporter_v2_interface.method_count := 2;
  zxdg_exporter_v2_interface.methods := @zxdg_exporter_v2_requests;
  zxdg_exporter_v2_interface.event_count := 0;
  zxdg_exporter_v2_interface.events := nil;

  zxdg_importer_v2_interface.name := 'zxdg_importer_v2';
  zxdg_importer_v2_interface.version := 1;
  zxdg_importer_v2_interface.method_count := 2;
  zxdg_importer_v2_interface.methods := @zxdg_importer_v2_requests;
  zxdg_importer_v2_interface.event_count := 0;
  zxdg_importer_v2_interface.events := nil;

  zxdg_exported_v2_interface.name := 'zxdg_exported_v2';
  zxdg_exported_v2_interface.version := 1;
  zxdg_exported_v2_interface.method_count := 1;
  zxdg_exported_v2_interface.methods := @zxdg_exported_v2_requests;
  zxdg_exported_v2_interface.event_count := 1;
  zxdg_exported_v2_interface.events := @zxdg_exported_v2_events;

  zxdg_imported_v2_interface.name := 'zxdg_imported_v2';
  zxdg_imported_v2_interface.version := 1;
  zxdg_imported_v2_interface.method_count := 2;
  zxdg_imported_v2_interface.methods := @zxdg_imported_v2_requests;
  zxdg_imported_v2_interface.event_count := 1;
  zxdg_imported_v2_interface.events := @zxdg_imported_v2_events;

end.
