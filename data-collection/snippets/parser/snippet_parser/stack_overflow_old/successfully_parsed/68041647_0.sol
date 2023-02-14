pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"; 


contract SharedWallet is Ownable {
    
    mapping(address => uint) public allowance;
    
    modifier ownerOrAllowed(uint _amount) {
        require(onlyOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }
    
    function addAllowance(address _who, uint _amount) public ownerOrAllowed(_amount) {
        allowance[_who] = _amount;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public onlyOwner{
        _to.transfer(_amount);
    }
    
    receive() external payable {

    }
}

