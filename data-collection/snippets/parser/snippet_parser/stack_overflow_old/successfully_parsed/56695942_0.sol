  function sendEther(uint256 _tokenId) public payable {
    address payable _tokenOwner = ownerOf(_tokenId);
    _tokenOwner.transfer(msg.value);
  }

ERC721.sol
    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _tokenOwner[tokenId];
        return owner;
    }
