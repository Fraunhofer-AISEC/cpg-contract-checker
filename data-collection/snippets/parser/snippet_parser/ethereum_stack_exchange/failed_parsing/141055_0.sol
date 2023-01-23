  function initRaffle(address _tokenContract, uint256 _tokenId, uint256 _ticketPrice) external {
      require(_ticketPrice > 0, "Ticket price must be bigger than 0");
      require(LINKToken.balanceOf(msg.sender) >= ChainlinkFee, "Insufficient LINK supplied");
      require(LINKToken.allowance(msg.sender, address(this)) >= ChainlinkFee, "Allowance failed");
