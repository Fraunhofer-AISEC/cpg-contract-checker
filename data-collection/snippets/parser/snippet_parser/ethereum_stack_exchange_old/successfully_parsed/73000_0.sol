pragma solidity ^0.5.0;

contract sendEther {
  address payable sender;

  function showReceiver() public view returns (address payable) {
      return msg.sender;
  }

  function sendEtherToReceiver(address payable _receiver, uint256 _amount) public payable {
    _receiver.transfer(_amount * 10**18);
  }
}
