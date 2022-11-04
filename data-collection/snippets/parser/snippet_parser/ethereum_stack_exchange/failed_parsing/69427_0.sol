struct userData {
    string name;
    string role;   
    mapping (address => uint) accountToId;    
}

mapping (address => userData) addressToUserData; 

function register(string _name, string _role) public {
    require(_name !== false); 
    require(addressToUserData[msg.sender] == false); 
    addressToUserData[msg.sender] = userData(_name, _role);
}
