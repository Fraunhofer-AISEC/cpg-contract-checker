receive() external payable {
  require(msg.value >= .01 ether, "INSUFFICIENT_FUNDS"); 
  executeMint(msg.value / .01 ether); 
}


function executeMint(uint256 numberOfMints) internal {
  payable(_nftContractAddy).transfer(msg.value); 
}
