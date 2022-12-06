address private owner;
    
    constructor() {
        owner = msg.sender;
    }

function makePay() public payable {
        owner.transfer(msg.value);
    } 
