uint256 amountToBurn = calculateBurnAmount(amount);
uint256 amountToTransfer = amount - amountToBurn;
_transfer(_msgSender(), recipient, amountToTransfer);
_burn(_msgSender(), amountToBurn);
