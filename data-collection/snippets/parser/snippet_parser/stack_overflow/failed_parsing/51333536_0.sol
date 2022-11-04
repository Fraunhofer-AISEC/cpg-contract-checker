 
 function func(address addr) public returns (bool result) {
    Cantract2 c = Cantract2(addr);
    if (!c.setAddress(..)) {
       return false;
    }
       .....
    return true;
  }
