  function stake(uint256[] calldata  tokenIds, uint256[] calldata  powers) external payable {
    for (uint i = 0; i <= tokenIds.length; i++) {
      uint256 tokenId = tokenIds[i];
      uint256 power = powers[i];

      require(NFT_CONTRACT.ownerOf(tokenId) == msg.sender, "You can only stake your own token");
      require(vault[tokenId].tokenId == 0, "You can only stake once");

      NFT_CONTRACT.safeTransferFrom(msg.sender, address(this), tokenId);

      vault[tokenId] = Stake({
        tokenId: tokenId,
        timestamp: block.timestamp,
        owner: msg.sender,
        power: power
      });
      userStacks[msg.sender].push(tokenId);
      hasPaid[tokenId] = 0;
    }
  }
