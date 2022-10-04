pragma solidity ^0.5.0;

library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}
contract SubToken{
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    
    function transfer(address to, uint tokens) public returns (bool success) ;
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}
contract token is SubToken {
    mapping(address => uint) _balances;
    mapping(address => mapping(address => uint)) allowed;
    mapping(address => SubToken) public tokenlist;
    address[] public contracts;
    address owner = msg.sender;

    using SafeMath for uint;
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    
    
    

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view  returns (uint256 balance) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {

        return true;

    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        return true;
    }

    
    
    



    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}

contract factory{
    address[] public contracts;

    function createNewContract() public returns(address){
    token st = new token();
    contracts.push(address(st));
    address(st);
    }
}
