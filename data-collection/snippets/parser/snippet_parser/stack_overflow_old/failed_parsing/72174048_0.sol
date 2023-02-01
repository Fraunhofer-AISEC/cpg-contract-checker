string public name; 
string public symbol; 
uint8 public decimals; 
uint256 public totalSupply; 
mapping(address => uint256) public balanceOf; 
mapping(address => mapping(address => uint256)) public allowance; 

event Transfer(address indexed desde, address indexed para, uint256 valor); 
event Approval(address indexed propiedario, address indexed autorizado, uint256 valor); 

constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = totalSupply;
    emit Transfer(address(0), msg.sender, totalSupply);
}

function transfer(address para, uint256 valor) public returns (bool) { 
    require(balanceOf[msg.sender] >= valor, "Fondos insuficientes."); 
    balanceOf[msg.sender] -= valor; 
    balanceOf[para] += valor; 
    emit Transfer(msg.sender, para, valor); 
    return true;
}

function approve(address gastador, uint256 valor) public returns (bool) { 
    require( balanceOf[msg.sender] >= valor, "Fondos Insuficientes." ); 
    allowance[msg.sender][gastador] = valor; 
    emit Approval(msg.sender, gastador, valor); 
    return true; 
}

function transferFrom(address desde, address para, uint256 valor) public returns (bool) {
    require(allowance[desde][msg.sender] >= valor, "No tienes permiso para transferir."); 
    require(balanceOf[desde] >= valor, "Fondos insuficientes."); 

    balanceOf[desde] -= valor; 
    allowance[desde][msg.sender] -= valor; 
    balanceOf[para] += valor; 

    emit Transfer(desde, para, valor); 
    return true;
}
