function intToFixed (uint x) internal pure returns (uint y) { y = x * 10**18; }
function mulFixed (uint x, uint y) internal pure returns (uint z) { z = x * y / 10**18; }
function divFixedInt (uint x, uint y) internal pure returns (uint z) { z = x / y; }
function addFixed (uint x, uint y) internal pure returns (uint z) { z = x + y; }
function fixedToInt (uint x) internal pure returns (uint y) { y = x / 10**18; }
function f (uint totalValue, uint percentage) public pure returns (uint result) {
  uint totalValueFixed = intToFixed (totalValue);
  uint percentageFixed = intToFixed (percentage);

  for (uint i = 0; i < 30; i++) {
    totalValueFixed =
      addFixed (
        totalValueFixed,
        mulFixed (
          totalValueFixed,
          divFixedInt (percentageFixed, 100)));
  }

  result = fixedToInt (totalValueFixed);
}
