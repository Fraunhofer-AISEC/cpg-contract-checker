       function mintArtifact(
        uint[] memory submissionID,
        uint[] memory amount) public payable {
        uint tokenIDToMint = submissionID[0];
        uint amountSold = amount[0];
        if (isShutdown) revert ContractShutdown("Contract has been shut down");
        if (tokenIDToMint > submissionCount) revert SubmissionDoesntExist();

        if (msg.value != tokenPrice * amountSold) revert IncorrectAmount("");
        uint seasonOfSubmission = submissions[tokenIDToMint].season;
        if (seasons[seasonOfSubmission].isClosed)
            revert SeasonAlreadyClosed(seasonOfSubmission);
        if (seasons[seasonOfSubmission].endTime < block.timestamp)
            revert SeasonAlreadyClosed(seasonOfSubmission);

        splitPrice(tokenIDToMint, msg.value);

        totalTokensPurchasedPerAddressPerSeason[msg.sender][
        submissions[tokenIDToMint].season
        ] += amountSold;

        totalAmountOfTokensSold[tokenIDToMint] += amountSold;

        totalAmountPurchasedPerToken[msg.sender][tokenIDToMint] += amountSold;

        amountToTokenIDsOfSeason[submissions[tokenIDToMint].season][amountSold]
        .push(tokenIDToMint);

        
        if (
        
            topAmontOfTokenSold[tokenIDToMint] <
            totalAmountPurchasedPerToken[msg.sender][tokenIDToMint]
        ) {
            uint newTopAmount = getTotalAmountPurchasedPerToken(
                msg.sender,
                tokenIDToMint
            );
            artifactTopBuyer[tokenIDToMint] = msg.sender;
            topAmontOfTokenSold[tokenIDToMint] = newTopAmount;
        }

        _setURI(tokenIDToMint, submissions[tokenIDToMint].tokenURI);

        _mintBatch(msg.sender, submissionID, amount, "");
        _mintBatch(protocolWallet, submissionID, amount, "");
        _mintBatch(
            submissions[tokenIDToMint].SubmissionOwner,
            submissionID,
            amount,
            ""
        );
}
