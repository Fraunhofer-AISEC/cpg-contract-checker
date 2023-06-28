
contract myCoin {
        mapping (address => uint) coinBalanceOf;
        string coinName;
constructor(uint _supply, string memory _name) {
        coinBalanceOf[msg.sender] = _supply;
        coinName = _name;
}
function sendCoin(address receiver, uint amount) public {
        if (coinBalanceOf[msg.sender] >= amount) {
                coinBalanceOf[msg.sender] -= amount;
                coinBalanceOf[receiver] += amount;
        }
}
function balance() public view returns (uint) { return coinBalanceOf[msg.sender]; }
function name() public view returns (string memory) { return coinName; }
}
