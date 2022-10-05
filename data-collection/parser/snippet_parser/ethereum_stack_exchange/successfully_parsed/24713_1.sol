pragma solidity ^0.4.11;



contract Service{
  function isAlive() constant returns(bool alive) {} 
}

contract Client {
  Service _s; 

  function Client(address serviceAddress) {
    _s = Service(serviceAddress); 
  }

  function Ping() public constant returns(bool response) {
    return _s.isAlive(); 
  }
}
