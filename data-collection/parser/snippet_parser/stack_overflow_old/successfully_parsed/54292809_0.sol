pragma solidity ^0.5.0;

contract Funds {
    uint public maximumValue = 100;
    uint public currentValue = 0;

    
    function addFunds (uint _amount) public payable {
        
        require(msg.value / 1000000000000000000 == _amount);
        
        if (currentValue + _amount > maximumValue){
            uint excess = currentValue + _amount - maximumValue;
            currentValue = maximumValue;
            msg.sender.transfer(excess);
        } else {
            currentValue += _amount;
        }
    }
}
