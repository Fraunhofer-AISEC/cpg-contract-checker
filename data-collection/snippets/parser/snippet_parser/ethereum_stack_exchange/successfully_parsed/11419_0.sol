contract MyContract {
  uint public version;
  address public previousPublishedVersion;

  function ping() returns (string param){
    param = "pong";
  }

  function squareNumber(uint num) returns (uint256 numSqr) {
    numSqr = (num * num);
  }
}
