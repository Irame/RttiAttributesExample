program MainApplication;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SimpleShareMem,
  Winapi.Windows,
  System.Rtti,
  System.SysUtils;

type
  TProcedure = procedure;

var lib : THandle;
    fx  : TProcedure;
    ctx : TRttiContext;

begin
  ctx := TRttiContext.Create;

  ctx.GetType(TStringBuilder.ClassInfo);

  Writeln('LoadLibrary');
  lib := LoadLibrary('Project1.dll');


  fx := TProcedure( GetProcAddress(lib, 'FOO') );

  Writeln('Foo');
  fx();

  Writeln('FreeLibrary');
  FreeLibrary(lib);
end.
