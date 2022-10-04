pragma solidity ^0.8;

contract MyContract {
    function foo() external returns (bytes32) {
        return blockhash(1); 
    }
}
