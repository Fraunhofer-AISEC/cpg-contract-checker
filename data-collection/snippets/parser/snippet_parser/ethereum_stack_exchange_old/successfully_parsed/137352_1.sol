


function transferTokenToContract(address _NFTAddress, uint256 _NFTTokenID) 
        public
        onlyInitiator
        inTradeState(TradeState.newTradeEscrow) 
    {   
        
        ERC721(_NFTAddress).safeTransferFrom(msg.sender, address(this), _NFTTokenID);
    }
