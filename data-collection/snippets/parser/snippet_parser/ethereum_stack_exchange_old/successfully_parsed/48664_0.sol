pragma solidity ^0.4.23;


interface ERC20 {
    function allowance(address owner, address spender)
    external view returns (uint256);

    function transferFrom(address from, address to, uint256 value)
    external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}




contract ERC20Token is ERC20 {
    uint256 totalSupply_;

    mapping (address => mapping (address => uint256)) internal allowed;
    mapping(address => uint256) balances;

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function transfer(address _to, uint256 _value) external returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);


        balances[msg.sender] -= _value;
        balances[_to] += _value;

        return true;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

      function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        public
        returns (bool)
    {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        return true;
    }

    function allowance(
        address _owner,
        address _spender
    )
    public
    view
    returns (uint256)
    {
        return allowed[_owner][_spender];
    }
}


contract TokenA is ERC20Token {
}

contract TokenB is ERC20Token {
}

contract TokenC is ERC20Token {
}
contract TokenD is ERC20Token {
}


contract TokenSwapper {
    
    mapping(address => mapping(address => uint256)) tokenBalances_;

    function tokenBalances(address _owner, ERC20 _token) public view returns (uint256 balance) {
        return balance = tokenBalances_[_owner][_token];
    }

    function deposit(ERC20 _token, uint256 _amount) public {
        _token.transferFrom(msg.sender, address(this), _amount);
        tokenBalances_[msg.sender][_token] += _amount;
    }

    function swap(ERC20 _fromToken, ERC20 _toToken, uint256 _amount) public {
        tokenBalances_[msg.sender][_fromToken] -= _amount;
        tokenBalances_[msg.sender][_toToken] += _amount;
    }

    function withdraw(ERC20 _token, uint256 _amount) public {
        require(tokenBalances_[msg.sender][_token] >= _amount);

        _token.transfer(msg.sender, _amount);
    }
}
