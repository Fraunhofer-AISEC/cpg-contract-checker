pragma solidity ^0.4.19;

contract SimpleTest {

    string key;

    constructor (string _key) {
        key = _key;
    }

    function getKey() public view returns(string) {
        return key;
    }

}
