 function _stakeUnderlyingAsset(uint256 numTokens, address recipient)
        internal
        returns (bool)
    {
        
        require(
            Token_Activated || msg.sender == _owner || isMatrix[msg.sender],
            "Token is Currently Locked Inside the Matrix"
        );
        
        uint256 userTokenBalance = IERC20(_underlying).balanceOf(msg.sender);
        
        require(
            userTokenBalance > 0 && numTokens <= userTokenBalance,
            "Insufficient Balance"
        );
        
        uint256 oldPrice = _calculatePrice();
        
        uint256 prevTokenAmount = IERC20(_underlying).balanceOf(address(this));
        
        bool success = IERC20(_underlying).transferFrom(
            msg.sender,
            address(this),
            numTokens
        );
        
        uint256 currentTokenAmount = IERC20(_underlying).balanceOf(
            address(this)
        );
        
        uint256 difference = currentTokenAmount.sub(prevTokenAmount);
        
        require(
            difference <= numTokens && difference > 0,
            "Failure on Token Evaluation"
        );
        
        require(success, "Failure On Token TransferFrom");
        
        prevTokenAmount = prevTokenAmount == 0
            ? currentTokenAmount
            : prevTokenAmount;
        
        emit TokenStaked(difference, recipient);
        
        return _handleMinting(recipient, difference, prevTokenAmount, oldPrice);
    }
