  struct Constituency{
    uint16 id;
    string name;
    uint64[] cans;
  }

  mapping(uint => Constituency) public constituencies;

  function newConstituency(string memory _name) private{
    uint64[] memory tmp;
    constituencies[concount] = Constituency(concount, _name, tmp);
    concount++;
  }

  constructor() public{
    newConstituency("Bikini Bottom");
    constituencies[0].cans = [1,2,3];
  }
