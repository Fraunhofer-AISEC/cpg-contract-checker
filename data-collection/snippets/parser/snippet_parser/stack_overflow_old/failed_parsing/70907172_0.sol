function placeBid() public payable notOwner afterStart beforeEnd returns(bool){
               
                require(auctionState == State.Running);
                uint currentBid = 0;
                if(totalBidder>0)
                {
                   currentBid =  bids[msg.sender] + msg.value;
                   require(currentBid > highestBindingBid);
                   
                }
                else{
      require(msg.value > startBid && msg.value > highestBindingBid);
                      currentBid =  msg.value;
                     
                }
                
          
               bids[msg.sender] = currentBid;
        
               for(uint i=0; i<bidders.length; i++){
                   if(msg.sender!=bidders[i]) 

                   bidders.push(payable(msg.sender));
                   totalBidder++;
                   }
                }
               
                highestBindingBid = currentBid;
                highestBidder = payable(msg.sender);
        
            return true;
            }
