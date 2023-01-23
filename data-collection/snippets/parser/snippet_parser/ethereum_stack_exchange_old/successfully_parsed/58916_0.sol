function sendBounty(address _to, uint256 _tokens) returns (bool) {

        require(_tokens + bountyCount  < MAX_Bounty_Tokens );
        bountyCount= bountyCount+_tokens;
        mint(_to,_tokens);

    }

function mint(address _to, uint256 _amount) public canMint returns (bool){
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
        return true;
   }
