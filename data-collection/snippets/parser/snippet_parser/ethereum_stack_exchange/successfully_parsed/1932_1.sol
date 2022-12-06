function multiplyMemory(FractionUint memory self, FractionUint memory other) {
    self.numerator *= other.numerator;
    self.denominator *= other.denominator;
}
