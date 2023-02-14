mapping(address => uint) public balances;
mapping(address => mapping(address => uint)) public allowance;

event Transfer(address indexed from, address indexed to, uint token);
event Approval(address indexed tokenOwner, address indexed spender, uint token);

constructor () {
    balances[msg.sender] = totalSuply;
}


function balanceOf(address owner) public view returns(uint) {
    return balances[owner];
}

function transfer(address to, uint token) public returns(bool) { 
    require(balanceOf(msg.sender) >= token, 'balance too low');
    require(token > 0, "Transfer amount must be greater than zero");
    balances[to] += token;
    balances[msg.sender] -= token;          
    emit Transfer(msg.sender, to, token);
    return true;
}

function transferFrom(address from, address to, uint token) public returns(bool) {
    require(balanceOf(from) >= token, 'balance too low');
    require(allowance[from][msg.sender] >= token, 'allowance too low');
    allowance[from][msg.sender] -= token;
    balances[to] += token;
    balances[from] -= token;
    emit Transfer(from, to, token);
    return true;
}

function approve(address spender, uint token) public returns(bool) {
    allowance[msg.sender][spender] = token;
    emit Approval(msg.sender, spender, token);
    return true;
}
