
function buy() public payable {
    
    require(msg.value > 0);
    
    require(msg.value >= tokenPriceInWei);

    

    
    uint numToDistribute = msg.value / tokenPriceInWei;
    
    uint refundableRemainderInWei = msg.value - (toWei(numToDistribute));

    
    distribute(msg.sender, numToDistribute);
    
    msg.sender.transfer(refundableRemainderInWei);

    Bought(msg.sender, numToDistribute);
}


function distribute(address _receiver, uint _amount) private {
    
    require(_amount > 0);
    
    require(balances[_receiver] + _amount > balances[_receiver]);

    
    balances[distributor] -= _amount;
    balances[_receiver] += _amount;
}
