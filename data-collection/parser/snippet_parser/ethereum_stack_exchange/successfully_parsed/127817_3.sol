
pragma solidity ^0.8.0;

contract Crowdfund {
    uint fundLimit = 3 ether;
    bool contractOpen = true;

   uint public balance = 0;

    function donate() external payable { 
        require(contractOpen, "Contract has stopped recieving funds");
        balance += msg.value;
        require(balance <= fundLimit, "Too much!!");
    }
}
