function tokensReceived(address _operator, address _from, address _to, uint256 _amount, bytes _data, bytes _operatorData) external {
    uint arg1;
    uint arg2;
    uint arg3;
    uint arg4;
    uint arg5;
    uint arg6;
    uint arg7;
    uint arg8;
    uint arg9;
    uint arg10;
    uint arg11;
    uint arg12;
    uint arg13;
    uint arg14;

    bytes memory tmp = _data;
    assembly {
        arg1  := mload(add(0x020, tmp))
        arg2  := mload(add(0x040, tmp))
        arg3  := mload(add(0x060, tmp))
        arg4  := mload(add(0x080, tmp))
        arg5  := mload(add(0x0A0, tmp))
        arg6  := mload(add(0x0C0, tmp))
        arg7  := mload(add(0x0E0, tmp))
        arg8  := mload(add(0x100, tmp))
        arg9  := mload(add(0x120, tmp))
        arg10 := mload(add(0x140, tmp))
        arg11 := mload(add(0x160, tmp))
        arg12 := mload(add(0x180, tmp))
        arg13 := mload(add(0x1A0, tmp))
        arg14 := mload(add(0x1C0, tmp))
    }
}
