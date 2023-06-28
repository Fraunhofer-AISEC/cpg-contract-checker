    function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
           require(mintCap >= totalSupply_.add(_amount));

           totalSupply_ = totalSupply_.add(_amount);
           balances[_to] = balances[_to].add(_amount);
           emit Transfer(address(0), _to, _amount);
           return true;
       }
