pragma solidity ^0.7.4;
pragma experimental ABIEncoderV2;

contract Sample {
    
    struct S {
        uint256 n;
        bytes b;
    }
    
    function foo(S memory s) external pure returns (uint256 _x, bytes memory _y) {
        assembly {
            _x := mload(s)
            _y := mload(add(s,0x20))
        }
    }
}
