unit Delphiscal.Cofins03.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Cofins03.Intf,
  Delphiscal.Cofins03,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalCofins03Test = class
  private
    FCofins: ICofins03;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestValorCofins_UsandoNew;
    [Test]
    procedure TestValorCofins_UsandoChaining;
  end;

implementation

procedure TDelphiscalCofins03Test.Setup;
begin
  FCofins := nil;
end;

procedure TDelphiscalCofins03Test.TearDown;
begin
  FCofins := nil;
end;

procedure TDelphiscalCofins03Test.TestValorCofins_UsandoNew;
var
  LValorCofins: Double;
begin
  // Arrange
  FCofins := TCofins03.New(20, 5.50);

  // Act
  LValorCofins := FCofins.ValorCofins;

  // Assert
  Assert.AreEqual<Double>(110.00, LValorCofins, 'O valor do COFINS deve ser R$ 110,00');
end;

procedure TDelphiscalCofins03Test.TestValorCofins_UsandoChaining;
var
  LValorCofins: Double;
begin
  // Arrange
  FCofins := TCofins03.New;
  FCofins.QuantidadeTributada(5)
         .ValorPorUnidadeTributada(10);

  // Act
  LValorCofins := FCofins.ValorCofins;

  // Assert
  Assert.AreEqual<Double>(50.00, LValorCofins, 'O valor do COFINS deve ser R$ 50,00');
end;

end.
