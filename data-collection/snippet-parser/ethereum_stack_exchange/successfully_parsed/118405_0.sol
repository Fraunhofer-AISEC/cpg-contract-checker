  function onERC1155Received(
      address _operator,
      address _from,
      uint256 _id,
      uint256 _value,
      bytes calldata
  ) override external returns (bytes4) {
    require(msg.sender.supportsInterface(INTERFACE_ID_ERC1155), "Only accessible with method safeTransferFrom from your ERC1155 collection");
    
    require(_from == owner() && tx.origin == owner(), "Only the owner can add nfts");

    registerNft(msg.sender, _id, _value, INTERFACE_ID_ERC1155);
    emit NftAdded(msg.sender, _id, _value);

    return this.onERC1155Received.selector;
  }
