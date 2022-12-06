pragma solidity >=0.7.0 <0.9.0;


contract HelloWorld {
    string public message = "Hello World";
    uint public counter = 0;
    
    function setMessage(string calldata _newMessage) public {
        message = _newMessage;
    }
    
    function incrementCounter() public {
        counter++;
    }
}
