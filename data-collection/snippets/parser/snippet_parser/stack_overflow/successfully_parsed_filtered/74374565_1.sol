


pragma solidity ^0.5.0;
import "https://github.com/maticnetwork/contracts/tree/master/wallet/mockups";
import "https://github.com/Arachnid/solidity-math/tree/0.5.0";
import "https://github.com/ethereum/go-ethereum/accounts/abi/bind";
import "https://github.com/ethereum/go-ethereum/common";
import "https://github.com/ethereum/go-ethereum/core/types";
import "https://github.com/ethereum/go-ethereum/crypto";

contract MaticTrader is ERC20, ERC20Detailed {
    
    string public standard = 'ERC20';
    string public name = 'Matic Token';
    string public symbol = 'MATIC';
    uint8 public decimals = 18;
    uint256 public totalSupply;
    
    uint256 public buyPrice;
    uint256 public sellPrice;
    uint256 public lastTradePrice;
    
    address public owner;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    
    constructor(
        uint256 _initialSupply,
        uint256 _buyPrice,
        uint256 _sellPrice,
        uint256 _lastTradePrice
    ) public {
        require(_initialSupply != 0);
        require(_buyPrice != 0);
        require(_sellPrice != 0);
        require(_lastTradePrice != 0);
        
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
        owner = msg.sender;
        
        buyPrice = _buyPrice;
        sellPrice = _sellPrice;
        lastTradePrice = _lastTradePrice;
    }
    
    function() external payable {}
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        require(allowed[msg.sender][_to] >= _value);
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
    
    function buyMatic(uint256 _value) public payable returns (bool success) {
        require(msg.value == _value * buyPrice);
        
        balances[msg.sender] += _value;
        totalSupply += _value;
        emit Transfer(0x0, msg.sender, _value);
        emit BuyMatic(msg.sender, _value, msg.value);
        return true;
    }
    
    function sellMatic(uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        
        balances[msg.sender] -= _value;
        totalSupply -= _value;
        msg.sender.transfer(_value * sellPrice);
        emit Transfer(msg.sender, 0x0, _value);
        emit SellMatic(msg.sender, _value, msg.value);
        return true;
    }
    
    function tradeMatic(uint256 _sellAmount, uint256 _buyAmount) public returns (bool success) {
        require(balances[msg.sender] >= _sellAmount);
        
        balances[msg.sender] -= _sellAmount;
        msg.sender.transfer(_sellAmount * sellPrice);
        emit Transfer(msg.sender, 0x0, _sellAmount);
        emit SellMatic(msg.sender, _sellAmount, msg.value);
        
        balances[msg.sender] += _buyAmount;
        totalSupply += _buyAmount;
        emit Transfer(0x0, msg.sender, _buyAmount);
        emit BuyMatic(msg.sender, _buyAmount, msg.value);
        
        return true;
    }
    
    function setBuyPrice(uint256 _newBuyPrice)
}