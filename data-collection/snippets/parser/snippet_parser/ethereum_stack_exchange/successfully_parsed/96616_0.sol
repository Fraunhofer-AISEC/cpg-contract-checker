pragma solidity ^0.8.0;





function takeCommission(address seller, address platform, uint256 amountPaid, uint256 commissionPercentage) private {
    
    require(amountPaid % 100 == 0);
    
    uint256 platformFee = (amountPaid  * commissionPercentage) / 100;
    amountPaid -= platformFee;
    payable(seller).transfer(amountPaid);
    payable(platform).transfer(platformFee);
}
