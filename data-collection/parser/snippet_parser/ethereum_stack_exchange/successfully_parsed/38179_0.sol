contract First {
  function cSender() public view returns(address){
    return msg.sender; 
  }
}

contract Second {
  First f;
  function Second() public {
    f = new First(); 
  }

  function checkSender(uint t) public view returns(address){
    t = 0; 
    return f.cSender();
  }
} 
