 function AddPlayer(string _name, string _role) public returns (bool){
 players[msg.sender].name=_name;
 players[msg.sender].Paddress=msg.sender;
 players[msg.sender].role = _role; 
 return true;
    }
 modifier onlyuser() {
    require(msg.sender == user, "Only user can call this method");
    _;}
modifier onlyheros() {
    require(msg.sender == hero, "Only hero can call this method");
    _;}

    
function Request() onlyuser external payable returns(bool) {
    balances[msg.sender] += msg.value;
    }
    
    
function Reward() onlyhero external payable returns (bool) {
    balances[msg.sender] += msg.value;
    user.transfer(msg.value);
    }    
