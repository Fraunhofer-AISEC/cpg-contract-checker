function _transfer(address from, address to, uint256 tokenId) internal virtual {
   require(ownerOf(tokenId) == from, "ERC721: transfer of token that is not own!");
   require(to != address(0), "ERC721: transfer to the zero address");

   ...
