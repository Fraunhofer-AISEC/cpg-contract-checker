pragma solidity ^0.4.0;

contract payontime{
  address public remitter;
  address private remittee;
  uint value;
  bool public start;

  
  modifier onlyOwner(){
    if(msg.sender != remitter) throw;
    _;
  }

  
  function payontime(address receiver) payable{
    remitter = msg.sender;
    value = msg.value;
    remittee = receiver;
    start = true;
    if(!remittee.send(value)){
        throw;
    }
  }

  function wakeUp() public returns (string){
    return "success" ; 
  }

  function getContractAddr() public returns(address){
    return this;
  }

  
  function getRemitee() public returns(address){
    return remittee;
  }
}
