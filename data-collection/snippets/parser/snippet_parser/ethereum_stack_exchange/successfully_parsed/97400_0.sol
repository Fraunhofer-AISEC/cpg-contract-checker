pragma solidity 0.6.3;  

contract zylus {

    mapping (address => uint256) public _balances; 
    uint256 constant private MAX_UINT256 = 2**256 - 1;

    mapping (address => mapping (address => uint256)) public _allowances; 

    string public _name = 'Zylus';
    string public _symbol = 'zyl';
    uint8  public _decimals = 6;
    uint public _totalSupply = 100000000000000000; 


    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    

    function name() public view returns (string memory) {
        return _name; 
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
    function decimals() public view returns (uint8) {
        return _decimals; 
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value)payable public returns (bool success) {
        require(_balances[msg.sender] >= _value);
        require(_balances[_to] + _value >= _balances[_to]);
        _balances[msg.sender] -= _value;   
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;                         
    }

    function transferFrom(address _from, address _to, uint256 _value) public view returns (bool success) {
        uint256 allowanc = _allowances[_from][msg.sender];
        require(_balances[_from] >= _value && allowance >= _value);
        _balances[_to] += _value;
        _balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            _allowances[_from][msg.sender] -= _value;
        }
    
        emit Transfer(_from, _to, _value); 
        return true;
    }
    
    function approve(address _spender, uint256 _value) public view returns (bool success) {
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true; 
    }

    function allowance(address _owner, address _spender) public view returns  (uint256 remaining) {
        return(_allowances[_owner][_spender]);
    }

}


