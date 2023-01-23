pragma solidity ^0.6.0;

interface ExternalContract {
    function initialize() external;
}

contract Test {
  ExternalContract c;
  
  constructor(address externalContractAddress) public {
      c = ExternalContract(externalContractAddress);
  }

  function testA() public {
    c.initialize();
  }

  function testB(address externalContractAddress) public {
    ExternalContract(externalContractAddress).initialize();
  }
}
