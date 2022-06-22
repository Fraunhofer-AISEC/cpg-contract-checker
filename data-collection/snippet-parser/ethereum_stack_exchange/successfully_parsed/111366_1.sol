
pragma solidity 0.8.9;

library StringLib {
  function compareTwoStrings(string memory s1, string memory s2)
    public
    pure
    returns (bool)
  {
    return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
  }
}


pragma solidity 0.8.9;

contract Contract{
    function compare(string memory a, string memory b) public pure returns (bool){
        return StringLib.compareTwoStrings(a, b);
    }
}
