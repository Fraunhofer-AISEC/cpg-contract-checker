pragma solidity ^0.4.11;

contract Logs {

  struct Log {
    string user;
    uint deviceId;
    uint time;
  }

  Log[] logsList;

  function writeLog(string _user, uint _deviceId) external {
    logsList.push(Log(_user, _deviceId, now));
  }
}
