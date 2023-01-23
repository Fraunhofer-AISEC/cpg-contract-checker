  pragma solidity ^0.4.4;
contract SafeMath{
  function safeMul(uint a, uint b) internal pure returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function safeDiv(uint a, uint b) internal pure returns (uint) {
    assert(b > 0);
    uint c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

    function safeSub(uint a, uint b) internal pure returns (uint) {
        assert(b <= a);
        return a - b;
  }

    function safeAdd(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        assert(c >= a);
        return c;
  }

}


contract ERC20{

uint256 public totalSupply;
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);

 function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);

}

contract TestIco is ERC20, SafeMath{


    mapping(address => uint256) balances;

    uint256 public totalSupply;


    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        balances[msg.sender] = safeSub(balances[msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    mapping (address => mapping (address => uint256)) allowed;

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        var _allowance = allowed[_from][msg.sender];

        balances[_to] = safeAdd(balances[_to], _value);
        balances[_from] = safeSub(balances[_from], _value);
        allowed[_from][msg.sender] = safeSub(_allowance, _value);
        Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }




    uint256 public endTime;

    modifier during_offering_time(){
        require(now <= endTime);
        _;
    }

    function () public payable during_offering_time {
        createTokens(msg.sender);
    }

    function createTokens(address recipient) public payable {
        require(msg.value != 0);

        uint tokens = safeDiv(safeMul(msg.value, price), 1 ether);
        totalSupply = safeAdd(totalSupply, tokens);

        balances[recipient] = safeAdd(balances[recipient], tokens);

        
    }




    string  public name = "TestIco";
    string  public symbol = "SCO";
    uint    public decimals = 3;
    uint256 public INITIAL_SUPPLY = 10000;
    uint256 public price;
    address public owner;

    function TestIco() public {
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;  
        endTime = now + 1 weeks;
        owner   = msg.sender;
        price   = 500;
    }

}
