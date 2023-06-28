
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SavingsContract is ReentrancyGuard{

address owner;
uint8 interest = 10;

struct Savers{
    address saver;
    uint savedAmount;
    uint dateOfDeposit;
}
Savers[] public savers;

constructor(){
    owner = msg.sender;
}
modifier onlyOwner{
    owner == msg.sender;
    _;
}

function depositMoney() payable public {
    require(msg.value <= (msg.sender).balance,"Insufficient funds");
    require(msg.value >= 10000, "Need to send min 10 000 Wei");
    savers.push(Savers(msg.sender, msg.value, block.timestamp));
}
function interestEarned() view public returns(uint){
    uint storedTime;
    for (uint i=0; i < savers.length; ++i){
        Savers storage savingsAccount = savers[i];
        if (msg.sender == savingsAccount.saver){
            storedTime = block.timestamp - savingsAccount.dateOfDeposit;
            return (savingsAccount.savedAmount);
        }
    }
}
function withdraw() external nonReentrant {
    uint storedTime;
    for (uint i=0; i < savers.length; ++i){
        Savers storage savingsAccount = savers[i];
        if (msg.sender == savingsAccount.saver){
            storedTime = block.timestamp - savingsAccount.dateOfDeposit;
            payable(msg.sender).transfer(savingsAccount.savedAmount);
            savers[i] = savers[savers.length - 1];
            savers.pop();
        }
    }
    revert("User not found!");
}

function viewContractBalance() public view returns(uint){
    return address(this).balance;
}
}
