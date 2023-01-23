pragma solidity ^0.4.15;

contract HelpLogs {

  event LogFirstHalf(bytes _data);
  event LogSecondHalf(bytes _data);

  function logit(bytes data) external {
      uint midpoint = data.length / 2;
      bytes memory data1 = new bytes(midpoint);
      for (uint i = 0; i < midpoint; i++) {
          data1[i] = data[i];
      }
      bytes memory data2 = new bytes(data.length - midpoint);
      for (i = 0; i < data.length - midpoint; i++) {
          data2[i] = data[i + midpoint];
      }
      LogFirstHalf(data1);
      LogSecondHalf(data2);
  }
}
