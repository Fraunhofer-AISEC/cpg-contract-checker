function test2(address _addr) public {
    _interAddr = _addr;
}

function test22() public view returns(address) {
    return _interAddr;
}

function test222(address _addr) public view returns(bool) {
    if (_addr == _interAddr){
        return true;
    }
    return false;
}
