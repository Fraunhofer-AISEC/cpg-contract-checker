pragma solidity ^0.4.8;

contract TestContract {
    function TestContract() {
    }

    function test(uint256 iterations) constant {
        int256[] memory a = new int256[](1000);

        for (uint32 i = 0; i < iterations; ++i) {
            a[i] = i;
        }
    }
}
