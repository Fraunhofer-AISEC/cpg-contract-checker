contract Bank {
struct Customer {
    address _address; 
    uint deposit;
}

address owner;
mapping(address => Customer) public customerList;
uint customerCounter;

constructor() public payable {
    require(msg.value == 30 ether, "Initial funding of 30 ether required for rewards");
    
    owner = msg.sender;
    customerCounter = 0;
}

function enroll() public returns(uint){
    customerList[msg.sender].deposit = 5;
    customerList[msg.sender]._address = msg.sender;
    customerCounter++;

    return customerList[msg.sender].deposit;
}
}