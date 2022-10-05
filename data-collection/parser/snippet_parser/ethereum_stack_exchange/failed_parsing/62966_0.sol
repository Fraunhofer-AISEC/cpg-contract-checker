pragma solidity ^0.4.25;
  contract toss3D{
  uint tossvalue = 0;
  uint targetBlock = 0;
  bool isgameStarted = false;
  struct winningToss{
    uint256 blocksAwayFromWin;
    address winnerAddress;
  }

  function tossCoin() public payable{
    if msg.value(uint) >= 2.5 finney{

    }
}
