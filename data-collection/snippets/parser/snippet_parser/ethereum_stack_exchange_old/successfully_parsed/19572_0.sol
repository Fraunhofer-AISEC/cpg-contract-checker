mapping (address => uint) balances;

function HelloWorld() {
    balances[msg.sender] = 1000;
}

function getBalance() public constant returns(uint) {
    return balances;
}

function sendCoin(address receiver, uint amount) public constant returns(bool sufficient) {
    if (balances[msg.sender] < amount) return false;

    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    return true;
}
