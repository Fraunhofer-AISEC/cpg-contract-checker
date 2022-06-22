  function addCandidate(string candidateName, string election) public {
    bytes32 c1 = stringToBytes32(candidateName);
    bytes32 e1 = stringToBytes32(election);

      candidates[c1] = candidate(c1,e1,0);

    }
