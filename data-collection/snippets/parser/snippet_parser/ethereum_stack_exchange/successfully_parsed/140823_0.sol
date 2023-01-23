function _swapWithEth () external payable {
        require(msg.value > 0 , "Amount zero");

        uint _amountInWithFee = (msg.value * 995) / 1000;
        
        uint256 ethPrice = getEthPrice();
        _amountOut =(_amountInWithFee * ethPrice / price);

        MYToken.transfer(msg.sender, _amountOut);

    }
