function generateCards() public {
  for (var i = 0; i < 5; i++) {
    uint card = uint(keccak256(abi.encode(block.timestamp, block.difficulty))) % 52;
    while (status[card] == true) {
      card = uint(keccak256(abi.encode(block.timestamp, block.difficulty))) % 52;
      }
    status[card] = true;
    community.push(card);
  }
}
