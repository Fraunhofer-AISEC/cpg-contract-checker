contract getData{

    IProtocolDataProvider public AD;

    constructor(address _ada) {
        AD = IProtocolDataProvider(_ada);
    }

    function getD(address _asset) public view returns(uint){

        (
            uint256 availableLiquidity, uint256 totalStableDebt, uint256 totalVariableDebt, uint256 liquidityRate, uint256 variableBorrowRate, uint256 stableBorrowRate, uint256 averageStableBorrowRate, uint256 liquidityIndex, uint256 variableBorrowIndex, uint40 lastUpdateTimestamp
        ) = AD.getReserveData(_asset);
        return availableLiquidity;
    }
}
