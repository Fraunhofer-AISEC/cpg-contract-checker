constructor() ERC20("WaterDoge", "WTDoge") {
        

        buyDeadFees = 0;
        sellDeadFees = 0;
        buyMarketingFees = 6;
        sellMarketingFees = 6;
        buyLiquidityFee = 2;
        sellLiquidityFee = 2;
        buyRewardsFee = 0;
        sellRewardsFee = 0;
        buyDevFee = 2;
        sellDevFee = 2;
        buyCharityFee = 4;
        sellCharityFees = 4;
        transferFee = 0;

        totalBuyFees = buyRewardsFee
            .add(buyLiquidityFee)
            .add(buyMarketingFees)
            .add(buyDevFee)
            .add(buyCharityFee);
        totalSellFees = sellRewardsFee
            .add(sellLiquidityFee)
            .add(sellMarketingFees)
            .add(sellDevFee)
            .add(sellCharityFees);

        dividendTracker = new waterdogeDividendTracker(
            payable(this),
            router,
            0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7,
            "waterdogeTRACKER",
            "WTDogeTRACKER"
        );

    function updateFees(
        uint256 deadBuy,
        uint256 deadSell,
        uint256 marketingBuy,
        uint256 marketingSell,
        uint256 liquidityBuy,
        uint256 liquiditySell,
        uint256 RewardsBuy,
        uint256 RewardsSell,
        uint256 CharitySell,
        uint256 CharityBuy,
        uint256 devBuy,
        uint256 devSell
    ) public onlyOwner {
        buyDeadFees = deadBuy;
        buyMarketingFees = marketingBuy;
        buyLiquidityFee = liquidityBuy;
        buyRewardsFee = RewardsBuy;
        sellDeadFees = deadSell;
        sellMarketingFees = marketingSell;
        sellLiquidityFee = liquiditySell;
        sellRewardsFee = RewardsSell;
        buyDevFee = devBuy;
        sellDevFee = devSell;
        buyCharityFee = CharityBuy;
        sellCharityFees = CharitySell;

        totalSellFees = sellRewardsFee
            .add(sellLiquidityFee)
            .add(sellMarketingFees)
            .add(sellDevFee)
            .add(sellCharityFees);

        totalBuyFees = buyRewardsFee
            .add(buyLiquidityFee)
            .add(buyMarketingFees)
            .add(buyDevFee)
            .add(buyCharityFee);

        require(totalSellFees <= 30 && totalBuyFees <= 30, "total fees cannot exceed 30% sell or buy");

        emit UpdateFees(
            sellDeadFees,
            sellCharityFees,
            sellMarketingFees,
            sellLiquidityFee,
            sellRewardsFee,
            sellDevFee,
            buyDeadFees,
            buyMarketingFees,
            buyLiquidityFee,
            buyRewardsFee,
            buyDevFee,
            buyCharityFee

        );
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(!_isBlacklisted[to], "Recipient is backlisted");
        require(!_isBlacklisted[from], "Sender is backlisted");
        uint256 RewardsFee;
        uint256 deadFees;
        uint256 marketingFees;
        uint256 liquidityFee;
        uint256 devFees;
        uint256 CharityFees;

        checkTxLimit(from, amount);

        if (!canTransferBeforeTradingIsEnabled[from]) {
            require(tradingEnabled, "Trading has not yet been enabled");
        }
        if (amount == 0) {
            super._transfer(from, to, 0);
            return;
        } else if (
            !swapping && !_isExcludedFromFees[from] && !_isExcludedFromFees[to]
        ) {
            bool isSelling = automatedMarketMakerPairs[to];
            bool isBuying = automatedMarketMakerPairs[from];

            if (!isBuying && !isSelling) {
                uint256 tFees = amount.mul(transferFee).div(100);
                amount = amount.sub(tFees);
                super._transfer(from, address(this), tFees);
                super._transfer(from, to, amount);
                dividendTracker.setBalance(from, getStakingBalance(from));
                dividendTracker.setBalance(to, getStakingBalance(to));
                return;
            }
            
            else if (!isBuying && stakingEnabled) {
                require(
                    stakingUntilDate[from] <= block.timestamp,
                    "Tokens are staked and locked!"
                );
                if (stakingUntilDate[from] != 0) {
                    stakingUntilDate[from] = 0;
                    stakingBonus[from] = 0;
                }
            }

            else if (isSelling) {
                RewardsFee = sellRewardsFee;
                deadFees = sellDeadFees;
                marketingFees = sellMarketingFees;
                liquidityFee = sellLiquidityFee;
                devFees = sellDevFee;
                CharityFees = sellCharityFees;

                if (AntiBot) {
                require(block.timestamp >= _holderLastTransferTimestamp[tx.origin] + cooldowntimer,
                        "cooldown period active, come back in 24hours");
                _holderLastTransferTimestamp[tx.origin] = block.timestamp;

                }

            } else if (isBuying) {
                RewardsFee = buyRewardsFee;
                deadFees = buyDeadFees;
                marketingFees = buyMarketingFees;
                liquidityFee = buyLiquidityFee;
                devFees = buyDevFee;
                CharityFees = buyCharityFee;

                if (AntiBot) {
                require(block.number > launchblock + 2,"you shall not pass");
                require(tx.gasprice <= gasPriceLimit,"Gas price exceeds limit.");
                require(_holderLastTransferBlock[tx.origin] != block.number,"Too many TX in block");
                _holderLastTransferBlock[tx.origin] = block.number;
            }
            
            uint256 contractBalanceRecipient = balanceOf(to);
            require(contractBalanceRecipient + amount <= maxWallet,
                    "Exceeds maximum wallet token amount." );
            require(amount <= maxTransactionAmount,
                    "Exceeds maximum TX transaction amount");
            }

            uint256 totalFees = RewardsFee
                .add(liquidityFee + marketingFees + devFees + CharityFees);

            uint256 contractTokenBalance = balanceOf(address(this));

            bool canSwap = contractTokenBalance >= swapTokensAtAmount;

            if (canSwap && !automatedMarketMakerPairs[from]) {
                swapping = true;

                if (swapAndLiquifyEnabled && liquidityFee > 0 && totalBuyFees > 0) {
                    uint256 totalBuySell = buyAmount.add(sellAmount);
                    uint256 swapAmountBought = contractTokenBalance
                        .mul(buyAmount)
                        .div(totalBuySell);
                    uint256 swapAmountSold = contractTokenBalance
                        .mul(sellAmount)
                        .div(totalBuySell);

                    uint256 swapBuyTokens = swapAmountBought
                        .mul(liquidityFee)
                        .div(totalBuyFees);

                    uint256 swapSellTokens = swapAmountSold
                        .mul(liquidityFee)
                        .div(totalSellFees);

                    uint256 swapTokens = swapSellTokens.add(swapBuyTokens);

                    swapAndLiquify(swapTokens);
                }

                uint256 remainingBalance = balanceOf(address(this));
                swapAndSendDividends(remainingBalance);
                buyAmount = 0;
                sellAmount = 0;
                swapping = false;
            }

> **uint256 fees = amount.mul(totalFees).div(100);**
            uint256 burntokens;

            if (deadFees > 0) {
            burntokens = amount.mul(deadFees) / 100;
            super._transfer(from, DEAD, burntokens);
            _totalSupply = _totalSupply.sub(burntokens);

            }

            amount = amount.sub(fees + burntokens);

            if (isSelling) {
                sellAmount = sellAmount.add(fees);
            } else {
                buyAmount = buyAmount.add(fees);
            }

            super._transfer(from, address(this), fees);

            uint256 gas = gasForProcessing;

            try dividendTracker.process(gas) returns (
                uint256 iterations,
                uint256 claims,
                uint256 lastProcessedIndex
            ) {
                emit ProcessedDividendTracker(
                    iterations,
                    claims,
                    lastProcessedIndex,
                    true,
                    gas,
                    tx.origin
                );
            } catch {}
        }

        super._transfer(from, to, amount);
        dividendTracker.setBalance(from, getStakingBalance(from));
        dividendTracker.setBalance(to, getStakingBalance(to));
    }

}
    
}
