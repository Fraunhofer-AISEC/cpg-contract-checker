uint256 unsoldTokens = totalTokensForSale.sub(alreadyMinted);
    if (unsoldTokens > 0) {
      tokensForEcosystem = tokensForEcosystem.add(unsoldTokens);
    }
