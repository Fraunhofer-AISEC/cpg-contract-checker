pragma solidity ^0.4.22;
contract Testing {
    string name;
    function setName(string name) public returns(string) {
        name =name;
        return name;
    }

    function getName() public returns(string) {
        return name;
    }
}
