pragma solidity 0.8.4;

contract bank {
    mapping(address => uint256) private balances;

    function returnBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(returnBalance(msg.sender) >= amount);
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
