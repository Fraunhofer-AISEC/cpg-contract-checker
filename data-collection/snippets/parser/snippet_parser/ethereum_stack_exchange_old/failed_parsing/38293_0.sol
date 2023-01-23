string public constant name = "YOURCOIN";
string public constant symbol = "YRC";
uint8 public constant decimals = 8;  
uint256 public constant tokenCreationRate = 1500;
uint256 public constant tokenCreationCap = 10000 ether * tokenCreationRate;
uint256 public constant tokenCreationMin = 1000 ether * tokenCreationRate;
address public coinOwner; 
uint256 totalTokens; 
mapping (address => uint256) balances;

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Refund(address indexed _from, uint256 _value);

function YourTokenToken() {
    coinOwner = msg.sender;
}



function create() payable external {

    if (msg.value == 0) throw;
    if (msg.value > (tokenCreationCap - totalTokens) / tokenCreationRate)
        throw;

    var numTokens = msg.value * tokenCreationRate;
    totalTokens += numTokens;
    
    balances[msg.sender] += numTokens;
    
    Transfer(0, msg.sender, numTokens);
}
