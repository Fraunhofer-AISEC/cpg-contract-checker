function sendEthToTokenOwner(uint256 _tokenId) external payable nonReentrant {
        address _tokenOwner = ownerOf(_tokenId);
        require(msg.sender != _tokenOwner, "Sender can't be owner");

        uint256 _price = tokenIdToPrice[_tokenId];
        require(msg.value == _price, "Please submit the correct amount of ether");


        (bool success, ) = payable(_tokenOwner).call{value: _price}("");
        require(success, "Eth cannot be transferred");
}
