function mint(uint256 _count)
        public payable
{
    uint supply = totalSupply();
    require( supply + _count <= MAX_SUPPLY, "Exceeds max supply." );
    for(uint i = 0; i < _count; ++i){
        _safeMint(msg.sender, supply + i);
    }
}
