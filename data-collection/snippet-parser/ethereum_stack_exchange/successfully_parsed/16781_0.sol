pragma solidity ^0.4.11;

contract returnbalance{
    function returnsenderbalance() constant returns (uint){
        return msg.sender.balance;  
    }
}
