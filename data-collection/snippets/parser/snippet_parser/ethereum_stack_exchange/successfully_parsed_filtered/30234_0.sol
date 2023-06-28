pragma solidity ^0.4.0;

contract TokenSample {
    address creator;
    string tokenName;

    function TokenSample(string _tokenName) public { 
        creator = msg.sender;
        tokenName = _tokenName;
    }

    function setTokenName(string x) {
        tokenName = x;
    }

    function get() constant returns (string) {
        return tokenName;
    }
}
