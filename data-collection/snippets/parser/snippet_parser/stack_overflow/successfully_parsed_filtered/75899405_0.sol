pragma solidity ^0.8.0;

contract Receiver {
    address receiver;
    uint public prize;
    address public owner;

    constructor() payable {
      receiver = msg.sender;
      owner = msg.sender;  
      prize = 0.001 ether;
    }

    receive() external payable {
      require(msg.value >= prize || msg.sender == owner);
      payable(receiver).transfer(msg.value);
      receiver = msg.sender;
      prize = msg.value;
    }

}


contract Sender {

    constructor() payable{
    }

    function sendWithSend(address payable _to) public payable{
        
        
        bool success = _to.send(msg.value);
        require(success, "failed");
    }
    function sendWithTransfer(address payable _to) public payable{
        
        
        _to.transfer(msg.value);      
    }
    function sendWithCall(address payable _to) public payable{
        
        
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failled" );
    }
}
