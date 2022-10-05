pragma solidity ^0.4.17;

contract HouseholdFactory{
    address[] public deployedHouseholds;
    mapping (address => uint) public balances;
    address public owner;

    constructor() public{
        owner = address(this);
    }

    function createHousehold(uint capacity ) public{
        address newHousehold = new Household(capacity, msg.sender, owner);
        deployedHouseholds.push(newHousehold);
    }

    function getDeployedHouseholds() public view returns (address[]) {
        return deployedHouseholds;
    }
}
contract Household{

uint public demand;
uint public supply;
uint public batteryCapacity;
uint public amountOfCharge;
uint public excessEnergy;



struct Bid{
    address origin;
    uint price;
    uint amount;
    uint date;
}

Bid[] public Bids;
Bid[] public Asks;
address public owner;
address public contractAddress;
address public parent;
address public exchangeAddress;
uint public balanceContract;
Exchange ex;


constructor(uint capacity, address creator, address watch_address) public {
    owner = creator;
    batteryCapacity = capacity;
    parent = watch_address;
    contractAddress = address(this);
}

function deposit() public payable {
}

function () public payable {}

function getBids(uint index) public view returns(address, uint, uint, uint){
    return (Bids[index].origin,
            Bids[index].price,
            Bids[index].amount,
            Bids[index].date
    );
}

function getAsks(uint index) public view returns(address, uint, uint, uint){
    return (Asks[index].origin,
            Asks[index].price,
            Asks[index].amount,
            Asks[index].date
    );
}

function setExchange(address exchange) public {
    exchangeAddress = exchange;
}

function charge(uint amount) public {
    require(msg.sender == owner);
    amountOfCharge += amount;
}

function discharge(uint amount) public {
    require(msg.sender == owner);
    amountOfCharge -= amount;
}

function submitBid(uint price, uint amount) public {
    Bid memory newBid = Bid({
        origin: contractAddress,
        price: price,
        amount: amount,
        date: now
    });

    Bids.push(newBid);
    ex = Exchange(exchangeAddress);
    ex.submitBid(price, amount);
}

function submitAsk(uint price, uint amount) public {
    Bid memory newAsk = Bid({
        origin: contractAddress,
        price: price,
        amount: amount,
        date: now
    });

    Asks.push(newAsk);
    ex = Exchange(exchangeAddress);
    ex.submitAsk(price, amount);
}

function buyEnergy(uint amount, address recipient, uint price ) external payable returns(bool successful){
    require(address(this).balance < price);

    amountOfCharge += amount;

    recipient.transfer(price*amount/1000); 
    return true;
}

function sellEnergy(uint amount, address recipient, uint price ) public {

    if(amountOfCharge>amount){
        amountOfCharge -= amount;
    }

    recipient.transfer(price*amount/1000);
}

}
