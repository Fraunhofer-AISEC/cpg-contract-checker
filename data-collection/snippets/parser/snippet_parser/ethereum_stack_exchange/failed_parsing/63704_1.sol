contract example3 {
  function C() {
    print msg.sender;
    B();
  }
function B() internal {
    print msg.sender; 
  }
}
