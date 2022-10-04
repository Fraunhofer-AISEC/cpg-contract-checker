pragma solidity ^0.4.13;

contract Core {

    uint balance = 10;

    function getBalance() constant returns (uint){
        return balance;    
    }

}

contract CoreAPI {

    function getBalance() constant returns (uint);

}

contract Shell is CoreAPI{

      CoreAPI core;
      address creator;

      function Shell () {
          creator = msg.sender;
      }

      function upgrade(address _core){
          if (msg.sender != creator) {
              revert();
          }
          core = CoreAPI(_core);
      }

      function getBalance() constant returns (uint response){
          address dest = core;
          bytes4 calldata = bytes4(sha3("getBalance()"));
          assembly {
               let status := delegatecall(gas, dest, add(calldata, 0x20), mload(calldata), 0, 32)
               response := mload(0)
          }
      }

  }
