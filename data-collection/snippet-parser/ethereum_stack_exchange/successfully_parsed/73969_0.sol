pragma solidity ^0.5.0; 
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol'; 

contract SubToken{ 
    MainContract mc;

    constructor(address _address) public{  
       mc=MainContract(_address);

    }  

    function getName1() view public returns(string memory){
        return mc.getNameMain(address(this));
    }



    
    
    
    
    

    event Transfer(address indexed from, address indexed to, uint tokens); 
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens); 

} 
contract MainContract {
    

    

    address[] public contracts;

    using SafeMath for uint;

    address contract_address;

    struct token{ 
        string  name; 
        string   symbol; 
        uint8  decimals; 
        uint  totalSupply; 
        uint balances;
    } 
    mapping(address => token) public tokens;

    address mycontraddress;

    function createNewContract(string memory _name,string memory _symbol,uint8 _decimals,uint256 _totalSupply,uint _balance) public returns(address youraddress){ 
        SubToken st = new SubToken(address(this));
        tokens[address(st)] = token(_name,_symbol,_decimals,_totalSupply,_balance);
        mycontraddress=address(st);
        return mycontraddress;
    } 
    function seeContracttAddress() public view returns(address){
        return mycontraddress;
    }

    function getNameMain(address _address) public view returns(string memory){
        return tokens[_address].name;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}
