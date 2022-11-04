function fundSubscription(uint256 amount) external onlyOwner {

    linkToken.transferAndCall(address(coordinator), amount, abi.encode(s_subscriptionId));
}
