uint userCount=0;
mapping (address => UserAccount) public accounts;

function createAccount(string _name, uint _id, address _address) onlyOwner() public {
    UserAccount user;
    user.name = _name;
    user.id = _id;
    accounts[_address] = user;
    userCount += 1;
    
    
    
    emit UserCreated(_address, _id, _name);
}

modifier onlyOwner() {
    require(msg.sender == owner);
    _;        
}
