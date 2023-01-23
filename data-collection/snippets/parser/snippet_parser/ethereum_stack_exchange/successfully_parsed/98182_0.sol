event transfer(address indexed from, address indexed to, uint value);
    event Approval (address indexed owner, address indexed spender, uint value);
    
    constructor(){
        balances[msg.sender] = totalSupply; 
    }
    
    function balanceOf(address owner) public view   returns(uint) {
        return balances[owner];  
    }
    
    function transfer(address to, uint value) public  returns(bool) {
        require(balanceOf(msg.sender) >= value, 'balance too low');
        balances[to] +=value;
        balances[msg.sender] -=value;
        emit transfer(msg.sender, to, value);
        return true;
    }
