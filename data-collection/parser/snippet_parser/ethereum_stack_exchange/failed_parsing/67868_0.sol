pragma solidity >=0.4.22 <0.6.0;

interface tokenRecipient { 
function receiveApproval(address _from, uint256 _value, address _token, 
 bytes calldata _extraData) external; 
 }

contract BaseToken {

string public name;
string public symbol;
uint8 public decimals = 18;

uint256 public totalSupply;


mapping (address => uint256) public balanceOf;
mapping (address => mapping (address => uint256)) public allowance;


clients
event Transfer(address indexed from, address indexed to, uint256 
 value);


 clients
event Approval(address indexed _owner, address indexed _spender, 
uint256 _value);


event Burn(address indexed from, uint256 value);


constructor() public {
    totalSupply = 10000 * 10 ** uint256(decimals);  
    supply with the decimal amount
    balanceOf[msg.sender] = totalSupply;                
    creator all initial tokens
    name = "BaseToken";                                   
   name for display purposes
    symbol = "BASETOKEN";                               
 symbol for display purposes
}

function getBalance() public pure returns (string memory){
   return  "some string";
}


function _transfer(address _from, address _to, uint _value) internal {
    
    require(_to != address(0x0));
    
    require(balanceOf[_from] >= _value);
    
    require(balanceOf[_to] + _value >= balanceOf[_to]);
    
    uint previousBalances = balanceOf[_from] + balanceOf[_to];
    
    balanceOf[_from] -= _value;
    
    balanceOf[_to] += _value;
    emit Transfer(_from, _to, _value);
    
    code. They should never fail
    assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
}


function transfer(address _to, uint256 _value) public returns (bool 
 success) {
    _transfer(msg.sender, _to, _value);
    return true;
}


function transferFrom(address _from, address _to, uint256 _value) 
 public returns (bool success) {
    require(_value <= allowance[_from][msg.sender]);     
   allowance
    allowance[_from][msg.sender] -= _value;
    _transfer(_from, _to, _value);
    return true;
}


function approve(address _spender, uint256 _value) public
    returns (bool success) {
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
}


function approveAndCall(address _spender, uint256 _value, bytes memory 
 _extraData)
    public
    returns (bool success) {
    tokenRecipient spender = tokenRecipient(_spender);
    if (approve(_spender, _value)) {
        spender.receiveApproval(msg.sender, _value, address(this), 
   _extraData);
        return true;
    }
}


function burn(uint256 _value) public returns (bool success) {
    require(balanceOf[msg.sender] >= _value);   
 has enough
    balanceOf[msg.sender] -= _value;            
 sender
    totalSupply -= _value;                      
    emit Burn(msg.sender, _value);
    return true;
}


function burnFrom(address _from, uint256 _value) public returns (bool 
 success) {
    require(balanceOf[_from] >= _value);                
 targeted balance is enough
    require(_value <= allowance[_from][msg.sender]);    
    allowance
    balanceOf[_from] -= _value;                         
     from the targeted balance
    allowance[_from][msg.sender] -= _value;             
    from the sender's allowance
    totalSupply -= _value;                              
    totalSupply
    emit Burn(_from, _value);
    return true;
}
