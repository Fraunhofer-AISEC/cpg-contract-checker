pragma solidity ^0.4.0;

contract OwnedContract {

    mapping (address => bool) private _owners;
    address private _masterAdmin;

    modifier isOwner() {
        require(_masterAdmin == msg.sender || _owners[msg.sender]);
        _;
    }

    function OwnedContract() {
       _masterAdmin = msg.sender;
    }

    

}
