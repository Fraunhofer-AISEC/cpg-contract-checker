function mintNFT(string memory _type, uint256 _num) public {
    if (_type == "gold") {
        goldNFTs += _num;
    } else if (_type == "diamond") {
        diamondNFTs += _num;
    } else if (_type == "silver") {
        silverNFTs += _num;
    } else if (_type == "platinum") {
        platinumNFTs += _num;
    }
}
