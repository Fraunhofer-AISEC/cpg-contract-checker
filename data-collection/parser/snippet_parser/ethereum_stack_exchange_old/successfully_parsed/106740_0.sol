function tryAbiEncode (address  _address, uint8 _amount) public pure returns (bytes memory)
{
    return abi.encode("\x19Ethereum Signed Message:\n",_address, _amount);
}
