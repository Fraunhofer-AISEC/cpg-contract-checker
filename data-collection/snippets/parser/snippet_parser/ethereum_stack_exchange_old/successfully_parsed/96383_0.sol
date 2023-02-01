   function drawCard(string memory _tokenURI, bytes32[] memory params) public {
        require(uint(params[1])<total_supply,
        "Input supply is not less than total supply of cards.");
        _tokenIds.increment();
        uint256 newNftTokenId = _tokenIds.current();
        
        Cards memory c;
        c.name = string(abi.encodePacked(params[0]));
        c.supply = uint(params[1]);
        c.cat = string(abi.encodePacked(params[2]));
        c.description = string(abi.encodePacked(params[3]));
        c.image_url= string(abi.encodePacked(params[4]));
        c.card_id = newNftTokenId;
        
        card.push(c);
        tokeninfo[newNftTokenId] = c;
}
