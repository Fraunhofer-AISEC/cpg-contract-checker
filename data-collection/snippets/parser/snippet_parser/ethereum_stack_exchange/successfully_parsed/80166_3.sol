bytes4 methodSig = 0xbeabacc8;
address addressOne = address(0);
address addressTwo = address(1);
uint256 uintOne = 2;
abi.encodeWithSelector(
    methodSig,   
    addressOne,
    addressTwo,
    uintOne
);
