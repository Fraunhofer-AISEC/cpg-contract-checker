pragma solidity ^0.4.0;

contract accountList {

    address[] allowedClient;

    function add(address client) returns (bool) {
        allowedClient.push(client);
        return true;
    }

    function get() constant returns (address[]) {
        return allowedClient;
    }

}
