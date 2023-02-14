function approve(address _spender, uint256 _tokens) external { 
    allowed[msg.sender][_spender] = _tokens; 
    }
