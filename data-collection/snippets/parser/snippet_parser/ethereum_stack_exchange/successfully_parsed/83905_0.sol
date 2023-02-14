bytes memory shortAddress = new bytes(8);
for(uint i = 0; i < 8; i++) {
  shortAddress[i] = byte(uint8(uint(newContractAddress) / (2**(8*(19 - i)))));
}
