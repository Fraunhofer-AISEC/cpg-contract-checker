    function checkDepositData(address _user) public view returns(uint, uint, uint){
    uint sum=0;
    uint i;
    uint start;
    uint end;
    
    
    for(i=0;i<lockData[_user].length; i++){
        if(lockData[_user][i]._releaseTime < block.timestamp && lockData[_user][i]._amount>0) {
            start=i;
            break;
        }
        else{
            i++;
            if(lockData[_user][i]._releaseTime < block.timestamp && lockData[_user][i]._amount>0 && lockData[_user][i-1]._amount==0){
                start=i;
                break;
            }
        }
    }
    
    
    for(i=start;i<lockData[_user].length; i++){
        if(lockData[_user][i]._releaseTime < block.timestamp){
            sum+=lockData[_user][i]._amount;
            end=i;
        }
    }
    return (sum, start, end);
}
    

function enterLOCK(uint256 _amount,uint _releaseTime, uint _start) public {
    require((lockData[msg.sender].length - _start) <200, "Number of active depositions exceeded");
    
    uint releaseTime = (_releaseTime * 1 days) + block.timestamp;
    uint256 totalToken= token.balanceOf(address(this));
    uint256 totalShares = totalSupply();
    lockData[msg.sender].push(TimeLock(_amount, releaseTime));
    if (totalShares == 0 || totalToken== 0) {
        _mint(msg.sender, _amount);
    } else {
        uint256 what = _amount.mul(totalShares).div(totalToken);
        _mint(msg.sender, what);
    }
    token.transferFrom(msg.sender, address(this), _amount);
}

function leavelock(uint256 _share) public {
    uint256 totalShares = totalSupply();
    uint256 what = _share.mul(token.balanceOf(address(this))).div(totalShares);
    
    uint claimableAmt;
    uint claimableIndexStart;
    uint claimableIndexEnd;
    (claimableAmt, claimableIndexStart, claimableIndexEnd)= checkDepositData(msg.sender);
    require(claimableAmt< _share, "Cannot claim more than unlocked amount");
    uint i;
    uint withdrawalAmt= _share;
    for(i=claimableIndexStart; i<= claimableIndexEnd;i++){
        
        if(lockData[msg.sender][i]._amount > withdrawalAmt){
            lockData[msg.sender][i]._amount-= withdrawalAmt;
            break;
        }else{
            withdrawalAmt-= lockData[msg.sender][i]._amount;
            delete lockData[msg.sender][i]; 
        }
    }
    
    _burn(msg.sender, _share);
    token.transfer(msg.sender, what);

}
