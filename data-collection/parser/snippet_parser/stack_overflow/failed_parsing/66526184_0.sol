pragma solidity ^0.8.0;

contract sendMoney {
    
    uint public balanceRecieved;
    
    function recieveMoney()public payable {
        balanceRecieved += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney() public {
        to payable(msg.sender)   = address;
        to.transfer(this.getBalance());
    }
}
