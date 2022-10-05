  function checkPrizeReceived(uint256 id, uint price) public view returns (bool) {
    for (uint i = 0; i < better[msg.sender].length; i++) {   
      if (better[msg.sender][i].id == id && better[msg.sender][i].price == price) {
        if (better[msg.sender][i].receivedPrize) {
          return true;
        }
      }
    }

    return false;
  }
