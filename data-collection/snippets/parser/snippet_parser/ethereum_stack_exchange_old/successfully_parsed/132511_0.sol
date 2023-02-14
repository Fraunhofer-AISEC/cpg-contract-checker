
pragma solidity ^0.8.0;


contract Test {
    function test1() public pure returns(string memory, bytes memory) {
        bytes6 _id = '123456';
        bytes memory b = 'The input _id is ______ and it was replaced using assembly';

        assembly {
            let dst := add(b, 49)
            mstore(dst, or(and(mload(dst), not(shl(208, 0x0000FFFF0000))), _id))
        }

        return (string(b), b);
    }

    function test2() public pure returns(string memory, bytes memory) {
        bytes6 _id = '123456';
        bytes memory b = 'The input _id is ______ and it was replaced using assembly';

        assembly {
            let dst := add(b, 49)
            mstore(dst, or(and(mload(dst), not(shl(224, 0xFFFF))), _id))
        }

        return (string(b), b);
    }
}
