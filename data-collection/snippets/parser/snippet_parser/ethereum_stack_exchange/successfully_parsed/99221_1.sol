contract A {
  function foo() external {
    return true;
  }
}

contract B {
  function callFoo() external {
    A a = A(addressA);
    return a.foo();
  }
} 
