function _deposit(
        address token,      
        uint256 value,      
        uint256 toChainId   
    ) 
        internal 
        returns (address pair_token) 
    {
        Token memory pair = tokenPair[toChainId][token];
        require(pair.token != address(0), "There is no pair");
        pair_token = pair.token;
        uint256 fee = msg.value;
        if (token <= MAX_NATIVE_COINS) {
            require(value <= msg.value, "Wrong value");
            fee -= value;
        } else {
            if(pair.isWrapped) {
                IBEP20TokenCloned(token).burnFrom(msg.sender, value);
            } else {
                tokenDeposits[token] += value;
                token.safeTransferFrom(msg.sender, address(this), value);
            }
        }
        if (fee != 0) {
            feeTo.safeTransferETH(fee);
            emit Fee(msg.sender, fee);
        }
    }
