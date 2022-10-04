pragma solidity 0.4.21;

contract Forwarder {

  address public destinationAddress;
  event LogForwarded(address indexed sender, uint amount);

  function Forwarder() public {
    destinationAddress = msg.sender;
  }

  function() payable public {
    emit LogForwarded(msg.sender, msg.value);
    destinationAddress.transfer(msg.value);
  }

}
