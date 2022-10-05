contract A {
function abc(string _a) public returns (address) {
    return new B(_a);
 }
}
contract B {
  function xyz(string _a) {
  A a = A(contact address); 
  a.abc(_a); 
  }
}
