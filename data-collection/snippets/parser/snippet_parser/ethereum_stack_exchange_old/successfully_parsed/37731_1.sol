pragma solidity ^0.4.19;

contract TipJar {

    address owner;    

    function TipJar() public {  
        owner = msg.sender;
    }

    function withdraw() public {
        require(owner == msg.sender);
        msg.sender.transfer(this.balance);
    }

    
}
