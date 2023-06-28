pragma solidity ^0.4.19;

contract TestContract {
    function TestContract() public {}

    function test(uint256 iterations) public pure returns(uint) {
        int256[] memory a = new int256[](1000);

        for (uint32 i = 0; i < iterations; ++i) {
            a[i] = i;
        }
        return a.length;
    }
}
