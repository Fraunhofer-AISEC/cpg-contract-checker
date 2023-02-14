
    function deposit(uint256 depositAmount, uint256 poolId_) public{
        
        
        Pool storage p = checkIfPoolExistsOrClosed(poolId_);

        
        if (depositAmount <= 0) revert WrongAmount();

        
        if(p.valueInPool == 0) {
            tokensForUser = depositAmount;
        }else {
            
            tokensForUser = (depositAmount /
                (p.valueInPool/
                IProperSubsetERC20(p.poolTokenAddress).totalSupply()));
        }
        
        
        if(!contractIsApproved[msg.sender]) revert ApprovalFailed();

        
        bool transfer  = IProperSubsetUSDC(usdcAddress).transferFrom(msg.sender, address(this), depositAmount);

        
        

        
        IProperSubsetERC20(p.poolTokenAddress).mint(msg.sender, tokensForUser);

        
        p.valueInPool = p.valueInPool + depositAmount;

        
        emit Deposit(msg.sender, poolId_, depositAmount);
    }
