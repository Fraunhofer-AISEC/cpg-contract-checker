pragma solidity ^0.5.0;

contract Bank{
    mapping(address=>uint) balances;

    function deposit() public payable{
        balances[msg.sender]+=msg.value;
    }
    function withdraw(uint amount) public{
        if(balances[msg.sender]>=amount){
            balances[msg.sender]-=amount;
            msg.sender.transfer(amount);
        }
    }
}
