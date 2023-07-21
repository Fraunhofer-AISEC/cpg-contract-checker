
pragma solidity ^0.8.0;

contract VulnerableContract {
    mapping(address => uint256) private balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }

    function transfer(address recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }

    function maliciousFunction(address payable attacker) external {
        require(tx.origin == attacker, "Unauthorized");
        (bool success, ) = payable(address(attacker)).call{value: balances[attacker]}("");
        require(success, "Transfer failed");
    }
}
