address B = 0x4a915089aeC328Dac1F0b197Aba7EB8C1853882d;
bytes4 callSig = bytes4(sha3("foo()"));
B.call(callSig);
