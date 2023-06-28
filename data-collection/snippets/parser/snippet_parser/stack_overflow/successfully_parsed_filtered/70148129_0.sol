pragma solidity ^0.7;

contract MyContract {
    
    function foo() external pure returns (uint256) {
        return uint(-1);
    }
}
