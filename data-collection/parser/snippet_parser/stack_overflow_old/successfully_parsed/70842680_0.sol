function swapAndSendToFee (uint256 tokens) private {
uint256 ethToSend = swapTokensForEth(tokens);

if (ethToSend > 0)
payable(_projectWallet).transfer(ethToSend);

}
