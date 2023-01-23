contract a { 

  struct Str {
    uint256 totalTokens;
    mapping(address => uint256) playerTokens;
  }

  mapping(uint256 => Str) private tokenStores;  

  function getPlayerToken(uint256 tokenId, address player) public returns(uint, uint) {
      Str storage t =  tokenStores[tokenId];
      return (t.totalTokens, t.playerTokens[player]);
  }
}
