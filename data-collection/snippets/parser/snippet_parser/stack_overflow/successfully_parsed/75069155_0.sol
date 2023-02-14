mapping(address => uint) public balances;


function deposit() public payable{
    balances[msg.sender] += msg.value; 
}


function withdraw(uint _amount) public{

    require(balances[msg.sender]>= _amount, "Not enough ether");

    balances[msg.sender] -= _amount;

    (bool sent,) = msg.sender.call{value: _amount}("Sent");
    require(sent, "failed to send ETH");
}

    function getBalance(address _owner) public view returns (uint){
        return address(_owner).balance;
}
