
function buy(uint minPurchaseReturn) public payable {
    uint amount = formulaContract.calculatePurchaseReturn(
        (tokenContract.totalSupply() - uncirculatedSupplyCount) - tokenContract.balanceOf(this),
        (address(this).balance + virtualReserveBalance) - msg.value,
        weight,
        msg.value);
    amount = (amount - ((amount * fee) / 1000000));

    
    require (enabled);
    require (amount >= minPurchaseReturn);
    require (tokenContract.balanceOf(this) >= amount);

    
    collectedFees += (msg.value * fee) / 1000000;

    emit Buy(msg.sender, msg.value, amount);
    tokenContract.transfer(msg.sender, amount);
}
