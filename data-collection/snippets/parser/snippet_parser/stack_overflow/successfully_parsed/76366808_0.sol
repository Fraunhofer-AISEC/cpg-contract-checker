function delegateCall1(address token, bytes memory _data) public {
        (bool success, bytes memory data) = token.delegatecall(_data);
    }

function delegateCall2(address token, address _to, uint256 _value) public {
    token.delegatecall(abi.encodeWithSignature("transfer(address,uint)", _to, _value));
}`
