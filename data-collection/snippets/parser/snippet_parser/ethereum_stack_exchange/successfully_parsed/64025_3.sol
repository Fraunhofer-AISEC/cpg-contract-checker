uint something = 0; 


function _doPause(uint someUint) public{
      something = someUint;
      require(msg.sender == owner);
      isPauseOn = true;
    }



function doChargeCrowdsale(uint someUint) public onlyOwner{
      something = someUint;
      tokenAvailable = tokenReward.balanceOf(this);
      if(tokenAvailable > 0){
        charged = true;
        emit IsCharged(charged);
      }
    }
