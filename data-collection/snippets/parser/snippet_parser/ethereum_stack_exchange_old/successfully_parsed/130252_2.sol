receive() external payable {
    uint targetBalance = address(targetContract).balance;
    if (targetBalance >= targetValue) {
        targetContract.withdraw(targetValue);
    }
}
