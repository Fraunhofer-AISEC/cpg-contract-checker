contract Example{
  
  struct Params{
    uint a;
    uint b;
  }
  
  
  mapping(uint => Params) public queued;
  uint nextToQueue;
  
  function funcToRun(uint a, uint b) internal {
    
  }
  
  function queueTransaction(uint a, uint b) public returns(uint index) {
    index = nextToQueue++; 
    Params memory toQueue = new Params(a, b);
    queued[index] = toQueue;
  }
  
  function executeTransaction(uint index) public onlyOwner {
    Params memory toExecute = queued[index];
    require(toExecute.a != 0 || toExecute.b != 0, "invalid index"); 
    funcToRun(toExecute.a, toExecute.b);
    delete queued[index];
  }
}
