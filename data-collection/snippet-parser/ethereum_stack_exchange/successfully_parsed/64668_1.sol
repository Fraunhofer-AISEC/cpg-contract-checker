contract Hacker {
Dao dao;
address userAddress; 
string userName;

constructor(string userName, address daoAddress) public {
    dao = Dao(daoAddress);
    userAddress = msg.sender;
    userName = userName;
}

function addToBalence(string name, uint amount) public payable {
    dao.addToBalence(userName).value(msg.value)(); 
}

function showBalence() public returns(uint){
    return dao.showBalence();
}

function payout(uint amount) public payable{
    dao.withdraw(amount);
}
}
