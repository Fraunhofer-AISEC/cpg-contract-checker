
pragma solidity ^0.8.0;

contract test{
    function hi(string memory name) pure public returns(string memory){
        string memory greetings = string.concat("Hello", name);
        return greetings;
    }
}

