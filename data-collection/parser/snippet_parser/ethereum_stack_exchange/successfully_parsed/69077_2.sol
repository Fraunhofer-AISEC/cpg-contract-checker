pragma experimental ABIEncoderV2;

contract Foo {
  string [] private strings;

  function addString (string memory str) public {
    strings.push (str);
  }

  function getStrings () public view returns (string [] memory) {
    return strings;
  }
}
