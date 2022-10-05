
 function getDistributableAmount() public view returns(uint) {
        uint tokenAmount = TOKENB.tokenBalances(msg.sender);
        uint totalBSupply = TOKENB.totalAmount();

        uint totalAmount = TOKENA.balanceOf(this);

        return totalAmount.mul(totalBSupply).div(totalAmount);
    }
