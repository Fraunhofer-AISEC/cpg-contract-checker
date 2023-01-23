pragma solidity ^0.4.18;

contract TestToken {
    uint public totalSupply;

    mapping(address => uint) public balanceOf;

    function transfer(address to, uint amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount);
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    function credit(address to, uint amount) public {
        balanceOf[to] += amount;
        totalSupply += amount;
    }

    function debit(address from, uint amount) public {
        balanceOf[from] -= amount;
        totalSupply -= amount;
    }
}
