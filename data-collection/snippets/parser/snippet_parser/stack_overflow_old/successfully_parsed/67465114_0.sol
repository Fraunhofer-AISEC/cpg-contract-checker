

pragma solidity ^0.8.2;

import "./Context.sol";
import "./IBEP20.sol";
import "./SafeMath.sol";
import "./Ownable.sol";

contract SampleTaken is Context, IBEP20, Ownable {
    
    
    mapping(address => unit) public balances;
    
    unit public totalSupply = 1000000 * 10 ** 18;
    String public name ="Sample Token";
    String public symbol ="KJA";
    unit public decimals = 18;
    
    
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    constructor(){
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf(address _ownerAddress) public view returns (unit){
        return balances[_ownerAddress];
    }
    
  

    
    function transfer(address _toAddress, unit _noOfTokens) public view returns (bool){
    require(balanceOf(msg.sender) >= _noOfTokens, "Total balance is less than the number of Tokens asked for !!!");
    balances[_toAddress] +=_noOfTokens;
    balances[msg.sender] -= _noOfTokens;
    emit Transfer(msg.sender,_toAddress, _noOfTokens);
    return true;
    }
    
    function transferFrom(address _from, address _to, uint _value) public returns (bool){
     require(balanceOf(_from) >= _value, "Balance is less than the number of Tokens asked for !!!");
     require(allowance[_from][msg.sender] >= _value, "Allowance too low");
     balances[_to] += _value;
     balances[_from] -= _value;   
     
     emit Transfer (_from, _to, _value);
     return true;
     
     
    }
    
}
