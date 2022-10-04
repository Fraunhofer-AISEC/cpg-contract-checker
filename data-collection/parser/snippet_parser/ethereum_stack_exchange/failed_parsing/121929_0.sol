address yourWalletAddress = 0x....;
uint256 claimAmount = 0.5 ether;
function claimToken() public {
    TokenInterface = TokenInterface(yourWalletAddress);
    TokenInterface.transferFrom(address(this), msg.sender, claimAmount);
}
