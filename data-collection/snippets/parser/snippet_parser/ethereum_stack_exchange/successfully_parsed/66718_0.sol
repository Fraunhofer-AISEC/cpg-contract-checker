pragma solidity ^0.5.1;

contract ERC20Basic {
    event Transfer(address indexed from, address indexed to, uint tokens);
    mapping(address => uint256) balances;
    uint256 totalSupply_;
    using SafeMath for uint256;

   constructor(uint256 total) public {  
    totalSupply_ = total;
    balances[msg.sender] = totalSupply_;
    }  

    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
}

library SafeMath { 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}
