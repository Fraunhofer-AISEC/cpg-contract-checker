  function fulfillRandomWords(
    uint256, 
    uint256[] memory randomWords
  ) internal override {
    s_randomWords = randomWords;
  }

  function exists1(uint16 num) public view returns (bool) {
      for (uint i = 0; i < losers.length; i++) {
          if (losers[i] == num) {
              return true;
          }
      }
      return false;
  }


  function drawLoser() public {
    
    uint16 drawing;
    uint i = 0;
    uint j = 1;
    
    while(i < 10*(current_supply-getCountLosers())/100) {  
      drawing = uint16(uint256(keccak256(abi.encode(s_randomWords[0], j)))%(current_supply-losers.length)+1);
      if (exists1(drawing) == true){
        j++;
      }
      if (exists1(drawing) == false){
        losers.push(drawing);
        i++;
      }
    }
  }
