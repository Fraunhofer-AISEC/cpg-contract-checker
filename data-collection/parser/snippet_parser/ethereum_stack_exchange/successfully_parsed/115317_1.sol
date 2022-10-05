function buy(uint256 tokenId, address _userAddress) public payable {
        address payable recipient = _userAddress; 
        require(msg.value >= cost, "Insufficient bid.");
        require(msg.sender != address(recipient), "User already owns the NFT");
        require(recipient.send(msg.value)); 
        _safeTransfer(_userAddress, msg.sender, tokenId, ""); 
}
