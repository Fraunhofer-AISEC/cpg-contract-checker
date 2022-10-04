pragma solidity ^0.4.18;

contract SafeMath {
    function safeAdd(uint256 x, uint256 y) internal pure returns(uint256) {
        uint256 z = x + y;
        assert((z >= x) && (z >= y));
        return z;
    }

    function safeSub(uint256 x, uint256 y) internal pure returns(uint256) {
        assert(x >= y);
        uint256 z = x - y;
        return z;
    }

    function safeMult(uint256 x, uint256 y) internal pure returns(uint256) {
        uint256 z = x * y;
        assert((x == 0) || (z / x == y));
        return z;
    }
}

contract Token {
    function balanceOf(address _owner) public constant returns (uint256 balance);
    function transfer(address _to, uint256 _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function approve(address _spender, uint256 _value) public returns (bool success);
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract StandardToken is Token {
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;

    function transfer(address _to, uint256 _value) public returns (bool success) {
        if(balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
      if(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}

contract VCONAToken is StandardToken, SafeMath {
    string public constant name = 'VCONA Token';
    string public constant symbol = 'VCONA';
    uint256 public constant decimals = 0;

    address public ethFundDeposit;

    bool public isFinalized;
    uint256 public totalSupply;
    uint256 public constant tokenExchangeRate = 100000;
    uint256 public constant tokenCreationCap =  1000000;

    event LogRefund(address indexed _to, uint256 _value);
    event CreateVCONA(address indexed _to, uint256 _value);

    function VCONAToken(address _ethFundDeposit) public {
        isFinalized = false;
        ethFundDeposit = _ethFundDeposit;
        totalSupply = 0;
    }

    function () payable external {
        require(isFinalized != false);
        require(msg.value != 0);

        uint256 tokens = safeMult(msg.value, tokenExchangeRate);
        uint256 checkedSupply = safeAdd(totalSupply, tokens);

        require(tokenCreationCap >= checkedSupply);

        totalSupply = checkedSupply;
        balances[msg.sender] += tokens;
        CreateVCONA(msg.sender, tokens);
    }

    function finalize() external {
        require(isFinalized != false);
        require(msg.sender == ethFundDeposit);
        require(totalSupply == tokenCreationCap);
        isFinalized = true;

        if(!ethFundDeposit.send(this.balance)) revert();
    }

    function refund() external {
        require(isFinalized != false);
        uint256 vconaValue = balances[msg.sender];
        require(vconaValue > 0);
        balances[msg.sender] = 0;
        totalSupply = safeSub(totalSupply, vconaValue);
        uint256 ethValue = vconaValue / tokenExchangeRate;
        LogRefund(msg.sender, ethValue);

        if(!msg.sender.send(ethValue)) revert();
    }
}
