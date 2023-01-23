 function getProb(uint N, uint C) public pure returns(uint) {
     uint maxProb = 1000000;
     require(C <= maxProb, "C must be between 0 and 1000000");
     uint negativeProb = (maxProb - C) ** N / maxProb ** (N - 1);
     return maxProb - negativeProb;
}
