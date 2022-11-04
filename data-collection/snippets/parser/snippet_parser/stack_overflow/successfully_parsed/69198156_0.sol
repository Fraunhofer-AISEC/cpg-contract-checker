  function _tokenURI(uint256 tokenId) internal view returns (string memory) {
    string memory currentBaseURI = _baseURI();
    bytes32 hashedToken = keccak256(abi.encodePacked(tokenId));

    return
      bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, hashedToken, baseExtension))
        : "";
  }
