pragma solidity ^0.4.7;

contract EtherBank {

    
    
    
    mapping(address => uint) public accounts;
    

    
    
    
    function EtherBank() {
        accounts[msg.sender] = 1000;
    }
    

    
    
    function getBalance(address addr) constant returns (uint _balance) {
        return accounts[addr];
    }
    
}
