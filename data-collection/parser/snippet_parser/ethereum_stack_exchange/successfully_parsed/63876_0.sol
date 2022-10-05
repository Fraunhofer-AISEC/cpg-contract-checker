
function bid(uint _itemId, uint _count) public payable{
    
    
    
    
    
    if (tokenDetails[msg.sender].remainingTokens < _count) return; 
    if (_itemId > 2) return;                                       

    
    
    (tokenDetails[msg.sender].remainingTokens - _count);           

    bidders[tokenDetails[msg.sender].personId].remainingTokens= tokenDetails[msg.sender].remainingTokens; 
    Item storage bidItem = items[_itemId]; 
    for(uint i=0; i<_count;i++) { 
        bidItem.itemTokens.push(tokenDetails[msg.sender].personId); 
    }
} 
