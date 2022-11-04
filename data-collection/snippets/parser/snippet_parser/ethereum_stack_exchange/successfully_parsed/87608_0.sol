contract ColorToken is ERC721Full, Ownable {
  string public constant name = "ColorToken";
  string public constant symbol = "CLRT";


  struct RegularColor {
    uint8 red;
    uint8 green;
    uint8 blue;
  }


  RegularColor[] colorsArray;


  constructor() ERC721Full("ColorToken", "CLRT") public {

  }
  
  
  
  function mintBatch(address ownerAddress, uint256 numColors) onlyOwner external {
    for(uint tempColorCounter = 0; tempColorCounter < numColors; tempColorCounter++) {
      
      RegularColor memory tempColor = RegularColor(uint8(now), uint8(now-28000), uint8(now+12500));
      
      colorsArray.push(tempColor);
      
      super._mint(msg.sender, tempColorCounter);
    }

  }


  function getColorOfTokenWithID(uint tokenID) public view returns(uint8 rd, uint8 gr, uint8 bl) {
    return (colorsArray[tokenID].red, colorsArray[tokenID].green, colorsArray[tokenID].blue);
  }



}
