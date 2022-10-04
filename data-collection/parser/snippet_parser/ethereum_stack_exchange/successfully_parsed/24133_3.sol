pragma solidity ^0.4.0;

contract testContract {
    uint256 num1;

    address[] contracts = [0x36eaf79c12e96a3dc6f53426c, 0xf235aa56dd96bda02acfb361e];

    function getContractsCount() constant returns (uint256) {
          return contracts.length;
    }

}
