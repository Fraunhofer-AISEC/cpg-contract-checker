pragma solidity ^0.4.19;

contract Test {
    mapping(address => bool) isSomebody;

    function addSomebody(address _address) public {
        isSomebody[_address] = true;
    }

    function deleteSomebody(address _address) public {
        delete isSomebody[_address];
    }
}
