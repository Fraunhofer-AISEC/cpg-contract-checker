function testRecovery(
    bytes32 _msgHash, 
    uint8 _v, 
    bytes32 _r,
    bytes32 _s)
    public
    returns (bool)
{
    returned = ecrecover(_msgHash, _v, _r, _s);
    if (returned == expected) {
        return true;
    } else {
        return false;
    }
}
