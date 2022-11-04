pragma solidity ^0.4.16;

contract SmartContract {
  address owner;
  string state;
  string status;
  function SmartContract() public {
    status = 'Pending';
    owner = msg.sender;
  }

  event update(string _msg, string _state);

  function getState() public constant returns(string) {
    return state;
  }

  function getStatus() public constant returns(string) {
    return status;
  }

  function setState(string _state) public returns(string) {
    state = _state;
    return state;
  }

  function finish() public {
    if (keccak256(state) == keccak256("end")) {
        status = 'Completed';
        update("Completed", state);
        selfdestruct(owner);
    }
  }

  function () public payable {

  }
}
