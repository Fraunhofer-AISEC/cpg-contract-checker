function resellTicket() public payable {
  msg.sender.transfer(ticketPrice);
  isHoldingValidTicket[msg.sender] = false;
  increaseInventory();
}
