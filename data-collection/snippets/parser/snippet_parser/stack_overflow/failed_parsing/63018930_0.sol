pragma solidity ^0.6.9;

contract Confrence{
    address public organizer;
    mapping (address => uint) public registrantsPaid;
    uint public numRegisrants;
    uint public quota;
    
    
    event Deposit(address _from, uint _amount);
    event Refund(address _to, uint _amount);

     Confrence() public {
        organizer = msg.sender;
        quota = 500;
        numRegistrants = 0; 
    
    }

}
