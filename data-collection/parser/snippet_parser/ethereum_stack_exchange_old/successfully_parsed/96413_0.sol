function drawCard(string memory _tokenURI, bytes32[] memory params) public {
        uint _check  = uint(params[1]);
        entered_supply = _check;
        require(_check<total_supply,
        "Input supply is not less than total supply of cards.");
        _tokenIds.increment();
        uint256 newNftTokenId = _tokenIds.current();
        
        Cards memory c;
        c.name = string(abi.encodePacked(params[0]));
        check_name = c.name;
        c.supply = _check;
        c.cat = string(abi.encodePacked(params[2]));
        c.description = string(abi.encodePacked(params[3]));
        c.image_url= string(abi.encodePacked(params[4]));
        c.card_id = newNftTokenId;
}