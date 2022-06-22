function convertByteToString(bytes3 symbol) public view returns(string memory){
  string memory result = string(abi.encodePacked(symbol));
  return result;
}
