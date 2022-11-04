
pragma solidity ^0.8.0;


contract Test {
    function starter() public pure returns(string memory, bytes memory) {
        bytes6 _id = '123456';
        bytes memory b = 'The input _id is ______ and it was replaced using assembly';

        assembly {
            mstore(add(b, 49), _id)
        }

        return (string(b), b);
    }
}
