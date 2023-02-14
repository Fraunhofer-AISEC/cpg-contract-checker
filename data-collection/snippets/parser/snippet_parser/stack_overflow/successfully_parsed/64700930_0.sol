pragma solidity ^0.6.0;

contract Test {
    
    function balanceOf(address addr) external view returns (uint) {
        return addr.balance;
    }
    
}
