contract Caller {
  C c = new C();
  function f() public view returns (uint) {
     return c.data(); 
  }
}
