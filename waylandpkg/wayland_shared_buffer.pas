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

  function Create_shm_pool(shm: Pwl_shm; size: Integer; outdata: PPointer = nil): Pwl_shm_pool;
  function Create_shm_buffer(shm: Pwl_shm; AWidth, AHeight: Integer; AFormat: cuint32; out data: Pointer): Pwl_buffer;





implementation

const
  FD_CLOEXEC = 1;

function mkstemp(filename: PChar):longint;cdecl;external 'libc' name 'mkstemp';
function mkostemp(filename: PChar; flags: cint):longint;cdecl;external 'libc' name 'mkostemp';
function CreateAnonymousFile(ASize: PtrUint): cint; {fd} forward;

function Create_shm_pool(shm: Pwl_shm; size: Integer; outData: PPointer): Pwl_shm_pool;
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

  Result := wl_shm_create_pool(shm, fd, size);
  FpClose(fd);
end;

function Create_shm_buffer(shm: Pwl_shm; AWidth, AHeight: Integer; AFormat: cuint32; out data: Pointer): Pwl_buffer;
var
  pool: Pwl_shm_pool;
  size, stride: cint;
begin
  Result := nil;
  stride := AWidth *4;
  size := stride * Aheight;

  pool := Create_shm_pool(shm, size, @Data);
  Result := wl_shm_pool_create_buffer(pool, 0, AWidth, AHeight, stride, AFormat);
  wl_shm_pool_destroy(pool); // will be destroyed after the buffer is destroyed

end;

const
  O_CLOEXEC = $80000;

function CreateAnonymousFile(ASize: PtrUint): cint; {fd}
var
  lName: String;
  flags: cint;
begin
  lName := GetEnvironmentVariable('XDG_RUNTIME_DIR') + '/weston-shared-XXXXXX';

  {Result := mkstemp(PChar(lName));
  if Result = -1 then
    Exit;
  flags := fpfcntl(Result, F_GETFD);
  fpfcntl(Result, F_SETFD, flags or FD_CLOEXEC);}

  Result := mkostemp(PChar(lName), O_CLOEXEC);
  FpUnlink(lName);

  if (FpFtruncate(Result, ASize) < 0) then
  begin
    FpClose(Result);
    Result := -1;
  end;
end;



end.

