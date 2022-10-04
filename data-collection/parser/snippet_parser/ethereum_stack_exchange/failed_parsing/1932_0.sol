library Rational
{
    struct FractionUint
    {
        uint numerator;
        uint denominator;
    }

    function multiply(FractionUint storage self, FractionUint storage other)
    {
        self.numerator *= other.numerator;
        self.denominator *= other.denominator;
    }

...
}

contract testRational
{
    using Rational for Rational.FractionUint;
    Rational.FractionUint f1;
    Rational.FractionUint f2;

    function testMultiply()
    {
        f1 = Rational.FractionUint(1,10);
        f2 = FractionUint(100,2);
        f1.multiply(f2);
        if (f1.numerator != 100)
            throw;
        if (f1.denominator != 20)
            throw;
    }

    
}
