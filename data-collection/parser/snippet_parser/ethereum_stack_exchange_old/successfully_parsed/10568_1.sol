pragma solidity ^0.4.0;

contract accountList {

    address[] allowedClient;        
    address[] test;

    function add(address client) returns (bool) {
        allowedClient.push(client);
        test.push(client);
        return true;
    }

    function get() constant returns (address[]) {
        return allowedClient;
    }

}
