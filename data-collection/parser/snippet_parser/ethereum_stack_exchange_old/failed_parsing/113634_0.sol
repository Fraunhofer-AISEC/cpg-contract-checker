function mintToken(
        uint _price,
        
) public payable returns(uint) {
    require(_price == msg.value, "Incorrect amount specified");

    uint tokenId = totalSupply() + 1;
    _safeMint(_msgSender(), tokenId);
    
    

    return tokenId;
}
