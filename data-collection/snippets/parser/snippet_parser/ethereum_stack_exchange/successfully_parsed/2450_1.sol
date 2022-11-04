contract B is Test {
  function testTimestamp () {
    A a = new A();
    uint timestamp = a.createdTimestamp();
    
  }
}
