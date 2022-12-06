function prices() constant returns (uint sell_price, uint target_price, uint penalty_price) {
  sell_price = prices.sell_price;
  target_price = prices.target_price;
  penalty_price = prices.penalty_price;
}
