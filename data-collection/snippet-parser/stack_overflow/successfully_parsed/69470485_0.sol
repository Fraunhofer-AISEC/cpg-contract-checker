uint256 MINT_PASS;
constructor(uint256 pass) ERC721("NFTexample", "XMP") public {
    CEOaddress = msg.sender;
    MINT_PASS = pass;
}

function minting(address recipient, string memory tokenURI, uint256 _tokenID, uint256 SECRET_CODE) public
    returns (uint256)
{
    require(MINT_PASS == SECRET_CODE);
    uint256 newItemId = _tokenID;
    _mint(recipient, newItemId);
}
