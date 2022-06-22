function _genTier(uint256 seed) internal view returns (uint256) {
        uint256 index = seed % probabilities.length;
        uint256 rarity = seed.mul(100).div(MAX_SUPPLY);
        if(rarity < probabilities[index]) {
        rarity = index;
    } else {
        rarity = aliases[index];
    }

    return rarity;
}
