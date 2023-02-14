pragma solidity ^0.4.16;

contract EtherBank{
    mapping(address => uint) public userBalances;
    mapping(address => bool) public withdrawMutex;

    function getBalance(address user) constant returns(uint) {  
        return userBalances[user];
    }

    function addToBalance() {  
        userBalances[msg.sender] += msg.value;
    }

    function withdrawBalance() {  
        if ( withdrawMutex[msg.sender] == true) { throw; }
        withdrawMutex[msg.sender] = true;
        uint amountToWithdraw = userBalances[msg.sender];
        if (amountToWithdraw > 0) {
            if (!(msg.sender.send(amountToWithdraw))) { throw; }
         }
        userBalances[msg.sender] = 0;
        withdrawMutex[msg.sender] = false;
    }
}
