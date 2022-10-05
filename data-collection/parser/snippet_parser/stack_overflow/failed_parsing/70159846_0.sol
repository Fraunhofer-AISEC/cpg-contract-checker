uint256 randomness = 78076127350936886139585537764964110448646985064549445555744769369952641998556;
for (uint256 i = 0; i < 10; i++) {
  uint8 random1 = SafeCast.toUint8((randomness % (100 + i)) % 100)
  uint8 random2 = SafeCast.toUint8((randomness % (100 + i)) % 3)
}
