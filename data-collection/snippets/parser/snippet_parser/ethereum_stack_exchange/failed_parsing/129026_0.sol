contract ERC721 {
  ...
  mapping(uint256 => address) private _tokenOwners;

  function _mint(address to, uint256 tokenID) {
    _tokenOwner[tokenID] = to;
    ...
  }
}

contract CryptoDog is ERC721 {
    ...
  string[] public cryptoDogz;  

  function mint(string memory nftName) public {

    cryptoDogz.push(ntfName);
    uint256 _tokenID = cryptoDogz.length - 1;
    _mint(msg.sender, _tokenID);
    ...
    
  }
}
