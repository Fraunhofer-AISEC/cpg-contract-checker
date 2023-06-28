 
 bytes4[] internal knownSelectors;
 mapping(bytes4 => bool) internal knownSelector;

 struct State {
    
    mapping(bytes4 => bool) allowedFunctions;
    
    bytes32[] allowedRoles;
  }

  mapping(bytes32 => State) internal states;

  function getState(bytes32 state)
    public
    view
    returns (
      uint256 counter
    )
  {
    State storage s = states[state]; 

    uint8 counter = 0;
    for (uint256 i = 0; i < knownSelectors.length; i++) {
      if (states[state].allowedFunctions[knownSelectors[i]]) {
        counter += 1;
     }
    }  
  }
