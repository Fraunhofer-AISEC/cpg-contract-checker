contract CryptoCharacters is ERC721Enumerable, Ownable {
  uint number;

  function setNumber(uint256 n) public { 
      number = n;
  }
}
