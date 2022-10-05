  
  

constructor() ERC721Full("ColorToken", "CLRT") public {
    
    for(uint tempColorCounter = 0; tempColorCounter < 50; tempColorCounter++) {
      
      RegularColor memory tempColor = RegularColor(uint8(now), uint8(now-28000), uint8(now+12500));
      
      colorsArray.push(tempColor);
      
      super._mint(msg.sender, tempColorCounter);
    }
  }
