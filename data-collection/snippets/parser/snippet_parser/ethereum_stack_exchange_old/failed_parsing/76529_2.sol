function confrimReceived() public 
  condition(msg.value == price)
  payable
{
  totalBuyers += 1;
  totalEarnings += price;
  ...
}
