uint public data;

function setData(uint256 a) returns (bool) {

  data = a;
  Data(msg.sender, address(this), 10, a);
  return true;
}