contract TestX {

  X x = X(DeployedAddresses.X()); 

  function testReservePlace() public {
    
    
    bool flag = x.reservePlace.value(1 ether)("hj");
  }
}
