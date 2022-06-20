pragma solidity ^0.4.0;

contract ExampleSmartContract {


  function() payable {

      msg.sender.transfer(msg.value);

  }

}
