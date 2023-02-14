 function claimReturns(address claimant) private {
        uint otherTotals = safeSub(lastYearsTotalSupply, accounts[claimant].balance);
        uint newAmount = safeDiv(safeMul(safeMul(accounts[claimant].balance, multiplier), otherTotals), lastYearsTotalSupply);
        mint(newAmount, claimant);
    }
