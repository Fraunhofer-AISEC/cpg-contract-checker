  function returnRandom(Campaign storage c) bountyPhase(c.bnum) internal returns (uint256) {
      if (c.revealsNum == c.commitNum) {
          c.settled = true;
          return c.random;
      }
  }
