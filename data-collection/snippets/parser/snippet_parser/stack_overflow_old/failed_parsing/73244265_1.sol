 function setFormula(uint256 fromPrice1, uint256 toPrice1, uint256 daystohold1,
    uint256 fromPrice2, uint256 toPrice2, uint256 daystohold2,
    uint256 fromPrice3, uint256 toPrice3,  uint256 daystohold3,
     uint256 elsedaystohold4) public onlyOwner {

            if(getLastPrice <= fromPrice1 && getLastPrice <=toPrice1){
                onHold = true;
                endHold = block.timestamp + daystohold1 days;
            }
