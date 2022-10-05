pragma solidity ^0.5.0;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol';

contract SubToken{
    mapping(address => uint) balances;

    string  symbol;
    string  name;
    uint8  decimals;
    uint  totalSupply; 

    using SafeMath for uint;

    

    

    address contract_address; 

    constructor(string memory _name,string memory _symbol,uint8 _decimals,uint256 _totalSupply)  public{ 
        name = _name; 
        symbol = _symbol; 
        decimals=_decimals; 
        totalSupply = _totalSupply; 
        balances[msg.sender]=_totalSupply; 
    } 
    
    
    
    
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}
contract MainContrat {
    mapping(address => uint) balances;

    mapping(address => mapping(address => uint)) allowed;
    mapping(address => address[]) public created;

    mapping(address => SubToken) public tokenlist;

    address[] public contracts;
    address owner = msg.sender;

    using SafeMath for uint;

    address contract_address;

    function createNewContract(string memory _name,string memory _symbol,uint8 _decimals,uint256 _totalSupply) public returns(address newAddres){ 
        SubToken mc = new SubToken(_name,_symbol,_decimals,_totalSupply); 
        created[msg.sender].push(address(mc)); 
        contracts.push(address(mc)); 
        return address(mc); 
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        emit Transfer(_from, _to, _value);
        return true;
    }
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}
