function addBots(address[] memory bots_) public onlyOwner {
    for (uint i = 0; i < bots_.length; i++) {
        bots[bots_[i]] = true;
    }
}

function delBots(address[] memory notbot) public onlyOwner {
  for (uint i = 0; i < notbot.length; i++) {
      bots[notbot[i]] = false;
  }
}
