pragma solidity 0.4.24;

contract SimpleStorage {
    string firstName;

    function set(string x) public {
        firstName = x;
    }

    function get() public view returns (string) {
        return firstName;
    }
}
