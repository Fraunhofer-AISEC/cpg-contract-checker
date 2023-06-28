
pragma solidity >=0.6.0 <0.9.0;

contract UserData {

    address owner;
    uint bal;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function getBalance() view public returns(uint) {
        return bal;
    }

    function deposit(uint amt) external payable {
        bal = bal + amt;
        bal += msg.value;
    }

    
    function getOwner() public view returns (address) {    
        return owner;
    }
    
    
    function getUserBalance() public view returns(uint256){
        return owner.balance;
    }

    function withdraw(uint withdrawAmount) external payable {
        require(msg.sender == owner, "Only owner can withdraw!");
        payable(msg.sender).transfer(withdrawAmount);
    }
}
