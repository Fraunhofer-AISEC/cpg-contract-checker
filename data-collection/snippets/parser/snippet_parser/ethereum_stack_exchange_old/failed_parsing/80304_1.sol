pragma solidity ^0.5.1;

contract Greeter {
    
    struct GreetingMessage {
        string message;
        address owner;
    } 
    
    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can execute this command!");
        _; 
    }  
    
    address payable owner;
    GreetingMessage[] greetings;
    uint public repliesCount;
    
    constructor() public {
        owner = msg.sender;
        greetings.push(GreetingMessage("Hello, Ramazan", msg.sender)); 
    }

    
    function receive() external payable {}
    
    function fallback() external payable {}

    function getGreeting(uint idx) public onlyOwner view returns (string memory, address) {
        GreetingMessage storage greeting = greetings[idx];
        return (greeting.message, greeting.owner);
    }
    
    function setGreeting(string memory newGreeting) public {
        repliesCount++;
        greetings.push(GreetingMessage(newGreeting, msg.sender));
    }
    
    function kill() onlyOwner public {
        selfdestruct(owner); 
    }
 
}
