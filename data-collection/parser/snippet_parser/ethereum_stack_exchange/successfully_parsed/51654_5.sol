function parseMsgData() public view returns (bytes32 _address){
bytes32 _address;

assembly {
        calldatacopy(0x0, 4, 36)
        _address := mload(0x0)
}

return _address;
}
