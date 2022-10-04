pragma solidity ^0.4.24;

import "./ERC223.sol";
import "./ERC223ReceivingContract.sol";
import "../lib/SafeMath.sol";

contract StandardToken is ERC223 {
    using SafeMath for uint256;

    mapping(address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;

    
    modifier validAddress(address _address) {
        require(_address != address(0));
        _;
    }

    event TransferStep(
        uint256 indexed _step
    );

    function transfer(address _to, uint256 _value) public returns (bool) {
        emit TransferStep(0);
        bytes memory empty;
        transfer(_to, _value, empty);
    }

    function transfer(address _to, uint256 _value, bytes _data) public validAddress(_to) returns (bool success) {
        uint codeLength;

        emit TransferStep(1);

        assembly {
            
            codeLength := extcodesize(_to)
        }

        emit TransferStep(2);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);

        emit TransferStep(3);

        
        if (codeLength > 0) {
            emit TransferStep(4);
            ERC223ReceivingContract(_to).tokenFallback(msg.sender, _value, _data);
            emit TransferStep(5);
        }

        emit Transfer(msg.sender, _to, _value);
        emit Transfer(msg.sender, _to, _value, _data);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        
        
        
        
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));

        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public validAddress(_to) returns (bool) {
        uint256 _allowance = allowed[_from][msg.sender];

        
        

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = _allowance.sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}
