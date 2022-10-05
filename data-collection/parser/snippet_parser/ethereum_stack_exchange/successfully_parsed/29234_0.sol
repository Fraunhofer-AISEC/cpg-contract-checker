pragma solidity ^0.4.15;


contract WithdrawalContract {

    address public richest;
    address public owner;
    uint public mostSent;

    modifier onlyOwner() {
        require (msg.sender != owner);
        _;

    }

    mapping (address => uint) pendingWithdraws;

    function WithdrawalContract () payable {
        richest = msg.sender;
        mostSent = msg.value;
        owner = msg.sender;
    }

    function becomeRichest() payable returns (bool){
        require(msg.value > mostSent);
        pendingWithdraws[richest] += msg.value;
        richest = msg.sender;
        mostSent = msg.value;
        return true;
    }

    function withdraw(uint amount) onlyOwner returns(bool) {
        
        
        
        require(amount < this.balance);
        owner.transfer(amount);
        return true;

    }

    function getBalanceContract() constant returns(uint){
        return this.balance;
    }

}
