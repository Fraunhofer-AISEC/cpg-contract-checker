address[] memory newValues = new address[](values.length + 1);
for (uint256 i; i < MAX_SUPPLY; i++) {
    newValues[i] =  values[i];
}
