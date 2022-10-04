    function createAmp(
        string memory _name,
        uint256 _id,
        uint256 _price,
        uint256 _amount
    ) public payable virtual  returns (uint256) {
    
    
    
    
    
    
        _setDefaultRoyalty(owner, 800);
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        idToAmp[_id].creator = payable(msg.sender);
        idToAmp[_id].name = _name;
        idToAmp[_id].price = _price;
        idToAmp[_id].amount = _amount;
        idToAmp[_id].valid = true;
        
        _mint(msg.sender, _id, _amount, "");

        totalAmp += _amount;

        return newTokenId;

    
    }
