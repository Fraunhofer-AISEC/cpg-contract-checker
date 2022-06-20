 modifier upTo30Seconds
    {
        if( now-timeOfContractCreation > 30)
        {
            if(isContractPayed && buyerSign == false)
            {
                emit  notifyCancelOffer(address(this), buyerAddress , oldOwnerAddress); 
                selfdestruct(buyerAddress); 

            }
        }
        _;
    } 
    

    
