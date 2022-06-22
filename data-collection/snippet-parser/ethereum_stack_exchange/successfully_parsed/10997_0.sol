contract Coin {


address public minter;
mapping (address => uint) public balances;



event Sent(address from, address to, uint amount, uint data);



function Coin() {
    balances[tx.origin] = 1000000000000000000000000000000000000;
    minter = msg.sender;
}

function mint(address receiver, uint amount) {
    if (msg.sender != minter) return;
    balances[receiver] += amount;
}

function send(address receiver, uint amount, uint data) {
    if (balances[msg.sender] < amount) return;
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    return Sent(msg.sender, receiver, amount, data);
}
}