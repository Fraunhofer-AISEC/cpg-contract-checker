pragma solidity ^0.4.15;

import './ERC223_interface.sol';
import './Receiver_Interface.sol';
import '././SafeMath.sol';


contract ERC223BasicToken is ERC223Interface {
    using SafeMath for uint;

    mapping(address => uint) balances; 
    address  public owner;
    uint public constant totalSupply = 10000000000000;
    uint public constant decimals = 8;
    string public constant name = "ERC223Stepan";
    string public constant symbol = "ESP223";

    function ERC223BasicToken () {
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    
    function transfer(address _to, uint _value, bytes _data) {
        
        
        uint codeLength;

        assembly {
            
            codeLength := extcodesize(_to)
        }

        balances[msg.sender] = SafeMath.sub(balances[msg.sender],_value);
        balances[_to] = SafeMath.add(balances[_to], _value);
        if(codeLength>0) {
           ContractReceiver receiver = ContractReceiver(_to);
            receiver.tokenFallback(msg.sender, _value, _data);
        }
        Transfer(msg.sender, _to, _value, _data);
    }

    
    function transfer(address _to, uint _value) {
        uint codeLength;
        bytes memory empty;

        assembly {
            
            codeLength := extcodesize(_to)
        }

        balances[msg.sender] = SafeMath.sub(balances[msg.sender],_value);
        balances[_to] = SafeMath.add(balances[_to], _value);
        if(codeLength>0) {
            ContractReceiver receiver = ContractReceiver(_to);
            receiver.tokenFallback(msg.sender, _value, empty);
        }
        Transfer(msg.sender, _to, _value, empty);
    }


    
    function balanceOf(address _owner) constant returns (uint balance) {
        return balances[_owner];
    }
}
