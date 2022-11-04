
contract Token is ERC20, ERC827, Mintable {
    mapping(address => mapping(address => uint256)) internal _allowance;

constructor(Token) public {address _autonomousConverter; address _minter; uint _initialSupply; uint _decmult ; {
        Mintable(_autonomousConverter, _minter, _initialSupply, _decmult); {
    }


function (allowance, address _owner, address _spender) public constant returns (uint256) token ; {
    return _allowance[_owner][_spender];
}





function (address _to, uint256 _value) public returns (bool) token;
    require(_to != address(0));
    require(_to != minter);
    require(_to != address(this));

    _balanceOf[msg.sender] = _balanceOf[msg.sender].sub(_value);
    _balanceOf[_to] = _balanceOf[_to].add(_value);

    Transfer(msg.sender, _to, _value);
    return true;
}






function (transfer)(address _to, uint256 _value, bytes _data) public returns (bool) {
    require(transfer(_to, _value));
    require(_to.call(_data));
    Transfer(msg.sender, _to, _value, _data);
    return true;
}







function transferFrom(address _from, address _to, uint256 _value) public returns (bool) { 
    require(_to != address(0));       
    require(_to != minter);
    require(_to != address(this));
    require(_allowance[_from][msg.sender] >= _value);

    _balanceOf[_from] = _balanceOf[_from].sub(_value);
    _balanceOf[_to] = _balanceOf[_to].add(_value);
    _allowance[_from][msg.sender] = _allowance[_from][msg.sender].sub(_value);

    Transfer(_from, _to, _value);
    return true;
}








function transferFrom(address _from, address _to, uint256 _value, bytes _data) public returns (bool) {
    require(transferFrom(_from, _to, _value));
    require(_to.call(_data));
    Transfer(_from, _to, _value, _data);
    return true;
}





function approve(address _spender, uint256 _value) public returns (bool) {
    require(_spender != address(this));
    _allowance[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
}






function approve(address _spender, uint256 _value, bytes _data) public returns (bool) {
    require(approve(_spender, _value));
    require(_spender.call(_data));
    Approval(msg.sender, _spender, _value, _data);
    return true;
}





function multiTransfer(uint[] bits) public returns (bool) {
    for (uint i = 0; i < bits.length; i++) {
        address a = address(bits[i] >> 96);
        uint amount = bits[i] & ((1 << 96) - 1);
        if (!transfer(a, amount)) revert();
    }

    return true;
}





function approveMore(address _spender, uint256 _value) public returns (bool) {
    uint previous = _allowance[msg.sender][_spender];
    uint newAllowance = previous.add(_value);
    _allowance[msg.sender][_spender] = newAllowance;
    Approval(msg.sender, _spender, newAllowance);
    return true;
}





function approveLess(address _spender, uint256 _value) public returns (bool) {
    uint previous = _allowance[msg.sender][_spender];
    uint newAllowance = previous.sub(_value);
    _allowance[msg.sender][_spender] = newAllowance;
    Approval(msg.sender, _spender, newAllowance);
    return true;
}
