contract Sample {
  address constant public myAddress = 0xe0f5206bbd039e7b0592d8918820024e2a7437b9;
  uint public vari;
  function setVari(uint a) {
    if(msg.sender == myAddress) {
      vari = a;
    }
  }  
}
