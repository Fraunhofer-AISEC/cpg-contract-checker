    
pragma solidity >=0.7.0 <0.9.0;
contract Trust {
    struct Kid {
        uint amount;
        uint maturity;
        bool paid;
    }
    
    mapping(address => Kid) public kids;
    address public admin;
    
    constructor() {
        admin = msg.sender;
    }
    
    function addKid(address kid, uint timeToMaturity) external payable {
        require(msg.sender == admin, 'only admin can add children');
        require(kids[kid].amount == 0, 'this child already exists in the system');
        kids[kid] = Kid(msg.value, block.timestamp + timeToMaturity, false);
    }
    
    function withdraw() external {
        Kid storage kid = kids[msg.sender];
        
        require(kid.amount > 0, 'only active and verified kids can withdraw');
        require(kid.maturity <= block.timestamp, 'too early');
        require(kid.paid == false, "that kid's address has already been paid");
        kid.paid = true;
        payable(msg.sender).transfer(kid.amount);
    }
}
