function endAuction() onlyOwner public{
        
        require( isOpen, "Auction is not avalible.");
        require(endTime < now, "Auction duration is not up yet.");
        require(highestBidder != address(0), "No bids have been placed"); 
        
        isOpen = false; 
        
        uint halfAmount = highestBid/2;
    
        (auctionOwner).transfer(halfAmount); 

        uint contributionRate =0; 
        uint reward; 
        
        
        for(uint i=0; i < contributors.length; i++){
                uint j;
             for(j=0; j < i; j++)
                  if(contributors[i] == contributors[j])
                      break;
                if(i==j)
                tempArray.push(contributors[i]);
              }
        

        for(uint i=0; i < tempArray.length; i++){
            contribution=0;
             for(uint z=0; z < contributors.length; z++){
                  if(tempArray[i] == contributors[z])
                      contribution++;
             }
             contribution = contribution *100; 
             contributionRate = contribution / (plasticBale.length);
             reward = ((contributionRate * halfAmount)/ 100)+1;
             tempArray[i].transfer(reward); 
             rewardRecycler(tempArray[i], reward); 
    
        }
          
          for(uint i=0; i< plasticBale.length; i++)
          updateBottleStatus(highestBidder, plasticBale[i]); 
          
        emit auctionEnded(address(this), highestBidder, highestBid , now); 
    
    }


modifier onlyOwner{
        require(msg.sender == auctionOwner, "Auction owner is not authorized"); 
        _; 
    }
