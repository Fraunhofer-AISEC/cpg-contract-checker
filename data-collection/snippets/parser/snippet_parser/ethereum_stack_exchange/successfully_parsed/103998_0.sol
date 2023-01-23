    function payout() public payable {    
        uint ordersLength = orders.length;    
        uint totalRaised = 0;    
        for (uint i = 0; i < ordersLength; i++) {    
            totalRaised += orders[i].amount;    
            emit Amount(orders[i].amount);    
        }    
        for (uint i = 0; i < ordersLength; i++) {    
            payable(orders[i].investor).transfer(msg.value * orders[i].amount / totalRaised);        
            emit onPayout(orders[i].investor, creator, orders[i].investorId, creationId, creatorId, block.timestamp,        
                         msg.value * orders[i].amount / totalRaised);    
        }    
    }    
