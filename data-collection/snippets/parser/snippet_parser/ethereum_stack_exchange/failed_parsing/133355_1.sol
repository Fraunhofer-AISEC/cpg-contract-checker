function testAdd(int256 a1, int256 b1, int256 a2, int256 b2) external {
    Complex memory x = Complex(SInteger.wrap(a1), SInteger.wrap(b1));
    Complex memory y = Complex(SInteger.wrap(a2), SInteger.wrap(b2));

    ...

    
    
     
    Complex calldata actual = x.add(y); 
    Complex calldata expected = Complex(SInteger.wrap(a1).add(SInteger.wrap(a2)), SInteger.wrap(b1).add(SInteger.wrap(b2)));

    assertEq(SInteger.unwrap(actual.a), SInteger.unwrap(expected.a));
    assertEq(SInteger.unwrap(actual.b), SInteger.unwrap(expected.b));
}
