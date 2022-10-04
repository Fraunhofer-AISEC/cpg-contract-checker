function addValuesWithDelegateCall(address calculator, uint256 a, uint256 b) public returns (uint256) {
        (bool success, bytes memory result) = calculator.delegatecall(abi.encodeWithSignature("add(uint256,uint256)", a, b));
        emit AddedValuesByDelegateCall(a, b, success);
        return abi.decode(result, (uint256));
    }
    
    function addValuesWithCall(address calculator, uint256 a, uint256 b) public returns (uint256) {
        (bool success, bytes memory result) = calculator.call(abi.encodeWithSignature("add(uint256,uint256)", a, b));
        emit AddedValuesByCall(a, b, success);
        return abi.decode(result, (uint256));
    }
