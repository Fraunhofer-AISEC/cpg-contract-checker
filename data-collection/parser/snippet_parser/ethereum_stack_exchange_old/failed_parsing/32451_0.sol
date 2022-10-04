contract SplitIt {

  uint aPercent;
  uint bPercent;

  function SplitIt(uint aPortion, uint bPortion) public {
    require( aPortion+bPortion == uint(100));
    aPercent = aPortion;
    bPercent = bPortion;
  }
...
}
