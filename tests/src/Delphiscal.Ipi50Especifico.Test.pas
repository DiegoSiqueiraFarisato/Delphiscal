unit Delphiscal.Ipi50Especifico.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Ipi50Especifico.Intf,
  Delphiscal.Ipi50Especifico,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIpi50EspecificoTest = class
  private
    FIpi: IIpi50Especifico;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestValorIpi_UsandoNew;
    [Test]
    procedure TestValorIpi_UsandoChaining;
  end;

implementation

procedure TDelphiscalIpi50EspecificoTest.Setup;
begin
  FIpi := nil;
end;

procedure TDelphiscalIpi50EspecificoTest.TearDown;
begin
  FIpi := nil;
end;

procedure TDelphiscalIpi50EspecificoTest.TestValorIpi_UsandoNew;
var
  LValorIpi: Double;
begin
  // Arrange
  FIpi := TIpi50Especifico.New(100, 0.50);

  // Act
  LValorIpi := FIpi.ValorIpi;

  // Assert
  Assert.AreEqual<Double>(50.00, LValorIpi, 'O valor do IPI deve ser R$ 50,00');
end;

procedure TDelphiscalIpi50EspecificoTest.TestValorIpi_UsandoChaining;
var
  LValorIpi: Double;
begin
  // Arrange
  FIpi := TIpi50Especifico.New;
  FIpi.QuantidadeTributada(200)
      .ValorPorUnidadeTributada(0.75);

  // Act
  LValorIpi := FIpi.ValorIpi;

  // Assert
  Assert.AreEqual<Double>(150.00, LValorIpi, 'O valor do IPI deve ser R$ 150,00');
end;

end.
