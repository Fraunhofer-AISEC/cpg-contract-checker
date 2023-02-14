contract Test {
  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _amount,
    uint256 _seq
  );
  uint256 public _seq;

  function transfer(address _to, uint256 _amount) external {
     _seq++;
     emit Transfer(msg.sender, _to, _amount, _seq);
  }
}
