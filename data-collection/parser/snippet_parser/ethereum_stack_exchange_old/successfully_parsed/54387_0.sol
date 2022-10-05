pragma solidity 0.5.1;

contract Holdem {

    mapping(address => uint) public balances;

    event LogDeposit(address sender, uint amount);
    event LogWithdrawal(address receiver, uint amount);
    event LogTransfer(address sender, address receiver, uint amount);

    function depost() public payable {
        balances[msg.sender] += msg.value;
        emit LogDeposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        uint bal = balances[msg.sender];
        require(bal >= amount, "Insufficient Funds.");
        balances[msg.sender] -= amount;
        emit LogWithdrawal(msg.sender, amount);
        msg.sender.transfer(amount);
    }

    function transfer(uint amount, address receiver) public {
        uint bal = balances[msg.sender];
        require(bal >= amount, "Insufficient Funds.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit LogTransfer(msg.sender, receiver, amount);
    }

}
