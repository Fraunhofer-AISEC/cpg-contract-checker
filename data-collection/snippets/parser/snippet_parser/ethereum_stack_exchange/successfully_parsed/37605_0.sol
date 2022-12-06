pragma solidity ^0.4.7;

contract MDBService {

    mapping (address => address) accounts;
    mapping (uint => address) ids;
    uint numberAccounts;

    function MDBService() {
        numberAccounts = 0;
    }

    function register() {
        require(accounts[msg.sender] == 0); 
        ids[numberAccounts] = msg.sender;
        accounts[msg.sender] = new MDBAccount(msg.sender);
        numberAccounts++;
    }
}

contract MDBAccount {

    struct Post {
        uint timestamp;
        string message;
    }

    uint public numberPosts;
    address public owner;
    mapping (uint => Post) posts;

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }

    function MDBAccount(address _owner) {
        owner = _owner;
        numberPosts = 0;
    }

    function post(string message) isOwner() {
        require(bytes(message).length <= 160);
        posts[numberPosts].timestamp = now;
        posts[numberPosts].message = message;
        numberPosts++;
    }
}
