receive() external payable {
  if (msg.value != requiredAmount) { 
    (bool success,) = msg.sender.call{value: msg.value}("");
    require(success, "Failed to send Ether");
    emit MoneyReturned(msg.sender, msg.value);
  } else {
    logic();
  }
}
