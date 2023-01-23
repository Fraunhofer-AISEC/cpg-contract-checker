
pragma solidity ^0.8.7;
library SafeMath {
    function Add(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function Sub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function Mul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function Div(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}

contract Token{
    using SafeMath for uint256;
    string public name = 'MY TOKEN';
    string public symbol = 'MTK';
    uint256 public decimals = 18 ;
    uint256 public totalsupply = 10000000000000000000000 ;
    address owner;
    
    uint taxfee = 5;
    uint burnfee = 5;
    bool public istransferable = false;

    


    
    mapping(address=>bool) public ExcludedFromFee;
    
    mapping(address => uint256) public balance;
    mapping(address => mapping(address => uint256)) allowance;
    mapping (address => bool) public _Blacklisted;  

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event OwnershipTransfer(address indexed previousOwner, address indexed newOwner);

    constructor(){
        
        
        
       
        owner = msg.sender;
        balance[owner] = totalsupply;
        ExcludedFromFee[owner] = true;
         _rOwned[msg.sender] = _rTotal;
    }
    function Balance() public view returns(uint256) {
        return balance[owner];
    }
}