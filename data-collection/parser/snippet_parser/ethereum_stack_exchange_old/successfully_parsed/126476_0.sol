
pragma solidity ^0.8.7;
import "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPool.sol";

contract Main {
function wrapper() public view returns(uint borrowRate) {
IPool contractInstance = IPool(0xE039BdF1d874d27338e09B55CB09879Dedca52D8);
DataTypes.ReserveData memory reserveData = contractInstance.getReserveData(0x3B00Ef435fA4FcFF5C209a37d1f3dcff37c705aD);
borrowRate = reserveData.currentVariableBorrowRate;
return borrowRate;
}
}
