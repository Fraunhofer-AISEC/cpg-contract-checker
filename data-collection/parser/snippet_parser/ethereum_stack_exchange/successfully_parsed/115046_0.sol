struct TimeLock{
    uint256 _amount;
    uint256 _releaseTime;
}
uint releaseDuration= 120 * 1 seconds;  
uint resetDuration= 60 * 1 seconds ; 
uint timeStone;
uint penaltyGraceDuration= 120 seconds;
mapping(address => TimeLock[]) public lockData;
function lock(uint256 _amount) public {
    require(_amount>0 , "Less than minimum amount");
    
    TimeLock storage _timeLock;
    uint length= checkLength(msg.sender);
    checkEpoch(); 
    uint penalty; 
    uint totalClaimable;
    uint lockStartIndex;
    uint unlockStartIndex;
    
    (totalClaimable, lockStartIndex, unlockStartIndex, penalty)= userBalanceData(msg.sender);
    require(penalty==0, "Withdraw the amount on penalty");

    
    uint256 totalToken = token.balanceOf(address(this));
    uint256 totalShares = totalSupply();
    if (totalShares == 0 || totalToken == 0) {
        _mint(msg.sender, _amount);
    } else {
        uint256 what = _amount.mul(totalShares).div(totalToken );
        _mint(msg.sender, what);
    }
    token.transferFrom(msg.sender, address(this), _amount);
    
    if(length> 0){
        TimeLock storage currentTimeLock= lockData[msg.sender][length-1];
        
        
        if(currentTimeLock._releaseTime != 0){
            uint epochTimeofLast= currentTimeLock._releaseTime.sub(releaseDuration).sub(resetDuration);
            if(block.timestamp.sub(epochTimeofLast) < resetDuration){
                currentTimeLock._amount=  currentTimeLock._amount.add(_amount);
            }else{
            
            _timeLock._amount= _amount;
            _timeLock._releaseTime= timeStone.add(releaseDuration.add(resetDuration));
            lockData[msg.sender].push(_timeLock);
        }
        }else{
            _timeLock._amount= _amount;
            _timeLock._releaseTime= timeStone.add(releaseDuration.add(resetDuration));
            lockData[msg.sender].push(_timeLock);
        }
    }else{ 
        _timeLock._amount= _amount;
        _timeLock._releaseTime= timeStone.add(releaseDuration.add(resetDuration));
        lockData[msg.sender].push(_timeLock);
    }

}
function userBalanceData(address _account) public view returns(uint, uint, uint, uint){
    uint length= checkLength(_account);
    if(length<=0) return (0,0,0,0);
    uint totalClaimable=0;
    uint i;
    uint unlockStartIndex;   
    uint lockStartIndex; 
    uint penaltyAmount;
    for(i= length; i>0 ; i--){
        if(lockData[_account][i-1]._amount>0 ){ 
            if(block.timestamp > lockData[_account][i-1]._releaseTime){
                totalClaimable = totalClaimable.add(lockData[_account][i-1]._amount);
                unlockStartIndex=i-1;
            }else{
                lockStartIndex= i-1;
            }
        
            if(block.timestamp> lockData[_account][i-1]._releaseTime.add(
                    penaltyGraceDuration)
                ){
                    penaltyAmount= penaltyAmount.add(lockData[_account][i-1]._amount);
                }
        }else{
            break;
        }
    }
    
    if(block.timestamp > lockData[_account][length-1]._releaseTime){
        lockStartIndex= length;
    }

    return (totalClaimable, lockStartIndex, unlockStartIndex, penaltyAmount); 
}
