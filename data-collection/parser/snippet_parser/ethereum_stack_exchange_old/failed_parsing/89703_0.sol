pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

contract Sample {
    struct S {
        uint256 n;
        bytes b;
    }
    function foo(S memory s) external {
        uint256 len;
        assembly {
            len := mload(s.b);
        }
    }
}
