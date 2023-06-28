function getContractBalance() external returns(uint256 theBalance) {
    return address(this).balance;
}
