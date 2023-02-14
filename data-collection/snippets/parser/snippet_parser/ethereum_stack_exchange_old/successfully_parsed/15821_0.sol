bytes4 functionSig = bytes4(sha3("myFunc(uint256,address)"));
uint parameter1 = 123;
address parameter2 = 0xdf190dc7190dfba737d7777a163445b7fff16133;

this.call(functionSig, parameter1, parameter2);
