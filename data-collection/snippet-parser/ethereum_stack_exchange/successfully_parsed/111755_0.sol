uint256 public amount= 64000000000000000;
function giveAwards(uint256[] memory _tokens) external onlyOwner payable {
    require(((_tokens.length * award) <= msg.value ), "Failed amount sent is not enough.");
    uint256 remaining = 0;
    for (uint256 i = 0; i < _tokens.length; i++) {
      uint256 token = _tokens[i];

      remaining = msg.value.sub(amount);
      (bool success,) = payable(ownerOf(token)).call{value : amount}("");
      require(success, "-> Payout transfer failed.");
      
      payed[i] = token;    
    }
   _surplus(remaining);
  }

 function _surplus(uint256 _amount) private {
    if (_amount > 0) {
      (bool success,) = msg.sender.call{value : _amount}("");
      require(success, "Surplus transfer failed.");
    }
  }
