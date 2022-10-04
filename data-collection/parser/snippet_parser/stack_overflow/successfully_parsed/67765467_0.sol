pragma solidity ^0.8;

contract MyContract {
    struct Batch{
        address payable owner;
        address payable[] precedentsOwners;
        uint[] precedentsBatches;
    }
    
    Batch public myBatch;
    
    function appendToOwners(address _newOwner) external {
        myBatch.precedentsOwners.push(payable(_newOwner));
    }
}
