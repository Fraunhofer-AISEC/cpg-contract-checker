pragma solidity ^0.4.15;

contract HelpLogs {

  event LogFirstHalf(bytes _data);
  event LogSecondHalf(bytes _data);

  function logit(bytes dataPart1, bytes dataPart2) external {
    LogFirstHalf(dataPart1);
    LogSecondHalf(dataPart2);
  }
}
