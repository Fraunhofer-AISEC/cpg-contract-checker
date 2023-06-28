pragma solidity ^0.6.7;

import "./ERCI20.sol"; 
import "./SafeMath.sol"; 

contract TimeBound is ERCI20 {

using SafeMath for uint256;
address public contractOwner;

mapping (address => uint256) private Balances;
mapping (address => mapping (address => uint256)) private Allowances;

uint256 private _totalSupply;

string public name;
string public symbol;
uint8 public decimals;

uint256 public releaseTime;

event releaseTimeSet(bool success, uint256 time);

modifier onlyOwner() {
    require(msg.sender == contractOwner, "TB9Token: Only owner allowed");
    _;
}
modifier TimeLock() {
    require(block.timestamp >= releaseTime, "TB9Token: Token is locked for certain Time");
    _;
}


constructor() public {
    name = "TimeBound Token";
    symbol = "TB9Token";
    decimals = 0;
    contractOwner = msg.sender;

    _totalSupply = 1000000 * (10 ** uint256(decimals));

    Balances[contractOwner] = _totalSupply;

    emit Transfer(address(this), contractOwner, _totalSupply);
}

function totalSupply() external view override returns(uint256) {
    return _totalSupply;
}

function balanceOf(address account) external view override returns(uint256) {
    return Balances[account]; 
}

function transfer(address recipient, uint256 amount) external override TimeLock() returns(bool) {
    address sender = msg.sender;

    require(sender != address(0), "TB9Token:should not transfer from the zero address");
    require(recipient != address(0), "TB9Token:should not transfer to the zero address");
    require(Balances[sender] > amount);

    Balances[sender] = Balances[sender].sub(amount); 

    Balances[recipient] = Balances[recipient].add(amount);

    emit Transfer(sender, recipient, amount);
    return true;
}
function allowance(address tokenOwner, address spender) external view override returns(uint256) {
    return Allowances[tokenOwner][spender];
} 
function approve(address spender, uint256 amount) external override returns(bool) {
    address tokenOwner = msg.sender;

    require(tokenOwner != address(0), "TB9Token: should not approve from the zero address");
    require(spender != address(0), "TB9Token:should not approve to the zero address");

    Allowances[tokenOwner][spender] = amount;

    emit Approval(tokenOwner, spender, amount);
    return true;
}

function transferFrom(address sender, address recipient, uint256 amount) external override TimeLock() returns(bool) {
    address spender = msg.sender;
    uint256 Allowance = Allowances[sender][spender];

    require(sender != address(0), "TB9Token:should not transfer from the zero address");
    require(recipient != address(0), "TB9Token:should not transfer to the zero address");
    require(Balances[sender] > amount, "TB9Token: transfer amount exceeds");
    require(Allowance > amount, "TB9Token: transfer amount exceeds allowance");

    Allowance = Allowance.sub(amount);

    Balances[recipient] = Balances[recipient].add(amount);

    Balances[sender] =Balances[sender].sub(amount); 

    emit Transfer(sender, recipient, amount);
    Allowances[sender][spender] = Allowance;

    emit Approval(sender, spender, amount);

    return true;
}
function setReleaseTime(uint _releaseTime) public onlyOwner() returns(bool) {
    require(_releaseTime > block.timestamp, "TB9Token: releaseTime must be valid in the future");

    releaseTime = _releaseTime;

    emit releaseTimeSet(true, _releaseTime);

    return true;
}

}
