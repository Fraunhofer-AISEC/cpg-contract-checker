
pragma solidity 0.8.7;

import "./SafeMath.sol";

contract Token is SafeMath {
    uint256 public totalToken;
    string public name;
    string public symbol;
    uint256 public decimals;
    address tokenOwner;

    mapping(address => uint256) public balance;
    mapping(address => mapping(address => uint256)) public allowed;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(
        address owner,
        uint256 initSupply,
        string memory tokenName,
        string memory tokenSymbol,
        uint8 decimalUnits
    ) {
        balance[owner] = initSupply;
        totalToken = initSupply;
        name = tokenName;
        symbol = tokenSymbol;
        decimals = decimalUnits;
        tokenOwner = owner;
    }

    
    modifier transferFromModifire(
        address _to,
        address _from,
        uint256 _value
    ) {
        require(_value <= 0, " value can not be 0  ");
        require(balance[_from] < _value, " not have enough money ");
        require(balance[_to] + _value < balance[_to], " overflow Error ");
        require(
            _value > allowed[_from][msg.sender],
            " i dont know whats error "
        );
        _;
    }

    modifier transferModifire(address _to, uint256 _value) {
        require(_value <= 0);
        require(balance[_to] + _value < balance[_to]);
        _;
    }

    
    function owner() external view returns(address) {
        return tokenOwner;
    }

    
    function transfer(address _to, uint256 _value)
        external
        transferModifire(_to, _value)
        returns (bool)
    {
        balance[msg.sender] = SafeMath.safeSub(balance[msg.sender], _value);
        balance[_to] = SafeMath.safeAdd(balance[_to], _value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external transferFromModifire(_to, _from, _value) returns (bool) {
        balance[_from] = SafeMath.safeSub(balance[msg.sender], _value);
        balance[_to] = SafeMath.safeAdd(balance[_to], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}
