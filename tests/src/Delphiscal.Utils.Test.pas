unit Delphiscal.Utils.Test;

interface

uses
  DUnitX.TestFramework,
  Delphiscal.Utils,
  System.SysUtils;

type
  [TestFixture]
  TDelphiscalUtilsTest = class
  public
    [Test]
    procedure TestRoundABNT_RoundDown;
    [Test]
    procedure TestRoundABNT_RoundUp;
    [Test]
    procedure TestRoundABNT_HalfToEven;
    [Test]
    procedure TestRoundABNT_HalfToOdd;
    [Test]
    procedure TestRoundABNT_NegativeValue;
    [Test]
    procedure TestRoundABNT_FromIssue;

  end;

implementation

procedure TDelphiscalUtilsTest.TestRoundABNT_RoundDown;
begin
  Assert.AreEqual<Double>(12.34, RoundABNT(12.344, 2));
end;

procedure TDelphiscalUtilsTest.TestRoundABNT_RoundUp;
begin
  Assert.AreEqual<Double>(12.35, RoundABNT(12.346, 2));
end;

procedure TDelphiscalUtilsTest.TestRoundABNT_HalfToEven;
begin
  // Rounds to the nearest even number
  Assert.AreEqual<Double>(12.34, RoundABNT(12.345, 2));
end;

procedure TDelphiscalUtilsTest.TestRoundABNT_HalfToOdd;
begin
  // Rounds to the nearest even number (which is up in this case)
  Assert.AreEqual<Double>(12.36, RoundABNT(12.355, 2));
end;

procedure TDelphiscalUtilsTest.TestRoundABNT_NegativeValue;
begin
  Assert.AreEqual<Double>(-12.34, RoundABNT(-12.345, 2));
end;

procedure TDelphiscalUtilsTest.TestRoundABNT_FromIssue;
begin
  Assert.AreEqual<Double>(120.15, RoundABNT(120.15, 2));
  Assert.AreEqual<Double>(148.5, RoundABNT(148.5, 2));
end;

end.
