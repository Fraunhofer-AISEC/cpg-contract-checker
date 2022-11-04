uint amount;
amount = msg.value;
if (amount % 1 ether != 0  ) {
      msg.sender.send(amount);
    return;
}
