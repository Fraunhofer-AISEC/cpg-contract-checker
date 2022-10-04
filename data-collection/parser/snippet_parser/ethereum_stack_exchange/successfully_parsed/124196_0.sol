contract Normalized {

  using Bytes32Set for Bytes32Set.Set;

  Bytes32Set choices;

  function doSomething(bytes32 choice) public {
    require(choices.exists(choice), "invalid choice");
    
  }

  function newChoice(bytes32 choice) public {
    choices.insert(choice); 
  }

  function remChoice(bytes32 choice) public {
    choices.remove(choice); 
  }

  function choiceCount() public returns(uint) {
    return choices.count();
  }

  function getChoice(uint index) public returns(bytes32) {
    return choices.keyAtIndex(index);
  }

}
