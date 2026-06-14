unit wayland_shared_buffer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BaseUnix, ctypes, wayland_protocol;

type
  TFPWL_display = class
    Display: Pwl_display;
    Registry: Pwl_registry;
    Compositor: Pwl_compositor;
    Shell: Pwl_shell;
    Shm: Pwl_shm;
  end;

  function Create_shm_pool(shm: TWlShm; size: Integer; outdata: PPointer; outfd: Pcuint): TWlShmPool;
  function Create_shm_buffer(shm: TWlShm; AWidth, AHeight: Integer; AFormat: cuint32; out data: Pointer; out fd: cint): TWlBuffer;





implementation

const
  FD_CLOEXEC = 1;

function mkstemp(filename: PChar):longint;cdecl;external 'libc' name 'mkstemp';
function mkostemp(filename: PChar; flags: cint):longint;cdecl;external 'libc' name 'mkostemp';
function CreateAnonymousFile(ASize: PtrUint): cint; {fd} forward;

function Create_shm_pool(shm: TWlShm; size: Integer; outData: PPointer; outfd: Pcuint): TWlShmPool;
var
  fd: cint;
  data: Pointer;
begin
  Result := nil;
  fd := CreateAnonymousFile(size);
  if fd < 0 then
    Exit;

  data := Fpmmap(nil, size, PROT_READ or PROT_WRITE, MAP_SHARED, fd, 0);
  if Assigned(outData) then
    outData^ := data;;
  if data = MAP_FAILED then
  begin
    fpclose(fd);
    Exit;
  end;

  Result := shm.CreatePool(fd, size);
  if outfd = nil then
    FpClose(fd)
  else
    outfd^ := fd;
end;

function Create_shm_buffer(shm: TWlShm; AWidth, AHeight: Integer; AFormat: cuint32; out data: Pointer; out fd: cint): TWlBuffer;
var
  pool: TWlShmPool;
  size, stride: cint;
begin
  Result := nil;
  stride := AWidth *4;
  size := stride * Aheight;

  pool := Create_shm_pool(shm, size, @Data, @fd);
  Result := pool.CreateBuffer(0, AWidth, AHeight, stride, AFormat);
  pool.Free // proxy will be destroyed after the buffer is destroyed

end;



function CreateAnonymousFile(ASize: PtrUint): cint; {fd}
const
  O_CLOEXEC = $80000;
var
  lName: String;
  flags: cint;
begin
  lName := GetEnvironmentVariable('XDG_RUNTIME_DIR') + '/weston-shared-XXXXXX';

  Result := mkostemp(PChar(lName), O_CLOEXEC);
  FpUnlink(lName);

  if (FpFtruncate(Result, ASize) < 0) then
  begin
    FpClose(Result);
    Result := -1;
  end;
end;



end.

