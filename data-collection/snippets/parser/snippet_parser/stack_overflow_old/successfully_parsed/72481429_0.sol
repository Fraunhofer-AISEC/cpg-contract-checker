function current(Counter storage counter) internal view returns (uint256) {
  return counter._value;
}

function increment(Counter storage counter) internal {
  unchecked {
    counter._value += 1;
  }
}
