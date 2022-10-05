pragma solidity ^0.5.0;


contract User {
    string private _name;
    string private _publicKey;

    constructor (string memory name, string memory publicKey) public  {
        _name = name;
        _publicKey = publicKey;
    }


    function getName() public view returns(string memory) {
        return _name;
    }

    function getPublicKey() public view returns(string memory) {
        return _publicKey;
    }

}
