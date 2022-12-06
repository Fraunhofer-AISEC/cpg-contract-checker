bytes4 selector = bytes4(uint256(keccak256("someFunc(address,uint256,bool)") >> 224));
bytes memory data = abi.encodeWithSelector(selector, someAddress, someUint256, someBool);
