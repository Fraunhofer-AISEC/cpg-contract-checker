pragma solidity ^0.8.17;
contract Greeter {
    string greeting;
    function Greeter(string _greeting) public{
        greeting=_greeting;
    }
    function greet() constant returns (string){
        return greeting;
    }
}
