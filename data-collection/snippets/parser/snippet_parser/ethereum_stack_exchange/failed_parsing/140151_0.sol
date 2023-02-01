  mapping(uint256 => Match) public matchList;

  struct Team {
  Player[] players;
  }

  struct Player {
  address username;
  uint256 index;
  uint256 payableInUSD;
  }

  struct MatchOption {
  uint256 entry;
  uint256 date;
  uint256 createAt;
  uint256 matchId;
  }

  struct Match {
  MatchOption matchOption;
  Team[] teams;
  uint256 price;
  uint256 createAt;
  }

 specificMatch   
 filled from frontend

  Match[] storage copiedMatch= specificMatch;  
  matchList[0] = copiedMatch;
