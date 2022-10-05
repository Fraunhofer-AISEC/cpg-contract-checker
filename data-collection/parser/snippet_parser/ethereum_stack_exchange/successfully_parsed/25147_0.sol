pragma solidity ^0.4.15;


contract SafeMath {
function safeMul(uint a, uint b) internal returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
}

function safeDiv(uint a, uint b) internal returns (uint) {
    assert(b > 0);
    uint c = a / b;
    assert(a == b * c + a % b);
    return c;
}

function safeSub(uint a, uint b) internal returns (uint) {
    assert(b <= a);
    return a - b;
}

function safeAdd(uint a, uint b) internal returns (uint) {
    uint c = a + b;
    assert(c >= a);
    return c;
}

function max64(uint64 a, uint64 b) internal constant returns (uint64) {
    return a >= b ? a : b;
}

function min64(uint64 a, uint64 b) internal constant returns (uint64) 
{
    return a < b ? a : b;
}

function max256(uint256 a, uint256 b) internal constant returns 
(uint256) {
    return a >= b ? a : b;
}

function min256(uint256 a, uint256 b) internal constant returns 
(uint256) {
    return a < b ? a : b;
}


function assert(bool assertion) internal {
    if (!assertion) {
        throw;
    }
}
 }

 contract ERC20Basic {
uint public totalSupply;
function balanceOf(address who) constant returns (uint);
function transfer(address to, uint value);
event Transfer(address indexed from, address indexed to, uint value);
 }

  contract ERC20 is ERC20Basic {
function allowance(address owner, address spender) constant returns 
(uint);

function transferFrom(address from, address to, uint value);
function approve(address spender, uint value);
event Approval(address indexed owner, address indexed spender, uint 
value);
 }

 contract BasicToken is ERC20Basic, SafeMath {

mapping(address => uint) balances;

     

function transfer(address _to, uint _value) {
    balances[msg.sender] = safeSub(balances[msg.sender], _value);
    balances[_to] = safeAdd(balances[_to], _value);
    Transfer(msg.sender, _to, _value);
}

      
function balanceOf(address _owner) constant returns (uint balance) {
    return balances[_owner];
}

 }


 contract StandardToken is BasicToken, ERC20 {

mapping (address => mapping (address => uint)) allowed;

function transferFrom(address _from, address _to, uint _value) {
    var _allowance = allowed[_from][msg.sender];

    
    

    balances[_to] = safeAdd(balances[_to], _value);
    balances[_from] = safeSub(balances[_from], _value);
    allowed[_from][msg.sender] = safeSub(_allowance, _value);
    Transfer(_from, _to, _value);
}

function approve(address _spender, uint _value) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
}

function allowance(address _owner, address _spender) constant returns 
(uint remaining) {
    return allowed[_owner][_spender];
} 

 }

 contract Ownable {
   address public owner =0x00000;


   
   function Ownable() {
     owner = msg.sender;
   }


   
   modifier onlyOwner() {
     require(msg.sender == owner);
_;
   }


   
   function transferOwnership(address newOwner) onlyOwner {
     require(newOwner != address(0));      
     owner = newOwner;
   }

 }

contract CrowdsaleToken is StandardToken , Ownable {


   uint public startBlock= block.timestamp;
   uint public endBlock= startBlock + noOfSec;



  string public constant name = "EcoToken";
  string public constant symbol = "ECT";
  uint public constant decimals = 0;
  
  address public constant multisig = 0x000000; 
  uint public constant INITIAL_SUPPLY = 10000;

 function CrowdsaleToken() {
balances[msg.sender] = INITIAL_SUPPLY;
  }


  
  uint public constant PRICE = 400;

   function () payable {
     createTokens(msg.sender);
   }

   function createTokens(address recipient) payable {
     if (msg.value == 0) {
       throw;
     }

require(now >= startBlock && now <= endBlock); 

uint tokens = safeDiv(safeMul(msg.value * 1.01 ether, getPrice()), 1000000000000000000 ether);
totalSupply = safeAdd(safeAdd(totalSupply, tokens), INITIAL_SUPPLY);

balances[recipient] = safeAdd(balances[recipient], tokens);

if (!multisig.send(msg.value)) {
  throw;
}
  }


  function getPrice() constant returns (uint result) {
    return PRICE;
}
  }
