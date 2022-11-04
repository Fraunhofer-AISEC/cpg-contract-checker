pragma solidity ^0.4.24;

import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract TNStoken is Ownable {

using SafeMath for uint256;

mapping(address => uint256) balances;
mapping (address => mapping (address => uint256)) internal allowed;
uint256 totalSupply_;

string public name;
string public symbol;
uint8 public decimals;

constructor() public {
    name = "The Neverending Story Token";
    symbol = "TNS";
    decimals = 18;
    totalSupply_ = 100 * 10**6 * 10**18;
    balances[msg.sender] = totalSupply_;
}
function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender] - locked[msg.sender]);

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
}

function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
}

function totalSupply() public view returns (uint256) {
    return totalSupply_;
}
}
