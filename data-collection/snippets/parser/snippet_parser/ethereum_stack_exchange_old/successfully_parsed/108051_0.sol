  bytes4[] internal stateFunctions;
  mapping(bytes32 => bytes4) internal stateFunction;

  function addAllowedFunctionForState(bytes32 state, bytes4 allowedFunction) public doesStateExist(state) {
    if (!knownSelector[allowedFunction]) {
      stateFunction[state] = allowedFunction;
      stateFunctions.push(allowedFunction);
    }
    states[state].allowedFunctions[allowedFunction] = true;
  }

 function stateChecker(bytes32 state) public view returns
    (bytes4[] calldata allowedFunctions)
    {
    return stateFunction[state];
   
    }
