pragma solidity ^0.4.21;

contract PiggyBank {

    address public owner;

    event LogDeposit(address sender, uint amount);
    event LogWithdrawal(address sender, uint amount);

    function PiggyBank() public {
        owner = msg.sender; 
    }

    function deposit() public payable returns(bool success) {
        emit LogDeposit(msg.sender, msg.value);
        return true;
    }

    
    function getBalance() public view returns(uint balance) {
        return address(this).balance;
    }

    function withdraw(uint amount) public returns(bool success) {
        require(msg.sender==owner);
        emit LogWithdrawal(msg.sender, amount);
        msg.sender.transfer(amount);
        return true;
    }

}
