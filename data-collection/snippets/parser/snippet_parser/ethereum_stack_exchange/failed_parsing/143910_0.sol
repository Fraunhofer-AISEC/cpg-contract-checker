uint256 totalWeight = 0;

percents.forEach(p => totalWeight += p);

require(BASIS_POINTS_FACTOR() == totalWeight, "NOT100");
