structure MyReturnData {
   uint256 tTransferAmount;
   uint256 tFee;
   uint256 tLiquidity;
   uint256 tDev;
   uint256 tBurn;
   uint256 tCharity;
}

function _getTValues(uint256 tAmount) private view returns (MyReturnData memory) {}
