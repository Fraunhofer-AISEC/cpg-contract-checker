pragma solidity ^0.4.24;

import "./Coin.sol";

contract test {

    constructor(address a) public { 
        coin = Coin(a);
    }

    Coin coin;

    function doTransfer(address who, uint amount) public { 
        uint b = coin.balanceOf(this);
        require(b >= amount, "Balance too low.");
        coin.transfer(who, amount);
    }
}



pragma solidity ^0.4.24;

import "./ERC20Burnable.sol";
import "./ERC20Mintable.sol";
import "./ERC20Details.sol";
import "./Ownable.sol";

contract Coin is ERC20Burnable, ERC20Mintable, ERC20Details, Ownable {
    constructor () public {
        _decimals = 18;
        _name = "COIN";
        _symbol = "COIN";
        _totalSupply = 100000000 ether;
        _balances[msg.sender] = _totalSupply;
    }

    function burn(uint value) public onlyOwner {
        _burn(msg.sender, value);
    }

    function mint(address to, uint value) public onlyOwner { 
        _mint(to, value);
    }
}


pragma solidity ^0.4.24;


contract Ownable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    
    constructor() internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    
    function owner() public view returns(address) {
        return _owner;
    }

    
    modifier onlyOwner() {
        require(isOwner(), "Caller must be owner.");
        _;
    }

    
    function isOwner() public view returns(bool) {
        return msg.sender == _owner;
    }

    
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "New owner can't be zero address.");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}


pragma solidity ^0.4.24;

import "./ERC20.sol";


contract ERC20Burnable is ERC20 {
    
    function _burn(address account, uint256 value) internal {
        require(account != address(0));
        require(value <= _balances[account]);

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
        emit Burn(account, msg.sender, value);
    }

    event Burn(address indexed from, address indexed burner, uint256 value);
}


pragma solidity ^0.4.24;

import "./ERC20.sol";


contract ERC20Mintable is ERC20 {

    
    function _mint(address account, uint256 value) internal {
        require(account != address(0));
        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
        emit Mint(account, msg.sender, value);
    }

    event Mint(address indexed to, address indexed minter, uint256 value);
}



pragma solidity ^0.4.24;

import "./IERC20.sol";
import "./SafeMath.sol";


contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;

    mapping (address => mapping (address => uint256)) internal _allowed;

    uint256 internal _totalSupply;

    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    
    function allowance(
        address owner,
        address spender
    )
      public
      view
      returns (uint256)
    {
        return _allowed[owner][spender];
    }

    
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    
    function transferFrom(
        address from,
        address to,
        uint256 value
    )
      public
      returns (bool)
    {
        require(value <= _allowed[from][msg.sender]);

        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _transfer(from, to, value);
        return true;
    }

    
    function increaseAllowance(
        address spender,
        uint256 addedValue
    )
      public
      returns (bool)
    {
        require(spender != address(0));

        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

    
    function decreaseAllowance(
        address spender,
        uint256 subtractedValue
    )
      public
      returns (bool)
    {
        require(spender != address(0));

        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

    
    function _transfer(address from, address to, uint256 value) internal {
        require(value <= _balances[from], "Not enough balance.");
        require(to != address(0), "Address musn't be zero.");
        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }

}


library SafeMath {

    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "Overflow");

        return c;
    }

    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "b is zero."); 
        uint256 c = a / b;
        

        return c;
    }

    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "Overflow");
        uint256 c = a - b;

        return c;
    }

    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "Overflow");

        return c;
    }

    
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "b is zero.");
        return a % b;
    }
}
