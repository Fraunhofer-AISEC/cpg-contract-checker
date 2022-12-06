function GetCallingAddr() public view returns(address) {
    return msg.sender;
}

function GetPassedAddr(address _addr) public view returns(address) {
    return _addr;
}

function GetAddrZero() public view returns(address) {
    return address(0);
}
