function mintNFT(uint256 _numOfTokens, bytes memory _signature) public payable {
    
    (bool success, string memory reason) = canMint(msg.sender, _signature);
    
}
