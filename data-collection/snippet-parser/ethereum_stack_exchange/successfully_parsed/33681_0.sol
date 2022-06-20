pragma solidity ^0.4.18;

contract TransferFunds{
    address owner;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    function TransferFunds() public
    {
        owner = msg.sender;
        return;
    }
    function send(address receiver, uint amount) public returns(address, uint, address, uint)
    {
        if (owner.balance < amount) return (msg.sender,owner.balance,receiver,balances[msg.sender]);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Sent(owner, receiver, amount);
    }
}
