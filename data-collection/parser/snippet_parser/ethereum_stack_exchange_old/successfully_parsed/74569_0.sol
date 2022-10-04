pragma solidity ^0.5.1;

  function testDivLiteral() external pure returns (uint16) {
    return (1 / 5) * 100;
  }
  

  function testDivCast() external pure returns (uint16) {
    return (uint16(1) / uint16(5)) * uint16(100);
  }
  
