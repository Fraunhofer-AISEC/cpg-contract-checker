contract A {

  function test(MyInterface contractB) public {
    contractB.doSomething();
  }
}

interface MyInterface {

  function doSomething() external;
} 

contract B implements MyInterface  {

  function doSomething() override external {
    
  }
} 
