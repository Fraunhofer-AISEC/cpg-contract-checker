pragma solidity ^0.4.11;

contract Logs {

  struct Log {
    string user;
    uint deviceId;
    uint time;
  }

  Log[] logsList;
  address contractOwner;
  function Logs(){
      contractOwner = msg.sender;
  }
  function writeLog(string _user, uint _deviceId) onlyContractOwner external {
    logsList.push(Log(_user, _deviceId, now));
  }
  modifier onlyContractOwner() {
    require(msg.sender == contractOwner);
    _;
  }
}
