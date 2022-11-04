    function calculatePurchaseReturn(
        uint256 _totalSupply,
        uint256 _depositAmount
    ) public pure returns (uint256) {
        uint256 temp = 1000*_depositAmount + _totalSupply*_totalSupply*_totalSupply;
        temp = powerOneThird(temp); 
        
        return temp - _totalSupply;
    }
