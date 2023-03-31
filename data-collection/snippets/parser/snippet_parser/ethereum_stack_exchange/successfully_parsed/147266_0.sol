pragma solidity ^0.8.19;

contract Test {
    mapping (address => bool) registered;

    function test(address[] calldata addresses) external {
        uint256 l = addresses.length;
        for (uint256 i; i < l; ) {
            registered[addresses[i]] = true;

            unchecked {
                ++i;
            }
        }
    } 
}
