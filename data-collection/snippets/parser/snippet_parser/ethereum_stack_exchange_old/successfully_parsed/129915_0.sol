    pragma solidity ^0.5.1;

library SafeMath { 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a); 
      return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
     
      return c;
    }
}

contract SmartContract {          
   

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    modifier onlyOwner  {
        require (msg.sender == ownerCon);
        _;
    }
    
    mapping(address => uint256) balances;  
    

    uint256 totalSupply_;
    address ownerCon;
    using SafeMath for uint256;
    string public constant name = "SmartCoin"; 
    string public constant symbol = "SC"; 
    uint8 public constant decimals = 18;     



    }
