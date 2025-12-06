unit Delphiscal.Ipi50AdValorem.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Ipi50AdValorem.Intf,
  Delphiscal.Ipi50AdValorem,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalIpi50AdValoremTest = class
  private
    FIpi: IIpi50AdValorem;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FAliquotaIpi: Double;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestValorIpi;
  end;

implementation

procedure TDelphiscalIpi50AdValoremTest.Setup;
begin
  FIpi := nil;
  FValorProduto := 250.00;
  FValorFrete := 25.00;
  FValorSeguro := 10.00;
  FDespesasAcessorias := 5.00;
  FAliquotaIpi := 15.00;
end;

procedure TDelphiscalIpi50AdValoremTest.TearDown;
begin
  FIpi := nil;
end;

procedure TDelphiscalIpi50AdValoremTest.TestValorIpi;
var
  LBaseIpi: Double;
  LValorIpi: Double;
begin
  // Arrange
  FIpi := TIpi50AdValorem.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias, FAliquotaIpi);

  // Act
  LBaseIpi := FIpi.BaseIpi;
  LValorIpi := FIpi.ValorIpi;

  // Assert
  Assert.AreEqual<Double>(290.00, LBaseIpi, 'A base de cálculo do IPI deve ser R$ 290,00');
  Assert.AreEqual<Double>(43.50, LValorIpi, 'O valor do IPI deve ser R$ 43,50');
end;

end.
