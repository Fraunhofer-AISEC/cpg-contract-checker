    contract Test3Facet {

    struct Position {
    uint Id; 
    uint Size; 
  }
    uint internalVar = 1;
    function initialize() public returns (uint) {
        LibDiamond.testStorage().testInt = 0;
        Position memory pos = Position(1234,2000);
        LibDiamond.testStorage().positions[1] = pos; 
        return LibDiamond.testStorage().testInt;
    }

}

