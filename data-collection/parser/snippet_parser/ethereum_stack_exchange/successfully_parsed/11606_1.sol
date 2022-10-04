pragma solidity ^0.4.2;
    contract C {
          uint data;

      function getData() constant returns (uint retData) {
        return data;
      }
}
