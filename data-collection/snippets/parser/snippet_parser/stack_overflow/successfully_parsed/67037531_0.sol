pragma solidity ^0.8.0;

interface ExternalContract {
    function isContract() external returns (bool);
}

contract MyContract {
    function foo() external {
        ExternalContract to = ExternalContract(address(0x123));
        bool returnedValue = to.isContract(); 
    }
}
