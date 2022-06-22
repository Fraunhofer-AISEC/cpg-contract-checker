  constructor(address _wool, address _traits, uint256 _maxTokens) ERC721("Wolf Game", 'WGAME') { 
    wool = WOOL(_wool);
    traits = ITraits(_traits);
}