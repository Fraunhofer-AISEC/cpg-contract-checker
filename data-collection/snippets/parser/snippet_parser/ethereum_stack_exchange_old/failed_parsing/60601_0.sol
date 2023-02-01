function exchange(uint256 amount, bool specialCase) external returns (uint256) {
    let retVal;
    if (specialCase) {
        register(amount);
        retVal = 0;
    }
    else if (amount > address(this).balance) {
        register(amount - address(this).balance);
        retVal = address(this).balance;
    }
    else {
        register(0);
        retVal = amount;
    }
    require(authorized(msg.sender));
    msg.sender.transfer(retVal);
    return retVal;
}
