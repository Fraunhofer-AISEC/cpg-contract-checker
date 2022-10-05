
pragma solidity ^0.5.16;


import "@openzeppelin/contracts/utils/math/SafeMath.sol";

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/utils/math/SafeMath.sol";

contract Token {
    
    using SafeMath for uint256;

    string public name = "Token";
    string public symbol = "TK";
    uint256 public decimals = 18;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf; 

    constructor() public {
        totalSupply = 1000000 * (10 ** decimals);
        balanceOf[msg.sender] = totalSupply;
    }

     
    function transfer(address _to, uint256 _value) public returns(bool success){
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value); 
        balanceOf[_to] = balanceOf[_to].add(_value);
        return true;
    } 
}
