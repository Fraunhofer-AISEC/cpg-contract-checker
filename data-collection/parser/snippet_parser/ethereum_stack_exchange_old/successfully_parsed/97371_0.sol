pragma solidity 0.8.3;


abstract contract zylus {

    mapping (address => uint256) public _balances;

    mapping (address => mapping (address => uint256)) public _allowances;

    uint256 public _totalSupply = 1000000000000000;

    string public _name = 'Zylus';
    string public _symbol = 'zyl';
    uint8  public _decimals = 6;


    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function name() public view returns (string memory){
        return _name;
    }

    function symbol() public view returns (string memory){
        return _symbol;
    }
    
    function decimals() public view returns (uint8){
        return _decimals;
    }

    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }
    function balanceOf(address _owner) public view returns (uint256 balance){
        return _balances[_owner];
    }
    function transfer(address _to, uint256 _value)view public returns (bool success){
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;   
        balanceOf[_to] += _value;
        emit transfer(msg.sender, _to, _value);
        return true;                         
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function approve(address _spender, uint256 _value) public returns (bool success);
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);

}
