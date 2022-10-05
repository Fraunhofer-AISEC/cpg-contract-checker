contract MyContract is ERC721, AccessControl {
  function supportsInterface(bytes4 interfaceId) public view override(ERC721, AccessControl) returns (bool) {
    return super.supportsInterface(interfaceId);
  }
}

contract ERC721 is ERC165, IERC721, IERC721Metadata {
  function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
    return interfaceId == type(IERC721).interfaceId
        || interfaceId == type(IERC721Metadata).interfaceId
        || super.supportsInterface(interfaceId);
  }
}

abstract contract AccessControl is IAccessControl, ERC165 {
  function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
    return interfaceId == type(IAccessControl).interfaceId
        || super.supportsInterface(interfaceId);
  }
}
