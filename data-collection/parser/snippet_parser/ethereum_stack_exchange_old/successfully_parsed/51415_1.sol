function lookup(uint256 index) private pure returns (uint256) {
    if      (index <=   0) return  0;
    else if (index <=   2) return  1;
    else if (index <=   5) return  2;
    else if (index <=   9) return  3;
    else if (index <=  14) return  4;
    else if (index <=  20) return  5;
    else if (index <=  27) return  6;
    else if (index <=  35) return  7;
    else if (index <=  44) return  8;
    else if (index <=  54) return  9;
    else if (index <=  65) return 10;
    else if (index <=  76) return 11;
    else if (index <=  86) return 12;
    else if (index <=  95) return 13;
    else if (index <= 103) return 14;
    else if (index <= 110) return 15;
    else if (index <= 116) return 16;
    else if (index <= 121) return 17;
    else if (index <= 125) return 18;
    else if (index <= 128) return 19;
    else                   return 20;
}
