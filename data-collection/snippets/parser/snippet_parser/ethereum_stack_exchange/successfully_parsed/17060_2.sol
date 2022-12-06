contract Sample {
  address constant public myAddress = 0xE0f5206BBD039e7b0592d8918820024e2a7437b9;
  uint public vari;
  function setVari(uint a) {
    if(msg.sender == myAddress) {
      vari = a;
    }
  }  
}
