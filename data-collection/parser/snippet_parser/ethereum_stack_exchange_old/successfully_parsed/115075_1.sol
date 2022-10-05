function getRandomNumber() public returns (bytes32 requestId) {
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
    return requestRandomness(keyHash, fee);
}
