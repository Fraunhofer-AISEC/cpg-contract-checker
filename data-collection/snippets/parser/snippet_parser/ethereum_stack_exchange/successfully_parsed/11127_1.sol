pragma solidity ^0.4.6;

contract Practice {

    function refillAccount(address receiver) payable returns(bool isRefilled) {

        if(msg.value != 1 ether) throw; 
        
        if(!receiver.send(msg.value)) {
            throw; 
        }
        
        return true;
    }
}
