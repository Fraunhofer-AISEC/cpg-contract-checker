
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./IERC4907.sol";

contract ERC4907 is ERC721URIStorage, IERC4907 {
  struct UserInfo {
    address user; 
    uint64 expires; 
  }

  mapping(uint256 => UserInfo) internal _users;

  constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {}

  
  
  
  
  
  function setUser(
    uint256 tokenId,
    address user,
    uint64 expires
  ) public virtual override {
    require(
      _isApprovedOrOwner(msg.sender, tokenId),
      "ERC721: transfer caller is not owner nor approved"
    );
    UserInfo storage info = _users[tokenId];
    info.user = user;
    info.expires = expires;
    emit UpdateUser(tokenId, user, expires);
  }

  
  
  
  
  function userOf(uint256 tokenId)
    public
    view
    virtual
    override
    returns (address)
  {
    if (uint256(_users[tokenId].expires) >= block.timestamp) {
      return _users[tokenId].user;
    } else {
      return address(0);
    }
  }

  
  
  
  
  function userExpires(uint256 tokenId)
    public
    view
    virtual
    override
    returns (uint256)
  {
      return _users[tokenId].expires;
  }

  
  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool)
  {
    return
      interfaceId == type(IERC4907).interfaceId ||
      super.supportsInterface(interfaceId);
  }

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 tokenId
  ) internal virtual override {
    super._beforeTokenTransfer(from, to, tokenId);

    if (from != to && _users[tokenId].user != address(0)) {
      delete _users[tokenId];
      emit UpdateUser(tokenId, address(0), 0);
    }
  }
}
