        function buy(uint256 _tokenId) external payable {
        require(msg.value == 1, 'Incorrect value');
        _transfer(ownerOf(_tokenId), msg.sender, _tokenId);
        payable(ownerOf(_tokenId)).transfer(msg.value); 
    }
