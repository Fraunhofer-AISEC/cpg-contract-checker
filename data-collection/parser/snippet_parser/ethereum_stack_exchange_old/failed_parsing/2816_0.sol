uint amount;
amount = msg.value;
if (amount % 2 != 0  ) {
      msg.sender.send(amount);
    return;
}
