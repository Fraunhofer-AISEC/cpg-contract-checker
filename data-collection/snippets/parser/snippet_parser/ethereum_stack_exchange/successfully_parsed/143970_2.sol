
    function pledgeFunds(uint256 _amount, address token) public payable {
        require(_amount > 0, "Pledge amount must be a positive value");
        require(token.allowance(mmsg.sender, address(this)) > _amount, 
        "You need to approve first");
        require(
            token.transferFrom(msg.sender, address(this), _amount),
            "Token transfer failed"
        );

        fundsPledged[msg.sender] += _amount;
        totalFundsPledged += _amount;

        emit FundPledged(msg.sender, _amount);
    }
