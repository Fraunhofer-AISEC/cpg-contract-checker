pragma solidity ^0.8;

contract MyContract {
    mapping (address => uint256) public balances;

    receive() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external {
        require(_amount <= balances[msg.sender], 'Insufficient balance');
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}
