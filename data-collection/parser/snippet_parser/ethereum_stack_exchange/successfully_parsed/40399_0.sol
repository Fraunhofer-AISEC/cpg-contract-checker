contract SimpleContract {
    uint storedData;
    event SimpleEvent(uint p); 

    function set(uint x) public 
    { 
      storedData = x; 
      SimpleEvent(x); 
    }
    function get() public returns (uint) { return storedData; }
}
