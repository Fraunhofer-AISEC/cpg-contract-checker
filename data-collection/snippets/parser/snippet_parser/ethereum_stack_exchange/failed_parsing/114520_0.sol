function withdraw() payable onlyOwner public {
  ...withdrawal logic...
  funders = new address[](0);
}
