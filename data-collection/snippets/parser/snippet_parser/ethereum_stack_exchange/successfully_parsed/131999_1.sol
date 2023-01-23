
pragma solidity ^0.8.12;

contract test {
    function hi(string memory name) pure public returns(string memory){
        string memory greetings = string.concat("Hello", name);
        return greetings;
    }
}

