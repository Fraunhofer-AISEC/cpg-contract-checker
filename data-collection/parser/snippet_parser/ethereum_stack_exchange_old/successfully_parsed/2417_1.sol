contract rainbowCoin {
mapping (address => mapping (uint => uint)) balances;
function rainbowCoin() {
    balances[msg.sender][0] = 10000; 
    balances[msg.sender][1] = 10000; 
    balances[msg.sender][2] = 10000; 
    balances[msg.sender][3] = 10000; 
    balances[msg.sender][4] = 10000; 
    balances[msg.sender][5] = 10000; 
    balances[msg.sender][6] = 10000; 
}
function sendCoin(address receiver, uint amount, uint coin) returns(bool successful) {
    if (balances[msg.sender][coin] < amount) return false;
    balances[msg.sender][coin] -= amount;
    balances[receiver][coin] += amount;
    return true;
}
}