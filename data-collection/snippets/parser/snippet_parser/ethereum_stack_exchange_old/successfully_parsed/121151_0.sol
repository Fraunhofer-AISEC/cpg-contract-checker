
pragma solidity ^0.8.11;

import "IERC20.sol";

contract NVMSwap {

address private contractOwner;
IERC20 token;

struct Buyers {
    string name;
    address buyer;
    uint purchasedAt;
    uint256 amount;
}

Buyers private firstBuyer;
mapping (address => uint) private BuyersToIndex; 
Buyers[] public BuyersList;

constructor(){
    token = IERC20(0x000000000000); 
    contractOwner = msg.sender;

    firstBuyer.name = "empty";
    firstBuyer.buyer = payable(0x000000000000000000000000000000000000dEaD);
    firstBuyer.purchasedAt = 0;
    firstBuyer.amount = 0;

    BuyersToIndex[firstBuyer.buyer] = 0;
    BuyersList.push(firstBuyer);
}

modifier OnlyContractOwner {
    require (msg.sender == contractOwner, "Error: You are not the contract owner.");
    _;
}

event newBuyerLog(string name, address buyer, uint purchasedAt);

function buyTokens(string memory name, address buyer) public payable returns(bool){

    require(msg.value >= 1 ether, "Error: The minimum amount to buy has the value of 1 ETH.");

    uint256 forSend = (msg.value * 100) / 10**9;

    Buyers memory newBuyer;
        newBuyer.name = name;
        newBuyer.buyer = buyer;
        newBuyer.purchasedAt = block.timestamp;
        newBuyer.amount = forSend;
        
    BuyersList.push(newBuyer);

    if(msg.value > 1 ether) {
        
        token.transferFrom(address(this), buyer, forSend);
        payable(msg.sender).transfer(msg.value-1 ether);
        
    }

    emit newBuyerLog(name, BuyersList[BuyersToIndex[buyer]].buyer, BuyersList[BuyersToIndex[buyer]].purchasedAt);

    return true;
}

function ContractOwnerWithdraw(uint amount) public OnlyContractOwner {
    require(amount > 0 && amount < address(this).balance, "Error: Required value is bigger than existing amount.");
    payable(msg.sender).transfer(amount);
}

}
