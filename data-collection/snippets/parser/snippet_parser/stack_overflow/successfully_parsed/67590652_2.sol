
interface A {
  function foo() external returns (bool);
}


contract B {
  function callFoo() external returns (bool) {
    A a = A(addressA);
    return a.foo();
  }
}
