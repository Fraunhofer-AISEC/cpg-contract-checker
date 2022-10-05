pragma solidity ^0.4.18;
import './IERC20Basic.sol';
import './SafeMath.sol';

contract VfcToken  is IERC20Basic{

    using SafeMath for uint256;

    uint256 public _totalSupply ;
    string public constant symbol = "VFC";
    string public constant name = "Vfc Token";
    uint8 public constant decimals = 1;

    mapping(address => uint256) balances;

    function VfcToken() public{
        _totalSupply = 10;
        balances[msg.sender] = _totalSupply;
    }

    function totalSupply() external view returns (uint256){
        return _totalSupply;
    }

    function balanceOf(address _owner) external view returns (uint256){
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) external returns (bool){
        require(_to != address(0) 
                && _value > uint256(0) 
                && _value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;

    }
}
