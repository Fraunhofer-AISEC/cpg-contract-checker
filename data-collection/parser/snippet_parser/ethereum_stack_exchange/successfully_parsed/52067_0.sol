function withdraw() external stateRequired(State.OPEN) {
            require(contributorData[address(msg.sender)].contribution > 0);

            uint256 depositedContribution = contributorData[address(msg.sender)].contribution.add(contributorData[address(msg.sender)].contributionFee);

            fees = fees.sub(contributorData[address(msg.sender)].contributionFee);
            size = size.sub(depositedContribution);

            contributions--;

            msg.sender.transfer(depositedContribution);

            contributorData[address(msg.sender)].contributionFee = 0;
            contributorData[address(msg.sender)].contribution = 0;
            contributorData[address(msg.sender)].contributed = false;

            emit ContributionWithdrawn(msg.sender, this, depositedContribution);
        }
