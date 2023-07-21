contract Reentrency1 {
mapping (address => uint) public balance;

function deposit() public payable {
    balance[msg.sender] += msg.value;
}

function withdraw(uint amount) public {
    require(balance[msg.sender] >= amount, "not enough balance");
    balance[msg.sender] -= amount;
    payable(msg.sender).transfer(amount);
}
}