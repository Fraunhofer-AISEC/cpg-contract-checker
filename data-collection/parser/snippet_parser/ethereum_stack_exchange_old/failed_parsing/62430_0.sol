
contract ExampleOne {

  struct Problem {
    bytes32 a; 
    bytes32 b;
    bytes32[] c;
    uint d;
    }
  mapping (bytes32 => Problem) public problems;
}


contract IExampleOne {
  function problems(bytes32) public returns (bytes32, bytes32, bytes32[], uint);
  }

contract Example Two {

  IExampleOne exampleOne;

  constructor(address _exampleOne) {
    exampleOne = IExampleOne(_exampleOne);
  }

  function func(bytes32 name) {
    (bytes32 a, bytes32 b, bytes32[] c, uint d) = problems(name); 
    ...
  }
}
