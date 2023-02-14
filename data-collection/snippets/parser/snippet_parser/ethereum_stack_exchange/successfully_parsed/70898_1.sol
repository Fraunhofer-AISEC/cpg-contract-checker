int decimals = 4;
int totalValue = 275000;
int percentage = 2;

totalValue = totalValue * 10**decimals;
for (uint i = 0; i < 30; i++) {
  int AddValue = totalValue * percentage;
  AddValue = AddValue / 100;
  totalValue += AddValue;
}
totalValue = totalValue / 10**decimals;
