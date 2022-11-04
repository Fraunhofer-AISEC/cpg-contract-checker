pragma solidity ^0.5.16;
contract greeter{
    string greeting='Hello';
    
    function setGreeting(string memory _greeting) public returns(bool){
        greeting=_greeting;
        return true;
    }
    function getGreeting() public view returns(string memory) {
        return greeting;
    }
}

