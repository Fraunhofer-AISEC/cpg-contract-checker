pragma solidity ^0.5.0;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol';

contract SubToken{
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    
    function transfer(address to, uint tokens) public returns (bool success) ;
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}
contract MainContrat is SubToken {
    mapping(address => uint) balances;

    mapping(address => mapping(address => uint)) allowed;
    mapping(address => address[]) public created;

    mapping(address => SubToken) public tokenlist;

    address[] public contracts;
    address owner = msg.sender;

    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    constructor(string memory _name,string memory _symbol,uint8 _decimals,uint256 _totalSupply)  public{
        name = _name;
        symbol = _symbol;
        decimals=_decimals;
        balances[msg.sender]=_totalSupply;
    }    

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view  returns (uint256 balance) {
        return balances[_owner];
    }


    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        emit Transfer(_from, _to, _value);
        return true;
    }

    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);


}

contract factory{
    address[] public contracts;
    mapping(address => address[]) public created;

    function createNewContract(string memory _name,string memory _symbol,uint8 _decimals,uint256 _totalSupply) public returns(address){
    MainContrat st = new MainContrat(_name,_symbol,_decimals,_totalSupply);
    contracts.push(address(st));
    return address(st);
    }
}
