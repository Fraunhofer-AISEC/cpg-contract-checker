function convert() payable public returns (uint) {
  uint exchange = 1000;

  return ((msg.value * exchange) * 5 / 4) / (1 ether);
}
