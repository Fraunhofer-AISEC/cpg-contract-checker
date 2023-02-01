  
  delete _owners[tokenId];
  emit Transfer(owner, address(0), tokenId);
