unit Unit1;

interface

uses System.Rtti;

type MyAttribute = class(TCustomAttribute)

  public
    constructor Create;
    destructor Destroy; override;
end;

type TBlabla = class
  FTest : Integer;

  [My] property Test : Integer read FTest;
end;

procedure Foo(); stdcall;


implementation

procedure Foo(); stdcall;
var
  ctx       : TRttiContext;
  lType     : TRttiType;
  lAttribute: TCustomAttribute;
  lProperty : TRttiProperty;
begin
  Writeln('TRttiContext.Create');

  ctx       := TRttiContext.Create;
  lType     := ctx.GetType(TBlabla);
  for lProperty in lType.GetProperties do begin
    for lAttribute in lProperty.GetAttributes do begin
      Writeln('Attribute found: ' + lAttribute.ToString);
    end;
  end;

  Writeln('TRttiContext.Free');
  ctx.Free();
end;

{ MyAttribute }

constructor MyAttribute.Create;
begin
  inherited;

  WriteLn('MyAttribute.Create');
end;

destructor MyAttribute.Destroy;
begin

  WriteLn('MyAttribute.Destroy');

  inherited;
end;


initialization

  WriteLn('Unit1.initialization');

finalization

  WriteLn('Unit1.finalization');


end.
