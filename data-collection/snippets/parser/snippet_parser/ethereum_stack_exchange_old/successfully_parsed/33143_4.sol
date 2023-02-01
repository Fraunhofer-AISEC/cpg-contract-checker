mapping(address => SomeStruct) someStructs; 

function getAScore(address key) public constant returns(uint) {
  uint score = someStructs[key].score; 
  uint lastUpated = someStructs[key].lastUpdated; 
  uint elapsed = block.number - lastUpdated;
  uint actualScore = score + elapsed;
  return actualScore; 
}
