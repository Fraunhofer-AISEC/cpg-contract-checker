contract MultiTransfer {

  function transferEther(uint amount, address[] users) public payable {
    require(amount * users.length == msg.value);
    for (uint i = 0; i < users.length; i++) {
      users[i].transfer(amount);
    }
  }

}
