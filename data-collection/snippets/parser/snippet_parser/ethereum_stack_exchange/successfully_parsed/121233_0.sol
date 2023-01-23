pragma solidity ^0.8.10;
    
    contract  variableshadowing {
        address owner;
        function self_delete() public returns(address) {
            require(owner == msg.sender);
            selfdestruct(owner);
        }
    
    }
    
    contract child is variableshadowing {
        address owner;
        function shadow(){
            owner = msg.sender;
        }
    }
