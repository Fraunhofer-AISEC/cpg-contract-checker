            if(isBonusValid(_bonusAddress, _to)) {
            
            uint256 bonusRewardTokens = _amount
                .mul(totalBuy.sub(bonusBuy).sub(buyerGains)
                .div(100));
            pendingBonusTokensForReward = pendingBonusTokensForReward.add(bonusRewardTokens);
            
            uint256 buyerRewardTokens = _amount
               .mul(totalBuy.sub(bonusBuy).sub(bonusGains)
                .div(100));
            pendingBuyerReferredTokensForReward = pendingBuyerTokensForReward.add(buyerRewardTokens); 
        }
