unit xdg_foreign_unstable_v2_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_exporter_v2 = Pointer;
  Pxdg_importer_v2 = Pointer;
  Pxdg_exported_v2 = Pointer;
  Pxdg_imported_v2 = Pointer;
const
  XDG_EXPORTER_V2_ERROR_INVALID_SURFACE = 0; // surface is not an xdg_toplevel

type
  Pxdg_exporter_v2_listener = ^Txdg_exporter_v2_listener;
  Txdg_exporter_v2_listener = record
  end;

  Pxdg_importer_v2_listener = ^Txdg_importer_v2_listener;
  Txdg_importer_v2_listener = record
  end;

  Pxdg_exported_v2_listener = ^Txdg_exported_v2_listener;
  Txdg_exported_v2_listener = record
    handle : procedure(data: Pointer; AXdgExportedV2: Pxdg_exported_v2; AHandle: Pchar); cdecl;
  end;

const
  XDG_IMPORTED_V2_ERROR_INVALID_SURFACE = 0; // surface is not an xdg_toplevel

type
  Pxdg_imported_v2_listener = ^Txdg_imported_v2_listener;
  Txdg_imported_v2_listener = record
    destroyed : procedure(data: Pointer; AXdgImportedV2: Pxdg_imported_v2); cdecl;
  end;



  TXdgExporterV2 = class;
  TXdgImporterV2 = class;
  TXdgExportedV2 = class;
  TXdgImportedV2 = class;


  IXdgExporterV2Listener = interface
  ['IXdgExporterV2Listener']
  end;

  IXdgImporterV2Listener = interface
  ['IXdgImporterV2Listener']
  end;

  IXdgExportedV2Listener = interface
  ['IXdgExportedV2Listener']
    procedure xdg_exported_v2_handle(AXdgExportedV2: TXdgExportedV2; AHandle: String);
  end;

  IXdgImportedV2Listener = interface
  ['IXdgImportedV2Listener']
    procedure xdg_imported_v2_destroyed(AXdgImportedV2: TXdgImportedV2);
  end;




  TXdgExporterV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _EXPORT_TOPLEVEL = 1;
  public
    destructor Destroy; override;
    function ExportToplevel(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgExportedV2}): TXdgExportedV2;
    function AddListener(AIntf: IXdgExporterV2Listener): LongInt;
  end;

  TXdgImporterV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _IMPORT_TOPLEVEL = 1;
  public
    destructor Destroy; override;
    function ImportToplevel(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TXdgImportedV2}): TXdgImportedV2;
    function AddListener(AIntf: IXdgImporterV2Listener): LongInt;
  end;

  TXdgExportedV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IXdgExportedV2Listener): LongInt;
  end;

  TXdgImportedV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_PARENT_OF = 1;
  public
    destructor Destroy; override;
    procedure SetParentOf(ASurface: TWlSurface);
    function AddListener(AIntf: IXdgImportedV2Listener): LongInt;
  end;






var
  xdg_exporter_v2_interface: Twl_interface;
  XDG_EXPORTER_V2_INTERFACE_NAME: String = 'zxdg_exporter_v2';
  xdg_importer_v2_interface: Twl_interface;
  XDG_IMPORTER_V2_INTERFACE_NAME: String = 'zxdg_importer_v2';
  xdg_exported_v2_interface: Twl_interface;
  XDG_EXPORTED_V2_INTERFACE_NAME: String = 'zxdg_exported_v2';
  xdg_imported_v2_interface: Twl_interface;
  XDG_IMPORTED_V2_INTERFACE_NAME: String = 'zxdg_imported_v2';



implementation

var
  vIntf_xdg_exporter_v2_Listener: Txdg_exporter_v2_listener;
  vIntf_xdg_importer_v2_Listener: Txdg_importer_v2_listener;
  vIntf_xdg_exported_v2_Listener: Txdg_exported_v2_listener;
  vIntf_xdg_imported_v2_Listener: Txdg_imported_v2_listener;



destructor TXdgExporterV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgExporterV2.ExportToplevel(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgExportedV2}): TXdgExportedV2;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _EXPORT_TOPLEVEL, @xdg_exported_v2_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgExportedV2;
  Result := TXdgExportedV2(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgExportedV2) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgExportedV2]);
end;

function TXdgExporterV2.AddListener(AIntf: IXdgExporterV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_exporter_v2_Listener, @FUserDataRec);
end;
destructor TXdgImporterV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgImporterV2.ImportToplevel(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TXdgImportedV2}): TXdgImportedV2;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _IMPORT_TOPLEVEL, @xdg_imported_v2_interface, nil, PChar(AHandle));
  if AProxyClass = nil then
    AProxyClass := TXdgImportedV2;
  Result := TXdgImportedV2(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgImportedV2) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgImportedV2]);
end;

function TXdgImporterV2.AddListener(AIntf: IXdgImporterV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_importer_v2_Listener, @FUserDataRec);
end;
destructor TXdgExportedV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgExportedV2.AddListener(AIntf: IXdgExportedV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_exported_v2_Listener, @FUserDataRec);
end;
destructor TXdgImportedV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgImportedV2.SetParentOf(ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT_OF, ASurface.Proxy);
end;

function TXdgImportedV2.AddListener(AIntf: IXdgImportedV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_imported_v2_Listener, @FUserDataRec);
end;




procedure xdg_exported_v2_handle_Intf(AData: PWLUserData; Axdg_exported_v2: Pxdg_exported_v2; AHandle: Pchar); cdecl;
var
  AIntf: IXdgExportedV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgExportedV2Listener(AData^.ListenerUserData);
  AIntf.xdg_exported_v2_handle(TXdgExportedV2(AData^.PascalObject), AHandle);
end;

procedure xdg_imported_v2_destroyed_Intf(AData: PWLUserData; Axdg_imported_v2: Pxdg_imported_v2); cdecl;
var
  AIntf: IXdgImportedV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgImportedV2Listener(AData^.ListenerUserData);
  AIntf.xdg_imported_v2_destroyed(TXdgImportedV2(AData^.PascalObject));
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
    (@xdg_exported_v2_interface),
    (@wl_surface_interface),
    (@xdg_imported_v2_interface),
    (nil),
    (@wl_surface_interface)
  );

  xdg_exporter_v2_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'export_toplevel'; signature: 'no'; types: @pInterfaces[8])
  );
  xdg_importer_v2_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'import_toplevel'; signature: 'ns'; types: @pInterfaces[10])
  );
  xdg_exported_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  xdg_exported_v2_events: array[0..0] of Twl_message = (
    (name: 'handle'; signature: 's'; types: @pInterfaces[0])
  );
  xdg_imported_v2_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent_of'; signature: 'o'; types: @pInterfaces[12])
  );
  xdg_imported_v2_events: array[0..0] of Twl_message = (
    (name: 'destroyed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_xdg_exported_v2_Listener.handle) := @xdg_exported_v2_handle_Intf;
  Pointer(vIntf_xdg_imported_v2_Listener.destroyed) := @xdg_imported_v2_destroyed_Intf;


  xdg_exporter_v2_interface.name := PChar(XDG_EXPORTER_V2_INTERFACE_NAME);
  xdg_exporter_v2_interface.version := 1;
  xdg_exporter_v2_interface.method_count := 2;
  xdg_exporter_v2_interface.methods := @xdg_exporter_v2_requests;
  xdg_exporter_v2_interface.event_count := 0;
  xdg_exporter_v2_interface.events := nil;

  xdg_importer_v2_interface.name := PChar(XDG_IMPORTER_V2_INTERFACE_NAME);
  xdg_importer_v2_interface.version := 1;
  xdg_importer_v2_interface.method_count := 2;
  xdg_importer_v2_interface.methods := @xdg_importer_v2_requests;
  xdg_importer_v2_interface.event_count := 0;
  xdg_importer_v2_interface.events := nil;

  xdg_exported_v2_interface.name := PChar(XDG_EXPORTED_V2_INTERFACE_NAME);
  xdg_exported_v2_interface.version := 1;
  xdg_exported_v2_interface.method_count := 1;
  xdg_exported_v2_interface.methods := @xdg_exported_v2_requests;
  xdg_exported_v2_interface.event_count := 1;
  xdg_exported_v2_interface.events := @xdg_exported_v2_events;

  xdg_imported_v2_interface.name := PChar(XDG_IMPORTED_V2_INTERFACE_NAME);
  xdg_imported_v2_interface.version := 1;
  xdg_imported_v2_interface.method_count := 2;
  xdg_imported_v2_interface.methods := @xdg_imported_v2_requests;
  xdg_imported_v2_interface.event_count := 1;
  xdg_imported_v2_interface.events := @xdg_imported_v2_events;

end.
