
pragma solidity ^0.8.16;

contract Fibonacci {

    uint256 public input;
    uint256 public result;

    fallback(bytes calldata _input) external returns(bytes memory output) {

        (uint256 n) = abi.decode(_input, (uint256));

        uint256 v1 = 0;
        uint256 v2 = 1;
        for (uint256 i = 0; i < n - 1; i++) {
            v2 = v1 + v2;
            v1 = v2 - v1;
        }

        input = n; 
        result = v2; 

        
        return abi.encode(v2);

    }

}
