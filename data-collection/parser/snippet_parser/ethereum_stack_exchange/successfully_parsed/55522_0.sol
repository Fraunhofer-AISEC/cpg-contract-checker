pragma solidity ^0.4.24;

import"./SafeMath.sol";

contract erc20 {

function totalSupply() public view returns (uint256);
function balanceOf(address who) public view returns (uint256);
function approve(address spender, uint value) public returns (bool);
function transfer(address to, uint256 value) public returns (bool);
function transferFrom(address from, address to, uint256 value) internal         returns (bool);
function mint(uint amount) internal returns (bool);
function burn(address _who, uint256 _value) internal returns (bool);
event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed from, address indexed to, uint256 value);
event TransferFrom(address indexed from, address indexed to, uint256 value);
event Mint(address indexed to, uint256 amount);
event Burn(address indexed burner, uint256 value);
}

 contract Token is erc20 {

 using SafeMath for uint256;

address public owner;
string public name;
string public symbol;
uint public _totalSupply;
uint public maxAmountMintablePerWorkshop;

mapping (address => uint) balances;
mapping (address => mapping(address => uint256)) allowed;

modifier onlyBok()  {
    require (owner == msg.sender);
    _;
}

constructor () public {
    owner = msg.sender;
    name = "Attendance Tokens";
    symbol = "BPBWST";
    _totalSupply = 25;
    maxAmountMintablePerWorkshop = 25;
    balances[owner] = _totalSupply;
    emit Transfer(address(0), owner, _totalSupply);
    }

    function totalSupply() public view returns (uint) {
    return _totalSupply;
    }

    
    function transfer(address _to, uint256 _value) public onlyBok      returns (bool) {
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
    }

   
    function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns   (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
    }

   function transferFrom(address _from, address _to, uint256 _value)   internal returns (bool) {
   require(_value <= balances[_from]);
   require(_value <= allowed[_from][msg.sender]);
   require(_to != address(0));

   balances[_from] = balances[_from].sub(_value);
   balances[_to] = balances[_to].add(_value);
   allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
   emit TransferFrom(_from, _to, _value);
   return true;
   }

   function mint(uint256 _amount) onlyBok() internal returns (bool) {
   require(_amount <= maxAmountMintablePerWorkshop);
   _totalSupply = _totalSupply.add(_amount);
   balances[owner] = balances[owner].add(_amount);
   emit Mint(owner, _amount);
   emit Transfer(address(0), owner, _amount);
   return true;
   }

   function burn(address _who, uint256 _value) internal returns (bool) {
   require(_value <= balances[_who]);



   balances[_who] = balances[_who].sub(_value);
   _totalSupply = _totalSupply.sub(_value);
   emit Burn(_who, _value);
   emit Transfer(_who, address(0), _value);
   return true;
   }

}
