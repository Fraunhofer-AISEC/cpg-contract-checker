pragma solidity ^0.6.0;

contract testContract {
    function stringComparison(string memory _test) public view returns(bool) {
        require(keccak256(bytes(_test)) != keccak256(bytes("null")), "Invalid Name");
    }
}
