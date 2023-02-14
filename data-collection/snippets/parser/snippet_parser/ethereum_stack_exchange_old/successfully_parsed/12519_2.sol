pragma solidity ^0.4.8;

contract HelloSystem {

    address owner;

    
    function HelloSystem(){
        owner = msg.sender;
    }

    function remove() {
        if (msg.sender == owner){
            selfdestruct(owner);
        }
    }
}

contract HelloFactory {
    event CreatedHS(address indexed hsAddr);

    function createHS() returns (address hsAddr) {
        HelloSystem hs = new HelloSystem();
        CreatedHS(hs);
        return hs;
    }

    function deleteHS(address hs){
        HelloSystem(hs).remove();
    }

}
