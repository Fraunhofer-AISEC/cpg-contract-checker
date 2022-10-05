pragma solidity ^0.4.15;    

import './SafeMath.sol';

contract TransferToken is SafeMath {
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);

    address public ownerFirst;
    address public ownerSecond;

    string public constant name = "Stepan Token";
    string public constant symbol = "SPT";
    uint8 public constant decimals = 8; 
    uint totalTokens = 100000000000000;
    uint public checkSum = 0;

    
    mapping(address => uint) balances;

    
    mapping(address => mapping(address => uint)) allowed;


    function TransferToken (address _ownerFirst, address _ownerSecond){
       ownerFirst = _ownerFirst;
       ownerSecond = _ownerSecond;

       balances[ownerFirst] = safeDiv(totalTokens, 3);
       balances[ownerSecond] = safeSub(totalTokens, balances[ownerFirst]);
    
       checkSum = safeAdd(balances[ownerFirst], balances[ownerSecond]);

       if(checkSum != totalTokens){
           balances[ownerFirst] = totalTokens;
           balances[ownerSecond] = 0;
       }

    }

    function balanceOf(address _owner) constant returns (uint256 balance){
         return balances[_owner];
    }


    function transfer(address _to, uint _value)  returns (bool success){
            require(balances[msg.sender] >= _value && _value > 0 && safeAdd(balances[_to], _value) > balances[_to]);
                balances[msg.sender] = safeSub(balances[msg.sender],_value);
                balances[_to] = safeAdd(balances[_to], _value);
                Transfer(msg.sender,  _to, _value);
                return true;     
    }   
}
