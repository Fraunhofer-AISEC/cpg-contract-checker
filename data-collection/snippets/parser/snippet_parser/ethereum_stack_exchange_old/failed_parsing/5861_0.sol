contract owned {
  function owned() { owner = msg.sender; }
  address owner;

  
  
  
  
  modifier onlyowner { if (msg.sender == owner) _ }
}
