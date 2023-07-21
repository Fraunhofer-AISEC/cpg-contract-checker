function stake(address tAddress,uint amount) public {
        require(amount>0,"Can't be zero");
        uint balance=ERC20(tAddress).balanceOf(msg.sender);
        require(amount<=balance,"Not enough token");
        stakeAmount[msg.sender][tAddress]+=amount;
        TimeStamp[msg.sender][tAddress]=block.timestamp;
        CustomToken token = CustomToken(tAddress);
        token.transferFrom(msg.sender,address(this),amount);
        emit StakeSuccess(tAddress,amount,TimeStamp[msg.sender][tAddress]);
    }

    function approveContract(address tAddress, uint256 amount) public {
        require(isToken[tAddress], "Token not supported");
        CustomToken token = CustomToken(tAddress);
        token.approve(address(this), amount);
    }
