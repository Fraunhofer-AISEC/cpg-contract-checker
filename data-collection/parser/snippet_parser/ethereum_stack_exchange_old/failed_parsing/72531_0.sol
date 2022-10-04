{
address myaddress;
mapping (address => uint256) public balances;

constructor() public {
    myaddress = msg.sender;
}


function send(address from_address,address to_address, uint amount) public {
    require(amount <= balances[msg.sender], "Insufficient balance.");
    balances[msg.sender] -= amount;
    balances[to_address] += amount;
    
}

}
