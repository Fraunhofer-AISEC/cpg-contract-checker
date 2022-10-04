pragma solidity ^0.5.0;

contract Funds {
    uint public maximumValue = 100 ether;
    uint public currentValue = 0;

    function addFunds() external payable {
        
        if (currentValue + msg.value > maximumValue){
            uint excess = currentValue + msg.value - maximumValue;
            currentValue = maximumValue;
            msg.sender.transfer(excess);
        } else {
            currentValue += msg.value;
        }
    }
}
