  function getBackgroundColor(uint256 tokenId) public pure returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(toString(tokenId))));
    bytes32 val = bytes32(rand);
    bytes memory hx = "0123456789ABCDEF";
    bytes memory str = new bytes(26);

    for (uint i = 17; i < 20; i++) {
      str[i*2] = hx[uint(uint8(val[i + 12] >> 4))];
      str[1+i*2] = hx[uint(uint8(val[i + 12] & 0x0f))];
    }

    return string(str);
  }
