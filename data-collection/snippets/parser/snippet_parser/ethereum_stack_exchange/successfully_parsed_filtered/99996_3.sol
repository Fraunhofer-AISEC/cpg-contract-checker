function _make_payable(address x) internal pure returns (address payable) {
        return payable(address(uint160(x)));
    }

    function buyStar(uint256 _tokenId) public payable {
        require(starsForSale[_tokenId] > 0, "The star must be available for sale!"); 
        uint256 starPrice = starsForSale[_tokenId]; 
        address starOwner = ownerOf(_tokenId); 
        require(msg.value >= starPrice, "You need to have sufficient funds!"); 
        _transfer(starOwner, msg.sender, _tokenId);
        address payable starOwnerAddressPayable = _make_payable(starOwner);
        address payable newOwnerAddressPayable = _make_payable(msg.sender);
        starOwnerAddressPayable.transfer(starPrice);
        if(msg.value > starPrice) {
            newOwnerAddressPayable.transfer(msg.value - starPrice);
        }
    }
