                uint256 rewardTokens = ((rewardingTokenAmount) /
                (raise)) * amtInvestorInvested;

                IERC20(rewardingToken).transfer(
                    msg.sender,
                    rewardTokens
                )
