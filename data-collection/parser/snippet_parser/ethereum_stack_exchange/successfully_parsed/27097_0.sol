pragma solidity ^0.4.15;

import './ERC20.sol';
import './SafeMath.sol';

contract StepanToken2 is ERC20{
    using SafeMath for uint256;

    address public ownerFirst;
    address public ownerSecond;

    string public constant name = "Stepan Token";
    string public constant symbol = "SPT";
    uint8 public constant decimals = 8; 
    uint totalTokens = 100000000000000;


    
    mapping(address => uint) balances;

    
    mapping(address => mapping(address => uint)) allowed;


    function StepanToken2 (address _ownerFirst, address _ownerSecond){
       ownerFirst = _ownerFirst;
       ownerSecond = _ownerSecond;

       balances[ownerFirst] = SafeMath.div(totalTokens, 3);
       balances[ownerSecond] = SafeMath.sub(totalTokens, balances[ownerFirst]);
    }

    function totalSupply() constant returns (uint256 totalSupply){
         return totalTokens;
    }

    function balanceOf(address _owner) constant returns (uint256 balance){
         return balances[_owner];
    }


    function transfer(address _to, uint _value)  returns (bool success){
            require(balances[msg.sender] >= _value && _value > 0 && SafeMath.add(balances[_to], _value) > balances[_to]);
                balances[msg.sender] = SafeMath.sub(balances[msg.sender],_value);
                balances[_to] = SafeMath.add(balances[_to], _value);
                Transfer(msg.sender,  _to, _value);
                return true;     
    }

    function transferFrom(address _from, address _to, uint _value) returns (bool success){
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0 && SafeMath.add(balances[_to], _value) > 0);
            balances[_from] = SafeMath.sub(balances[_from], _value);
            allowed[_from][msg.sender] = SafeMath.sub(allowed[_from][msg.sender], _value);
            balances[_to] = SafeMath.add(balances[_to], _value);
            Transfer(_from, _to, _value);
            return true;
    }


    function approve(address _spender, uint _value)  returns (bool success){
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender,  _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining){
        return allowed[_owner][_spender];
    }

}
