uint8 private constant TYPE_X = 1;
uint8 private constant TYPE_Y = 2;

function renderSvg(uint256 _tokenId) private view returns (string memory) {
  return string(abi.encodePacked(
    "<svg xmlns='http://www.w3.org/2000/svg' width='1000' height='1000'",
    "' style='background-color:#fff'>",
    generatePaths(_tokenId),
    "</svg>"
  ));
}

function generatePaths(uint256 tokenId) public view returns(string memory) {

  string memory paths;

  for(uint256 i; i < 500; i++) {
    
    uint256 x1;
    uint256 y1;
    uint256 x2;
    uint256 y2;
    
    if(i > 0) {
      x1 = generatePoint(tokenId, (i-1), TYPE_X, 25, 975);
      y1 = generatePoint(tokenId, (i-1), TYPE_Y, 25, 975);
      x2 = generatePoint(tokenId, i, TYPE_X, 25, 975);
      y2 = generatePoint(tokenId, i, TYPE_Y, 25, 975);
    }
    else {
      x1 =  generatePoint(tokenId, 0, TYPE_X, 25, 975);
      y1 =  generatePoint(tokenId, 0, TYPE_Y, 25, 975);
      x2 =  generatePoint(tokenId, 0, TYPE_X, 25, 975);
      y2 =  generatePoint(tokenId, 0, TYPE_Y, 25, 975); 
    }
    
    paths = string(abi.encodePacked(
      paths, 
      "<path fill='none' stroke-linecap='round' d='M",
      Strings.toString(x1),
      ",",
      Strings.toString(y1),
      ", C",
      Strings.toString(x1),
      ",",
      Strings.toString(y1),
      "' />"
      />"
    ));
  }

  return paths;
}

function generatePoint(uint256 _tokenId, uint256 _index, string memory _type, uint256 _min, uint256 _max) public view returns (uint256) {
  return randomNum(_max, ownerOf(_tokenId), _tokenId, _index, _type) + _min;
}

function randomNum(uint256 _max, address _account, uint256 _tokenId, uint256 _index, string memory _type) private view returns(uint256) {
  return uint(keccak256(abi.encodePacked(_account, _tokenId, _index, _type))) % _max;
}
