contract A {
  event Hello(uint num);
  function doSomething() {
   Hello(1);
  }
}

contract B {
  A public a;

  function doAnotherThing() public {
    a = new A();
    a.doSomething();
  }
}
