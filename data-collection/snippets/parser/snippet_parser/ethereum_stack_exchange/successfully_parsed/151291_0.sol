function buyTokens(
        uint256 _amount
    ) public payable onlyWhiteListed onlyWhileOpen {
        uint256 requiredEth = (_amount / 1e18) * price;
        require(msg.value == requiredEth, "Invalid amount of Ether");
        require(_amount <= maxPurchase && _amount >= minPurchase);
        require(dappToken.balanceOf(address(this)) >= _amount);

        purchaseAmount[msg.sender] += _amount;

        require(dappToken.transfer(msg.sender, _amount));

        tokensSold += _amount;

        (bool success, ) = owner.call{value: requiredEth}("");
        require(success, "Failed to send Ether");

        emit Buy(_amount, msg.sender);
    }

 function refundCampaign() public onlyCampaignEnd {
        require(refundStatus == true, "Refund is not enabled");

        uint256 refundAmount = purchaseAmount[msg.sender];

        require(refundAmount > 0, "You have not purchased any tokens");

        purchaseAmount[msg.sender] = 0;
        tokensSold -= refundAmount;

        dappToken.transferFrom(msg.sender, address(this), refundAmount);

        uint256 ethAmount = refundAmount * price;
        require(address(this).balance >= ethAmount, "Insufficient balance");

        (bool ethSuccess, ) = msg.sender.call{value: ethAmount}("");
        require(ethSuccess, "Failed to send Ether");

        emit Refund(msg.sender, refundAmount);
    }
