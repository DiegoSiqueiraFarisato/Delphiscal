unit Delphiscal.Pis01_02.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Pis01_02.Intf,
  Delphiscal.Pis01_02,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalPis01_02Test = class
  private
    FPis: IPis01_02;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FAliquotaPis: Double;
    FValorPis: Double;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestValorPis;
  end;

implementation

procedure TDelphiscalPis01_02Test.Setup;
begin
  FPis := nil;
  FValorProduto := 100.00;
  FValorFrete := 10.00;
  FValorSeguro := 5.00;
  FDespesasAcessorias := 2.00;
  FValorDesconto := 7.00;
  FAliquotaPis := 1.65;
  FValorPis := 0;
end;

procedure TDelphiscalPis01_02Test.TearDown;
begin
  FPis := nil;
end;

procedure TDelphiscalPis01_02Test.TestValorPis;
var
  LBasePis: Double;
begin
  // Arrange
  FPis := TPis01_02.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias, FValorDesconto, FAliquotaPis);

  // Act
  LBasePis := FPis.BasePis;
  FValorPis := FPis.ValorPis;

  // Assert
  Assert.AreEqual<Double>(110.00, LBasePis, 'A base de cálculo do PIS deve ser R$ 110,00');
  Assert.AreEqual<Double>(1.82, FValorPis, 'O valor do PIS deve ser R$ 1,82');
end;

end.
