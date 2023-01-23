pragma solidity 0.6.6;

contract Event {
    
    address owner;
    uint public tickets;
    string public description;
    string public website;
    uint constant price = 0.01 ether;
    mapping (address => uint) public purchasers;
    
    constructor(uint t,  string memory _description, string memory _webstite) public {
        owner = msg.sender;
        description = _description;
        website = _webstite;
        tickets = t;
    }
    
    
    
    
    
    function buyTickets(uint amount) public payable {
        if (msg.value != (amount * price) || amount > tickets) {
            revert();
        }
        purchasers[msg.sender] += amount;
        tickets -= amount;
        if (tickets == 0) {
            owner.transfer(this.balance);
        }
    }
    
    function refund(uint numTickets)  public {
        if (purchasers[msg.sender] < numTickets) {
            revert();
        }
        
        msg.sender.transfer(numTickets * price);
        purchasers[msg.sender] -= numTickets;
        tickets += numTickets;
    }
    
}
