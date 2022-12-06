pragma solidity 0.5.1;

contract Test {

  function send() payable public {
    address payable recipient = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
    recipient.transfer(1000000000000000000); 
  }

  function myBalance() public view returns(uint) {
      return address(this).balance;
  }

  function betterForwarder(address payable recipient) public payable {
      recipient.transfer(msg.value);
  }

  function returnTheChange(address payable recipient) public payable {
      require(msg.value >= 1 ether);
      recipient.transfer(1 ether);
      if(msg.value > 1 ether) msg.sender.transfer(msg.value - 1 ether);
  }

}
