function signatureWallet(address wallet, uint256[] memory _tokensId, uint256 _timestamp, bytes memory _signature) public view returns (address){

return ECDSA.recover(keccak256(abi.encode(wallet, _tokensId, _timestamp)), _signature);
}