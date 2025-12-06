unit Delphiscal.Pis03.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Pis03.Intf,
  Delphiscal.Pis03,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalPis03Test = class
  private
    FPis: IPis03;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestValorPis_UsandoNew;
    [Test]
    procedure TestValorPis_UsandoChaining;
  end;

implementation

procedure TDelphiscalPis03Test.Setup;
begin
  FPis := nil;
end;

procedure TDelphiscalPis03Test.TearDown;
begin
  FPis := nil;
end;

procedure TDelphiscalPis03Test.TestValorPis_UsandoNew;
var
  LValorPis: Double;
begin
  // Arrange
  FPis := TPis03.New(10, 2.50);

  // Act
  LValorPis := FPis.ValorPis;

  // Assert
  Assert.AreEqual<Double>(25.00, LValorPis, 'O valor do PIS deve ser R$ 25,00');
end;

procedure TDelphiscalPis03Test.TestValorPis_UsandoChaining;
var
  LValorPis: Double;
begin
  // Arrange
  FPis := TPis03.New;
  FPis.QuantidadeTributada(15)
      .ValorPorUnidadeTributada(3);

  // Act
  LValorPis := FPis.ValorPis;

  // Assert
  Assert.AreEqual<Double>(45.00, LValorPis, 'O valor do PIS deve ser R$ 45,00');
end;

end.
