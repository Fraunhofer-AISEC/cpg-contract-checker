pragma solidity >=0.4.22 <0.6.0;

contract Ballot {
    function concatenate(bytes32 x, bytes32 y) public pure returns (bytes memory) {
        return abi.encodePacked(x, y);
    }
}
