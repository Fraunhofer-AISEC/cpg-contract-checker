function getMyTron2() public
    view
    returns
    (uint256)
{
  return safeTron[msg.sender];
}

function getMyMicroTron() public
    view
    returns
    (uint256)
{
  updatePlayersMicroTron(msg.sender);
  tempOldTime = block.timestamp;
  return rewardedMicroTron[msg.sender];
}
