pragma solidity ^0.4.19;

contract EtherTransfer {
    
    function EtherTransfer(address owner) public payable {
        foo(owner);
    }

    function foo(address owner) private {
        
        selfdestruct(owner);
    }
}
