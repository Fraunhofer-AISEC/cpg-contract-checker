pragma solidity 0.5.2;

contract WeHaveMoneyToBurn {

    mapping(address => uint) public userBalances;

    event LogDeposit(address depositor, uint amount);
    event LogWithdrawl(address withdrawer, uint amount);
    event LogFundsDestroyed(address victim, uint amount);

    
    function deposit() public payable {
        userBalances[msg.sender] += msg.value;
        emit LogDeposit(msg.sender, msg.value);
    }

    
    function withdraw(uint amount) public {
        require(amount <= userBalances[msg.sender], "Insufficient Funds");
        userBalances[msg.sender] -= amount;
        emit LogWithdrawl(msg.sender, amount);
        msg.sender.transfer(amount);
    }

    
    function burnSome(address burnFrom, uint amount) public {
        require(amount <= userBalances[burnFrom], "User does have that much to burn");
        userBalances[burnFrom] -= amount;
        emit LogFundsDestroyed(burnFrom, amount);
        address(0).transfer(amount);
    }
}
