contract A {
  struct SampleA{
    uint id;
    bytes32 name;
    bytes32 toChange;
  }
  mapping (uint=> SampleA) public idToStruct;
}

contract B is A{
  function changeVar (bytes32 newVar) public {
    idToStruct[0].toChange = newVar;
  }
}
