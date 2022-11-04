function getNumber(uint256 number) private pure returns (uint256) {
    uint256 decimals = 18;

    uint256 numberAfterDecimals = number % (10**decimals);

    uint256 checkDecimals = 3;

    while(checkDecimals < decimals) {
        uint256 factor = 10**(decimals - checkDecimals);
        
        if(numberAfterDecimals % factor == 0) {
            return numberAfterDecimals / factor;
        }
        if(numberAfterDecimals % factor != 0) {
        uint256 extraNumberAfterDecimals = numberAfterDecimals % factor;

        return numberAfterDecimals - extraNumberAfterDecimals;
        }
        checkDecimals++;
    }

    return numberAfterDecimals;
}
