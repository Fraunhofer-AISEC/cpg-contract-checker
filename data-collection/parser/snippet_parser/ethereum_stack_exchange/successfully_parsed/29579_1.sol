pragma solidity 0.4.24;

contract eventTickets{

address owner;
uint tickets;
string description;
uint constant price = 1 ether;
mapping (address => uint) public purchasers;

constructor (uint _tickets, string _description) public {
    owner = msg.sender;
    description = _description;
    tickets = _tickets;
}

modifier OnlyBy(){
    assert (owner == msg.sender);
    _;
}

function infoEvent() public view returns (address, string, uint, uint) {
    return(owner, description, tickets, price);
}

function buyTickets(uint amount) public payable {
    if (msg.value < (amount * price) || amount > tickets) {
        revert(); 
    }
    if (msg.value > (amount * price)) {

    msg.sender.transfer(msg.value - (amount * price));
    }
    purchasers[msg.sender] += amount;
    tickets -= amount;
    }

    function refund(uint numTickets) public payable {
        if (purchasers[msg.sender] <= numTickets) {
            revert();
    }
    msg.sender.transfer(numTickets * price);
        purchasers[msg.sender] -= numTickets;
        tickets += numTickets;
    }

    function endSale() public payable OnlyBy(){

        owner.transfer(this.balance);
    }
}