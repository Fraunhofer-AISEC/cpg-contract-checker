mapping (address => uint) balances;

function Moon () {
    balances[tx.origin] = 1000;
}   

function getBalance() public constant returns(uint) {
    return balances;
}
