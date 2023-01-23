

pragma solidity ^0.8.17;

contract Event {

    event Deposit(address from, uint256 amount, uint256 timestamp);
    event Transfer(address from, address to, uint256 amount, uint256 timestamp);
    event Withdraw(address sender, uint256 amount, uint256 timestamp);

    mapping(address => uint256) public balances;

    function deposit() public payable {
        

        emit Deposit(msg.sender, msg.value, block.timestamp);
    }

    function transfer(address to, uint256 amount) public payable {
        

        emit Transfer(msg.sender, to, amount, block.timestamp);
    }

    function withdraw(uint256 amount) public payable {
        

        emit Withdraw(msg.sender, amount, block.timestamp);
    }

}
