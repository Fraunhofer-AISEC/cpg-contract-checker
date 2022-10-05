pragma solidity ^0.8.0;

contract MyContract {
    function foo() external {
        address to = address(0x123);
        bool returnedValue = isContract(to); 
    }
    
    function isContract(address to) internal returns (bool) {
        return true;
    }
}
