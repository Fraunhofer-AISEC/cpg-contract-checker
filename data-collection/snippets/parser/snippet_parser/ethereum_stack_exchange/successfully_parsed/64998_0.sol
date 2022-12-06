function bytesToUInt(string memory _b) public returns (uint256){
  bytes memory b = bytes(_b);
  uint256 number;
  for(uint i=0;i<b.length;i++){
    number = number + uint(b[i])*(2**(8*(b.length-(i+1))));
  }
  return number;
}
