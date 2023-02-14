
pragma solidity 0.8.7;
contract PiggyBank{
    event Deposit(uint amount);
    event Withdraw(uint amount);
    receive() external payable {
        emit Deposit(msg.value);
    }
    address public owner = msg.sender;
    function withdraw() external{
        require(msg.sender ==owner ,"not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
