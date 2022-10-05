function transfer(address _to, uint256 _value) public returns (bool success) {
    ...
}

function transferMulti(address[] _to, uint256[] _value) public returns (bool success) {

    require(_to.length == _value.length, "_to.length == _value.length");

    for(uint i=0; i<_to.length; i++) {
        address(this).delegatecall(abi.encodeWithSignature("transfer(address,uint256)", _to[i], _value[i]));
    }

    return true;
}
