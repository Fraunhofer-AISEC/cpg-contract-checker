function listOwnedItems(address  _ownerOF) external returns (uint256 [] memory items){

        require(msg.sender == _ownerOF || msg.sender == owner() , "Not authorized to query");

        uint balance = balanceOf(_ownerOF);
        
        if(balance > 0)
            for (uint i = 0 ; i < balance ; i++)
                    items[i] = tokenOfOwnerByIndex(_ownerOF, i);
                
        
    }
