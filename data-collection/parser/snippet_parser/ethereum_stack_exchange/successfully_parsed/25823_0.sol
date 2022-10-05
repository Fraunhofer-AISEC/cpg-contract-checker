pragma solidity ^0.4.11;


library SafeMath {

    function mul(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal constant returns (uint256) {
        
        uint256 c = a / b;
        
        return c;
    }

    function sub(uint256 a, uint256 b) internal constant returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal constant returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Owned {

    
    address public owner;

    
    function Owned() {
        owner = msg.sender;
    }

    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    
    function transferOwnership(address _newOwner) onlyOwner {
        owner = _newOwner;
    }
}



contract Token {
    
    
    uint256 public totalSupply;

    
    
    function balanceOf(address _owner) constant returns (uint256 balance);

    
    
    
    
    function transfer(address _to, uint256 _value) returns (bool success);

    
    
    
    
    
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

    
    
    
    
    function approve(address _spender, uint256 _value) returns (bool success);

    
    
    
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}


contract StandardToken is Token {

    using SafeMath for uint;

    
    bool public locked;

    
    mapping (address => uint256) balances;

    
    mapping (address => mapping (address => uint256)) allowed;

    
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    
    function transfer(address _to, uint256 _value) returns (bool success) {

        
        require(!locked);

        
        require(balances[msg.sender] >= _value);

        
        require(balances[_to].add(_value) >= balances[_to]);

        
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);

        
        Transfer(msg.sender, _to, _value);
        return true;
    }

    
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {

        
        require(!locked);

        
        require (balances[_from] >= _value);

        
        require(balances[_to].add(_value) >= balances[_to]);      

        
        require (_value <= allowed[_from][msg.sender]);

        
        balances[_to] = balances[_to].add(_value);
        balances[_from] = balances[_from].sub(_value);

        
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);

        
        Transfer(_from, _to, _value);
        return true;
    }

    
    function approve(address _spender, uint256 _value) returns (bool success) {

        
        require(!locked);

        
        allowed[msg.sender][_spender] = _value;

        
        Approval(msg.sender, _spender, _value);
        return true;
    }


    
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
    return allowed[_owner][_spender];
    }
}


contract SMPToken is Owned, StandardToken {

    
    string public standard = "Token 0.1";

    
    string public name = "Simple Token";        

    
    string public symbol = "SMP";

    
    uint8 public decimals = 8;

    
    uint256 maxSupply = 100000000 * 10**8;

    
    function SMPToken() {  
        balances[msg.sender] = 0;
        totalSupply = 0;
        locked = true;
    }

    
    function lock() onlyOwner returns (bool success) {
        locked = true;
        return true;
    }

    
    function unlock() onlyOwner returns (bool success) {
        locked = false;
        return true;
    }

    
    function issue(address _recipient, uint256 _value) onlyOwner returns (bool success) {

        
        require(_value > 0);

        _value = _value * 10**8;

        
        require(totalSupply.add(_value) <= maxSupply);

        
        balances[_recipient] = balances[_recipient].add(_value);
        totalSupply = totalSupply.add(_value);

        
        Transfer(0, owner, _value);
        Transfer(owner, _recipient, _value);

        return true;
    }

    
    function () payable {
        revert(); 
    }
}
