function calculateSplitPercent() public {
    for(uint256 i = 0; i >= uniqueIdCounter; i++) {
        uint256 spliPercent = balanceOf[uniqueIdToAddress[i]].div(totalFunded).mul(100);
        addrsToSplitPercentage[uniqueIdToAddress[i]] = spliPercent;
        splitPercentageToAddrs[spliPercent] = uniqueIdToAddress[i];
    }
}
