contractB {
  event Deposit (address from, uint value);

  function () external payable {
    emit Deposit (msg.sender, msg.value);
  }
}
