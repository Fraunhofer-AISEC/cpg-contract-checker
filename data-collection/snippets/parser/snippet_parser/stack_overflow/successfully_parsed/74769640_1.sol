 `function returnCandidates() public view returns (Candidate[] memory){
      Candidate[] memory array = new Candidate[](candidatesCount);
      for (uint i = 0; i < candidatesCount; i++) {
        Candidate storage candidate = registeredCandidates[i];
        array[i] = candidate;
      }
      return array;
   }`
