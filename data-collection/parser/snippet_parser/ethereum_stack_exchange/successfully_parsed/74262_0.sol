pragma solidity ^0.5.0 ;  
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol'; 

contract SubToken{  
    MainContract mc; 

    constructor(address _address) public payable {   
       mc= MainContract(_address); 
    }   

    function name() view public returns(string memory){ 
        return mc.name(address(this)); 
    } 
    function symbol() view public returns(string memory){ 
        return mc.symbol(address(this)); 
    } 
    function decimal() view public returns(uint){ 
        return mc.decimal(address(this)); 
    } 
    function totalSupply() view public returns(uint){ 
        return mc.totalSupply(address(this)); 
    } 

    function balanceOf(address account) view public returns(uint){ 
        return mc.balanceOf(address(this), account); 
    } 

    function transfer(address recipient , uint amount) public returns (bool){ 
        mc.transfer(address(this), msg.sender, recipient, amount);
        emit Transfer(msg.sender, recipient, amount);
        return true; 
    } 

    event Transfer(address indexed from, address indexed to, uint tokens);  
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);  

}  
contract MainContract { 

    using SafeMath for uint; 

    struct token{  
        string  name;  
        string   symbol;  
        uint8  decimals;  
        uint  totalSupply;  
        mapping (address => uint)  _balances;
        mapping (address => mapping (address => uint256))  _allowances;
    }

    mapping(address => token) public tokens; 

    function createNewContract(string memory _name,string memory _symbol,uint8 _decimals,uint _totalSupply) public returns(address youraddress){  
        SubToken st = new SubToken(address(this));
        tokens[address(st)] = token(_name,_symbol,_decimals,_totalSupply);
        tokens[address(st)]._balances[msg.sender]=_totalSupply;
        return address(st);
    }  

    function name(address _concractAddress) public view returns(string memory){ 
        return tokens[_concractAddress].name; 
    } 
    function symbol(address _concractAddress) public view returns(string memory){ 
        return tokens[_concractAddress].symbol; 
    } 
    function decimal(address _concractAddress) public view returns(uint8){ 
        return tokens[_concractAddress].decimals; 
    } 
    function totalSupply(address _concractAddress) public view returns(uint){ 
        return tokens[_concractAddress].totalSupply; 
    } 
    function balanceOf(address _concractAddress, address account) public view returns(uint){
        return tokens[_concractAddress]._balances[account];
    }

    function transfer(address _concractAddress, address sender, address recipient, uint amount) public { 
       require(sender != address(0));
       require(recipient != address(0));

       tokens[_concractAddress]._balances[sender] =  tokens[_concractAddress]._balances[sender].sub(amount);
       tokens[_concractAddress]._balances[recipient] =  tokens[_concractAddress]._balances[recipient].add(amount);

       emit Transfer(sender, recipient, amount); 
    } 


    event Transfer(address indexed _from, address indexed _to, uint256 _value); 
    event Approval(address indexed _owner, address indexed _spender, uint256 _value); 

} 
