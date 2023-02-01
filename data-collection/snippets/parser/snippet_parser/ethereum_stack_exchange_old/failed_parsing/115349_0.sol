contract SS {
  
  address payable commissions = payable(0x...02);
  
  function doStuff() public payable {
    (bool success, ) = payable(commissions).call{value: msg.value * 30 / 100}("");
    require(success);
  }
}
