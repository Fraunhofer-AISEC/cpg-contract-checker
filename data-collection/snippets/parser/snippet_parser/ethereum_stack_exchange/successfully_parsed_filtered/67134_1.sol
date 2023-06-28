contract SampleToken is PausableToken {
    string public constant name = "Sample Token"; 
    string public constant symbol = "STT";
    uint256 public constant decimals = 18;

    mapping (address => uint256) freezes;

    
    event Burn(address indexed from, uint256 value);

    
    event Freeze(address indexed from, uint256 value);

    
    event Unfreeze(address indexed from, uint256 value);

    constructor() public {
        totalSupply_ = 500000000 * (10 ** uint256(decimals));
        balances[msg.sender] = totalSupply_;
        
    }

    function freezeOf(address _owner) public view returns (uint256) {
        return freezes[_owner];
    }

    function burn(uint256 _value) whenNotPaused public returns (bool) {
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        emit Burn(msg.sender, _value);
        return true;
    }

    function freeze(uint256 _value) whenNotPaused public returns (bool) {
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        freezes[msg.sender] = freezes[msg.sender].add(_value);
        emit Freeze(msg.sender, _value);
        return true;
    }

    function unfreeze(uint256 _value) whenNotPaused public returns (bool) {
        require(_value <= freezes[msg.sender]);

        freezes[msg.sender] = freezes[msg.sender].sub(_value);
        balances[msg.sender] = balances[msg.sender].add(_value);
        emit Unfreeze(msg.sender, _value);
        return true;
    }

    
    function transferOwnership(address newOwner) onlyOwner whenNotPaused public {
        super.transferOwnership(newOwner);
    }

    
    function() payable external {
        revert();
    }
}
