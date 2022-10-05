function deposit(uint _tokens) public  {
        require (_tokens > 0);
        
        msg.sender.delegatecall(bytes4(keccak256(strConcat(addressToAsciiString(tokenContract),".approve(address _spender, uint256 _value)"))), _tokens);
        require (tokenContract.allowance(msg.sender, this) >= _tokens);
        require (tokenContract.transferFrom(msg.sender, tokenStore, _tokens));

    }
