pragma solidity ^0.4.25;
contract Test { 
    function test() public pure returns (uint256, uint256, uint256) {
        uint256 initial = 258;
        
        return (initial % 10, initial % 100 / 10, initial % 1000 / 100);
    }
}
