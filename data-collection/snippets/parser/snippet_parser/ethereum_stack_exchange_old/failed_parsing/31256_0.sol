contract Factory {
  
  function newChild() returns (address) {
    Child c = new Child();
    return c;
  }
  
}

contract Child_v1 {
  
  public getVersion() constant returns (uint) {
    return 1;
  }
}
