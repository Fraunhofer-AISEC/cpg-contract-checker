
pragma solidity ^0.8.16;

contract DexEth {

    event Deposit(address from, uint256 amount, uint256 timestamp);
    event Withdraw(address to, uint256 amount, uint256 timestamp);
    event Transfer(address from, address to, uint256 amount, uint256 timestamp);

    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Sender does not have enough eth to withdraw this amount");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Error sending the eth to the sender.");
        emit Deposit(msg.sender, amount, block.timestamp);
    }

    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Sender does not have enough eth to transfer this amount");
        balances[msg.sender] -= amount;
        (bool success, ) = to.call{value: amount}("");
        require(success, "Error sending the eth to the recipient.");
        emit Transfer(msg.sender, to, amount, block.timestamp);
    }

    

}
