function buy(uint256 tokenId) public payable {
        address payable recipient = payable(ownerOf(tokenId)); 
        require(msg.value >= cost, "Insufficient bid.");
        require(msg.sender != address(recipient), "User already owns the NFT");
        require(recipient.send(msg.value)); 
        _safeTransfer(recipient, msg.sender, tokenId, ""); 
}
