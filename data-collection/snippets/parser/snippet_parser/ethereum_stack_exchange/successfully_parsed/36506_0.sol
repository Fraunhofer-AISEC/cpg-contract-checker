pragma solidity ^0.4.0;


contract Managed
{
    address internal _manager;

    function isManager(address addr) internal view returns (bool yes)
    {
        return addr == _manager;
    }
}


contract MyToken is Managed
{
    string private _name;
    string private _symbol;
    uint8 private _decimals = 18;
    uint256 _totalSupply;

    mapping (address => uint256) private _balances;

    function MyToken(string name, string symbol, uint256 initialSupply) public 
    {
        _manager = msg.sender;
        _name = name;
        _symbol = symbol;
        _totalSupply = initialSupply * 10 ** uint256(_decimals);
        _balances[_manager] = _totalSupply;
    }

    function _getBalance(address from) private view returns (uint256 balance)
    {
        return _balances[from];
    }

    function getBalance() public view returns (uint256 balance)
    {
        return _getBalance(msg.sender);
    }

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function _transfer(address from, address to, uint256 amount) private
    {
        _remove(from, amount);
        _add(to, amount);
    }

    function transfer(address to, uint256 amount) public 
    {
        _transfer(msg.sender, to, amount);
    }

    event Add(address indexed to, uint256 amount);

    function _add(address to, uint256 amount) private
    {
        require(to != 0x0);
        require(amount >= 0);
        require(_balances[to] + amount >= _balances[to]);

        _balances[to] += amount;
        _totalSupply += amount;

        Add(to, amount);
    }

    function add(address to, uint256 amount) public
    {
        require(isManager(msg.sender));
        _add(to, amount);
    }

    function add(uint256 amount) public
    {
        _add(msg.sender, amount);
    }

    event Remove(address indexed from, uint256 amount);

    function _remove(address from, uint256 amount) private
    {
        require(from != 0x0);
        require(amount >= 0);
        require(amount <= _balances[from]);

        _balances[from] -= amount;
        _totalSupply -= amount;

        Remove(from, amount);
    }

    function remove(address from, uint256 amount) public
    {
        require(isManager(msg.sender));
        _remove(from, amount);
    }

    function remove(uint256 amount) public
    {
        _remove(msg.sender, amount);
    }
}


contract Ownership is Managed
{
    mapping (address => mapping (uint64 => uint64)) private _holdings;

    function Ownership() public 
    {
        _manager = msg.sender;
    }

    function _getHoldings(address owner, uint64 itemId) private view returns (uint64 quantity)
    {
        return _holdings[owner][itemId];
    }

    function getHoldings(address owner, uint64 itemId) public view returns (uint64 quantity)
    {
        require(isManager(msg.sender));
        return _getHoldings(owner, itemId);
    }

    function getHoldings(uint64 itemId) public view returns (uint64 quantity)
    {
        return _getHoldings(msg.sender, itemId);
    }

    event Transfer(address indexed from, address indexed to, uint64 itemId, uint64 quantity);

    function _transfer(address from, address to, uint64 itemId, uint64 quantity) private
    {
        _remove(from, itemId, quantity);
        _add(to, itemId, quantity);
    }

    function transfer(address to, uint64 itemId, uint64 quantity) public
    {
        _transfer(msg.sender, to, itemId, quantity);
    }

    event Add(address indexed to, uint64 itemId, uint64 quantity);

    function _add(address to, uint64 itemId, uint64 quantity) private
    {
        require(to != 0x0);
        require(itemId > 0);
        require(quantity >= 0);
        require(_holdings[to][itemId] + quantity >= _holdings[to][itemId]);

        _holdings[to][itemId] += quantity;

        Add(to, itemId, quantity);
    }

    function add(address to, uint64 itemId, uint64 quantity) public
    {
        require(isManager(msg.sender));
        _add(to, itemId, quantity);
    }

    function add(uint64 itemId, uint64 quantity) public
    {
        _add(msg.sender, itemId, quantity);
    }

    event Remove(address indexed from, uint64 itemId, uint64 quantity);

    function _remove(address from, uint64 itemId, uint64 quantity) private
    {
        require(from != 0x0);
        require(itemId > 0);
        require(quantity >= 0);
        require(quantity <= _holdings[from][itemId]);

        _holdings[from][itemId] -= quantity;

        Remove(from, itemId, quantity);
    }

    function remove(address from, uint64 itemId, uint64 quantity) public
    {
        require(isManager(msg.sender));
        _remove(from, itemId, quantity);
    }

    function remove(uint64 itemId, uint64 quantity) public
    {
        _remove(msg.sender, itemId, quantity);
    }
}
