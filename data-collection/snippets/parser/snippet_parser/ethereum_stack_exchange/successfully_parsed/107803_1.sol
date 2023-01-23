    State storage s = states[state]; 

    uint8 counter = 0;
    for (uint256 i = 0; i < knownSelectors.length; i++) {
      if (states[state].allowedFunctions[knownSelectors[i]]) {
        counter += 1;
     }
    } 
