unit256 public cutNumerator = 0;
uint256 public cutDenominator = 100;

uint256 cut = (msg.value * cutNumerator) / (cutDenominator);
