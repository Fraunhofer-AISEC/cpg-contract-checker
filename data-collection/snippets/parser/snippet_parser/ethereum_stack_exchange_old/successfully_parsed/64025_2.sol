
function _doPause() public{
      require(msg.sender == owner);
      isPauseOn = true;
    }



function doChargeCrowdsale() public onlyOwner{
      tokenAvailable = tokenReward.balanceOf(this);
      if(tokenAvailable > 0){
        charged = true;
        emit IsCharged(charged);
      }
    }
