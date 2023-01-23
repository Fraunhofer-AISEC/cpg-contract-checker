function pay(address _from, uint256 _tokenId) external payable noReentrant {
    uint256 balance = msg.sender.balance;
    require(balance > 0.011 ether, "There is not enough eth");        

    payable(__ADDRESS2__).transfer(0.001 ether);
}

receive() external payable {
}

fallback() external payable {
}
