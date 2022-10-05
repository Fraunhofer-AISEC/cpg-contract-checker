
pragma solidity ^0.8;

contract Fibonacci {

    function fibonacci(uint256 n) public pure returns (uint256[] memory) {
        require(n > 1, "n must be > 1");

        uint256[] memory sequence = new uint256[](n + 1);

        
        sequence[0] = 0;

        
        sequence[1] = 1;

        
        for (uint256 i = 2; i < sequence.length; i++) {
            sequence[i] = sequence[i - 1] + sequence[i - 2];
        }

        return sequence;
    }
}
