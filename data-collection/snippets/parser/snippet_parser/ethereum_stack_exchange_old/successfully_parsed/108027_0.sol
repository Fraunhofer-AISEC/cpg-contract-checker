 
  function checkNextStates(bytes32 fromState, bytes32 toState) public view returns (bool hasNextState) {
    hasNextState = false;
    bytes32[] storage nextStates = states[fromState].nextStates;
    for (uint256 i = 0; i < nextStates.length; i++) {
      if (keccak256(abi.encodePacked(nextStates[i])) == keccak256(abi.encodePacked(toState))) {
        hasNextState = true;
        break;
      }
    }
  }
