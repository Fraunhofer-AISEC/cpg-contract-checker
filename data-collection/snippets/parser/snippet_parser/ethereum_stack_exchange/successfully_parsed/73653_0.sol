pragma solidity ^0.5.0;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol';

contract SubToken{
    using SafeMath for uint;

    struct token{ 
        string  name; 
        string   symbol; 
        uint8  decimals; 
        uint  totalSupply;  
    }

    token public mytokens;

    mapping(address => token) Tokens;
    mapping(address => uint) balances;

    constructor(string memory _name,string memory _symbol,uint8 _decimals,uint256 _totalSupply)  public{  
        mytokens = token(_name,_symbol,_decimals,_totalSupply);
        balances[msg.sender]=_totalSupply;  
    }

    function getInformations(address contract_address) public view returns(string memory name,string memory symbol,uint8 decimals,uint totalSupply){
        return (Tokens[contract_address].name,Tokens[contract_address].symbol,Tokens[contract_address].decimals,Tokens[contract_address].totalSupply);
    }

    
    
    
    
    

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}
contract MainContract {
    mapping(address => mapping(address=>uint)) balances;

    mapping(address => mapping(address => uint)) allowed;

    address[] public contracts;

    using SafeMath for uint;

    address contract_address;

    struct token{ 
        string  name; 
        string   symbol; 
        uint8  decimals; 
        uint  totalSupply;  
    } 
    mapping(address => token) public tokens;

    function createNewContract(string memory _name,string memory _symbol,uint8 _decimals,uint256 _totalSupply) public returns(address youraddress){ 
        SubToken st = new SubToken(_name,_symbol,_decimals,_totalSupply);
        tokens[address(st)] = token(_name,_symbol,_decimals,_totalSupply);
        return(address(st));
    } 


    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}
