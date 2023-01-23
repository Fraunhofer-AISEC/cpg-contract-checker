

contract ExampleFactory {
  Example [] public examples;

 function newExample(bytes32 _name) {
   Example example = new Example(_name);
   examples.push(example);
 }
}

contract Example {

  bytes32 public name;
  bool printed;
  event Print(bytes32);

  constructor(bytes32 _name) {
    name = _name;
  }

  function printName() public {
    printed = true;
    emit Print(name);
  }
}
