...
function ownerOf(uint256 _tokenId) public view returns (address) {
  address owner = tokenOwner[_tokenId];
  require(owner != address(0));
  return owner;
 }
