pragma solidity ^0.4.6;

contract Caller {
    function someUnsafeAction(address addr) public {
        addr.call(bytes4(keccak256("storeValue(uint256)")), 100);
    }
}
