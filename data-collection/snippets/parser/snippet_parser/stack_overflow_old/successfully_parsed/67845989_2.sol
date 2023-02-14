pragma solidity ^0.8.0;

contract MyContract {
    function foo() external view returns (bytes memory) {
        return abi.encodePacked(this);
    }
    
    function bar() external view returns (address) {
        return address(this);
    }
}
