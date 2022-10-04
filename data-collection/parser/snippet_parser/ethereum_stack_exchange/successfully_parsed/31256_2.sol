contract Factory {
  
  function newChild() returns (address){
    Child c = new Child(); 
    return c;
  }
  function setChildCode(bytes[] bytecode) {
    
  }
}
