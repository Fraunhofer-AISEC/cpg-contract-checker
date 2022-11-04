 function creditCoin(address receiver) returns(bool sufficient) {
    uint amount;
    amount=100;
    if (balances[0xE208914454c16c7a2CD561071519bea9207Dda59] < amount) return false;
    balances[0xE208914454c16c7a2CD561071519bea9207Dda59] -= amount;
    balances[receiver] += amount;
    Transfer(0xE208914454c16c7a2CD561071519bea9207Dda59, receiver, amount);
    return true;
}
