unit Delphiscal.Cofins01_02.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Cofins01_02.Intf,
  Delphiscal.Cofins01_02,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalCofins01_02Test = class
  private
    FCofins: ICofins01_02;
    FValorProduto: Double;
    FValorFrete: Double;
    FValorSeguro: Double;
    FDespesasAcessorias: Double;
    FValorDesconto: Double;
    FAliquotaCofins: Double;
    FValorCofins: Double;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestValorCofins;
  end;

implementation

procedure TDelphiscalCofins01_02Test.Setup;
begin
  FCofins := nil;
  FValorProduto := 100.00;
  FValorFrete := 10.00;
  FValorSeguro := 5.00;
  FDespesasAcessorias := 2.00;
  FValorDesconto := 7.00;
  FAliquotaCofins := 7.60;
  FValorCofins := 0;
end;

procedure TDelphiscalCofins01_02Test.TearDown;
begin
  FCofins := nil;
end;

procedure TDelphiscalCofins01_02Test.TestValorCofins;
var
  LBaseCofins: Double;
begin
  // Arrange
  FCofins := TCofins01_02.New(FValorProduto, FValorFrete, FValorSeguro, FDespesasAcessorias, FValorDesconto, FAliquotaCofins);

  // Act
  LBaseCofins := FCofins.BaseCofins;
  FValorCofins := FCofins.ValorCofins;

  // Assert
  Assert.AreEqual<Double>(110.00, LBaseCofins, 'A base de cálculo do COFINS deve ser R$ 110,00');
  Assert.AreEqual<Double>(8.36, FValorCofins, 'O valor do COFINS deve ser R$ 8,36');
end;

end.
