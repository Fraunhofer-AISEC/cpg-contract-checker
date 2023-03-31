    function swap(uint amount) public payable {
        require(
            BUSD.allowance(msg.sender, address(this)) >= estateInfo.supply,
            "BUSD allowance too low or insufficient"
        );
        require(
            token.allowance(owner, address(this)) >= estateInfo.supply,
            "Token (NOTIFY TO DEV) allowance too low or insufficient"
        );
        require(
            BUSD.balanceOf(msg.sender) >= amount,
            "BUSD too low or insufficient"
        );
        require(
            token.balanceOf(owner) >= amount,
            "Token too low or insufficient"
        );
        

        _safeTransferFrom(BUSD, msg.sender, owner, amount);
        _safeTransferFrom(token, owner, msg.sender, amount);

        emit tokenSwap(true);

    }
