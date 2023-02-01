pragma solidity ^0.8.0;

contract Bank{
    
    mapping (address => uint) public balances;
    address public owner;
    constructor() {
        owner=msg.sender;
    }
     function deposit() public payable returns (uint256){
        address user = msg.sender;
        balances[user] += msg.value;
        return balances[user];
     }
     function withdraw(uint withdrawAmount) public returns (uint remainingBal){
        address user = msg.sender;
        require(balances[user] >= withdrawAmount);
        balances[user] -= withdrawAmount;    
        payable(user).transfer(withdrawAmount);
        return balances[user];
     }
}


