bytes8 a = 0x0000000000018000;  
bytes8 b = 0x0000000000024000;  
bytes16 a_16 = ABDKMathQuad.fromDouble(a);
bytes16 b_16 = ABDKMathQuad.fromDouble(b);
bytes16 _temp = ABDKMathQuad.mul(a_16, b_16);
bytes8 result = ABDKMathQuad.toDouble(_temp);
