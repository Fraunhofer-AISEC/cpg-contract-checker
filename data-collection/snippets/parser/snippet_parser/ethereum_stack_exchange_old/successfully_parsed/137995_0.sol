
pragma solidity ^0.8.17;

contract SavingsContract{

address owner;
uint8 interestPerMinute = 20; 
uint timeUploaded;

struct Savers{
    address saver;
    uint savedAmount;
    uint dateOfDeposit;
}
Savers[] public savers;

constructor(){
    owner = msg.sender;
    timeUploaded = block.timestamp;
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

function calculateEarnedInterest() view public returns(uint){
    uint storedTime;
    uint interestEarned;
    uint storedAmount;
    for (uint i=0; i <= savers.length; ++i){
        Savers storage savingsAccount = savers[i];
        if (msg.sender == savingsAccount.saver){
            storedTime = (block.timestamp - savingsAccount.dateOfDeposit) / 1 minutes;
            interestEarned = storedTime * interestPerMinute;
            storedAmount = savingsAccount.savedAmount;
            storedAmount = storedAmount + storedAmount * interestEarned / 10000;
            return storedAmount;
        }
    }
    revert("User not found!");
}

function withdraw() payable public {
    uint storedTime;
    uint interestEarned;
    uint storedAmount;
    for (uint i=0; i <= savers.length; ++i){
        Savers storage savingsAccount = savers[i];
        if (msg.sender == savingsAccount.saver){
            storedTime = (block.timestamp - savingsAccount.dateOfDeposit) / 1 minutes;
            interestEarned = storedTime * interestPerMinute;
            storedAmount = savingsAccount.savedAmount;
            storedAmount = storedAmount + storedAmount * interestEarned / 10000;
            payable(savingsAccount.saver).transfer(storedAmount);
            savers[i] = savers[savers.length - 1];
            savers.pop();
        }
    }
    revert("User not found!");
}

function viewContractBalance() public view returns(uint){
    return address(this).balance;
}
function addCapital() payable public onlyOwner{}
}