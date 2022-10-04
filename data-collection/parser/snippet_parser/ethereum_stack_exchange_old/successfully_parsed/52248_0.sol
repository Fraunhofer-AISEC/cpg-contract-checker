pragma solidity ^0.4.24;

contract owned {
    address public owner;
    event OwnershipTransferred(address indexed previousOwner, address 
    indexed newOwner);
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
interface tokenRecipient { function receiveApproval(address _from, 
uint256 _value, address _token, bytes _extraData) external; }

contract TokenERC20 {
    function totalSupply () public constant returns (uint256 totalSuppy);
    function balanceOf(address _owner) public constant returns (uint256 
    balance);
    function transfer(address _to, uint256 _value) public returns (bool 
    success);
    function transferFrom(address _from, address _to, uint256 _value) 
    public 
    returns (bool success);
    function approve(address _spender, uint256 _value) public returns 
    (bool success);
    function allowance(address _owner, address _spender) public constant 
    returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 
    _value);
    event Approval(address indexed _owner, address indexed _spender, 
    uint256 _value);
    event FrozenFunds(address target, bool frozen);
    event Burn(address indexed from, uint256 value);
}
contract EdenToken is TokenERC20, owned {
    string public name;
    string public symbol;
    uint8 public decimals = 8;
    uint256 public totalSupply;  
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;  
    mapping (address => bool) public frozenAccount;

    constructor(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        owner = msg.sender;       
        totalSupply = initialSupply * 10 ** uint256(decimals);  
        balanceOf[msg.sender] = totalSupply;                
        name = tokenName;                                   
        symbol = tokenSymbol;                               
    }

    function _transfer(address _from, address _to, uint _value) internal 
    {
        require(_to != 0x0);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        require(!frozenAccount[_from]);
        require(!frozenAccount[_to]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }


    function transfer(address _to, uint256 _value) public returns (bool) 
    {
        require(!frozenAccount[msg.sender]);
        _transfer(msg.sender, _to, _value);
        require(_to != address(owner));
        transfer(_to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) 
    public returns (bool) {
        require(!frozenAccount[msg.sender]);
        require(_value <= allowance[_from][msg.sender]);  
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);    
        require(_to != address(owner));
        transferFrom(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public 
    returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        require(_spender != address(owner));
        approve(_spender, _value);
        return true;
    }
    function approveAndCall(address _spender, uint256 _value, 
    bytes_extraData)
    public
    returns (bool success) {
    tokenRecipient spender = tokenRecipient(_spender);
    if (approve(_spender, _value)) {
    spender.receiveApproval(msg.sender, _value, this, _extraData);
    return true;
    }
}
    function burn(uint256 _value) onlyOwner public returns (bool success) 
    {
        require(balanceOf[msg.sender] >= _value);   
        balanceOf[msg.sender] -= _value;            
        totalSupply -= _value;                      
        emit Burn(msg.sender, _value);
        return true;
    }


    function burnFrom(address _from, uint256 _value) onlyOwner public 
    returns (bool success) {
        require(balanceOf[_from] >= _value);                
        require(_value <= allowance[_from][msg.sender]);    
        balanceOf[_from] -= _value;                         
        allowance[_from][msg.sender] -= _value;             
        totalSupply -= _value;                              
        emit Burn(_from, _value);
        return true;
    }

    function mintToken(address target, uint256 mintedAmount) public 
    onlyOwner {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(0, owner, mintedAmount);
        emit Transfer(owner, target, mintedAmount);
    }

    function freezeAccount(address target, bool freeze) public onlyOwner 
    {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
    function setName(string _name) onlyOwner public {
        name = _name;
    }
}
