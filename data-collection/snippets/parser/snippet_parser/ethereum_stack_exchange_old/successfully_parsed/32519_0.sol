pragma solidity ^0.4.17;

contract Root {
    string rootHash;

    function set(string x) public {
        rootHash = x;
    }

    function get() public constant returns (string x) {
        return rootHash;
    }

}
