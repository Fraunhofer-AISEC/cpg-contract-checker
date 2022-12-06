contract token{

mapping (address => uint256) public balanceOf;

event Transfer(address indexed from, address indexed to, uint256 value);

function buy() public payable returns (uint amount){
    amount = msg.value;                    
    require(balanceOf[this] >= amount);               
    balanceOf[msg.sender] += amount;                  
    balanceOf[this] -= amount;                        
    Transfer(this, msg.sender, amount);               
    return amount;                                    
}

function sell(uint amount) public returns (uint revenue){
    require(balanceOf[msg.sender] >= amount);         
    balanceOf[this] += amount;                        
    balanceOf[msg.sender] -= amount;                  
    revenue = amount;
    msg.sender.transfer(revenue);                     
    Transfer(msg.sender, this, amount);               
    return revenue;                                   
}
}