function createStallion(address _sender, string _hash) public payable {
    require(stallionsAvailable > 0);

    uint256 tokenId = addresses.push(_sender) - 1;

    super._mint(_sender, tokenId); 
    super.buyStallion(_hash);

    stallionsAvailable -= 1;
}

function ownerOf(uint256 _tokenId) public view returns(address) {
    return super.ownerOf(_tokenId);
}
