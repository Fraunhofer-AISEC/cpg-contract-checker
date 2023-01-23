function sell(uint returnAmount, uint outcomeIndex, uint maxOutcomeTokensToSell) external {
        uint outcomeTokensToSell = calcSellAmount(returnAmount, outcomeIndex);

        require(outcomeTokensToSell <= maxOutcomeTokensToSell, "maximum sell amount exceeded");

        conditionalTokens.safeTransferFrom(msg.sender, address(this), getPositionIds()[outcomeIndex], outcomeTokensToSell, "");

        uint feeAmount = (returnAmount * fee) / (ONE - fee);
        feePoolWeight = feePoolWeight + feeAmount;

        uint returnAmountPlusFees = returnAmount + feeAmount;
        mergePositionsThroughAllConditions(returnAmountPlusFees);

        require(collateralToken.transfer(msg.sender, returnAmount), "return transfer failed");

        emit FPMMSell(msg.sender, returnAmount, feeAmount, outcomeIndex, outcomeTokensToSell , questioned);


        if (outcomeIndex == 0) {
            longtradevolume = longtradevolume + returnAmount;
        }

        else 
        {
            shorttradevolume = shorttradevolume + returnAmount;
        }
    }
