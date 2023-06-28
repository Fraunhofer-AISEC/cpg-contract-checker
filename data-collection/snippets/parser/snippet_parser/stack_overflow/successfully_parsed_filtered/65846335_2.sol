pragma solidity ^0.5.11; 

contract SwapTest {
    address public manager;
    
    constructor() public {
        manager = msg.sender;
    }
    
    modifier OnlyManager() {
        require(msg.sender == manager);
        _;
    }
    
    
    function contribute() external payable {}
    
    
    
    function getBalance() external view returns(uint) {
        return address(this).balance;    
    } 
    
    
    function sendEther (address payable recipient, uint weiAmount) external OnlyManager{
        recipient.transfer(weiAmount);    
    }
    
    
    function withdrawBalance (address payable recipient) external OnlyManager{
        recipient.transfer(address(this).balance);
    }
}
