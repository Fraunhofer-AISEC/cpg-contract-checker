function revealWinners() onlyOwner returns {                       
     for (uint id = 0; id < 3; id++) { 
         Item storage currentItem=items[id]; 
         if (currentItem.itemTokens.length != 0){
             uint randomIndex = (block.number / currentItem.itemTokens.length)% currentItem.itemTokens.length; 
             uint winnerId = currentItem.itemTokens[randomIndex];
             winners[id] = winners[winnerId];               
        }
    }
}
