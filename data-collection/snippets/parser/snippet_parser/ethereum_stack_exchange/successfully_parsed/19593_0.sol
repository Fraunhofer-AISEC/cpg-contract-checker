contract HelloWorld {

    mapping (address => uint) balances;
    address owner;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function HelloWorld() {
        balances[msg.sender] = 1500;
        owner = msg.sender;
    }

    function getBalances(address addr) returns(uint) {
        return balances[addr];
    }

    function getOwner() returns(address) {
        return owner;
    }

    function sendCoin(address receiver, uint amount) returns(bool success) {

        if(balances[msg.sender] < amount) return false; 

        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        Transfer(msg.sender, receiver, amount);
        return true;
    }
}
