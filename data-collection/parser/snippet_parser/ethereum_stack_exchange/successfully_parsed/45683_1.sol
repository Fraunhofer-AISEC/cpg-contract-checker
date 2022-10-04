pragma solidity ^0.4.21;

contract ExampleSmartContract {


  function() public payable {

      msg.sender.transfer(msg.value);

  }

}
