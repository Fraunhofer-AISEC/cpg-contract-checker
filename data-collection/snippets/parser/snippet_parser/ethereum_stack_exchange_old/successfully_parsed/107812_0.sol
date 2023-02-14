contract Bank {
  mapping(bytes32 => State) internal states;
  bytes32[] internal possibleStates;

  struct State {
    
    bool hasBeenCreated;
    
    mapping(bytes4 => bool) allowedFunctions;
    
    bytes32[] allowedRoles;
    
    function(bytes32, bytes32) internal view[] preConditions;
    
    function(bytes32, bytes32) internal[] callbacks;
    
    bytes32[] nextStates;
    
    bytes4 preFunction;
  }

 
  function createState(bytes32 stateName) public {
    states[stateName].hasBeenCreated = true;
  }
}
