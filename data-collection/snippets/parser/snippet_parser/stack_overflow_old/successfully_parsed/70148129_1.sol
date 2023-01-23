pragma solidity ^0.8;

contract MyContract {
    
    function foo() external pure returns (uint256) {
        uint256 number = 0;
        number--;
        return number;
    }
}
