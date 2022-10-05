pragma solidity 0.4.19;

contract Recorder{
  event Record(
    address _from,
    string _message,
    uint _cash
  );

  function record(string message) public payable {
    Record(msg.sender,message,msg.value);
  }

  function () public payable {} 
}
