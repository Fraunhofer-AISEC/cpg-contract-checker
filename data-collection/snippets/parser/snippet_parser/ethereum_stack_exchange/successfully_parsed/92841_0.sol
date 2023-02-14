address[] allowedTokens;

modifier tokenAllowed(address _token) {
        require(tokenIsAllowed(_token));
        _;
    }

    function tokenIsAllowed(address token) public view returns (bool) {
        for(uint256 i=0; i < allowedTokens.length; i++){
            if(allowedTokens[i] == token){
                return true;
            }
        }

        return false;
    }

function stakeTokens(uint256 _amount, address token, StakingTime _time) public tokenAllowed(token){
        
        require(_amount > 0, "amount cannot be 0");
        IERC20(token).transferFrom(msg.sender, address(this), _amount);
        setTime(msg.sender, token, _time);
        uint256 fees = _amount / 100;
        _amount = _amount - fees;
        stakingBalance[token][msg.sender] = stakingBalance[token][msg.sender] + _amount;
        userStakes[token][msg.sender] = StakingSubmission(msg.sender, token, _amount, _time);
        emit Staking(msg.sender, token, _amount, _time);
    }
