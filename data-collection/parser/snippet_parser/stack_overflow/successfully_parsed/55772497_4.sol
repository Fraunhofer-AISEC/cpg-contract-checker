function getAssets(address key) public view returns (string[] memory assets){
    assets = new string[](owns[key].length);
    for (uint i=0; i<owns[key].length; i++){
      assets[i] = owns[key][i];      
    }
  }
