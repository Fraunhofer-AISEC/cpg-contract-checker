contract Test {
  using StackLib for StackLib.Stack;

  StackLib.Stack numbers;

  function add(uint v) public {
    numbers.pushElement(v);
  }

  function doSomething() public {
    for (uint8 i = 0; i < numbers.size(); i++) {
      uint curNum = numbers.popElement();

      
    }
  }
}
