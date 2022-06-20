pragma solidity ^0.4.23;

contract Lottery {

  uint lotteryFee = 0.1 ether;
  uint8 counter = 0;
  mapping (uint8 => address) participants;

  function participate() external payable returns(address) {
    require(msg.value == lotteryFee);
    counter = counter + 1;
    participants[counter] = msg.sender;
    return(participants[counter]);
  }

  function getBalance() public returns (uint) { 
    uint contractBalance = address(this).balance;
    return(contractBalance);
  }
}
