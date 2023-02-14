function calculateHash (address _myAddress, unit8 amount, unit256 nonce) internal pure returns (bytes32) 
{ 
    return keccak256(abi.encode("\x19Ethereum Signed Message:\n32", _myAddress, amount, nonce)); 
}
