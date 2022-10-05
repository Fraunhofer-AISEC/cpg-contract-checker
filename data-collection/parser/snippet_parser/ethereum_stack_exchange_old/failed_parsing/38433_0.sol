function sell(bool limit, uint256 whichquery, uint8 whichoutcome, uint256 amount, uint16 price) {
        uint cumulativeamountgained;
        uint numorderstobedeleted;
        uint amountnotfilled = amount;
        if(tokenHoldings[msg.sender][whichquery][whichoutcome] < amount) throw;
        if(limit){
            for (uint i=orderbook[whichquery][whichoutcome][0].length-1;i>=0;i--){
                if(orderbook[whichquery][whichoutcome][0][i][0] >= price) {
                    if(orderbook[whichquery][whichoutcome][0][i][1] > amountnotfilled){
                        orderbook[whichquery][whichoutcome][0][i][1] -= amountnotfilled;
                        tokenHoldings[address(orderbook[whichquery][whichoutcome][0][i][2])][whichquery][whichoutcome] += amountnotfilled;
