function getBalance(bytes calldata data) public pure returns (uint256 balance) {
  (balance) = abi.decode(data, (uint256));
}



function getBalance() public pure returns (uint256 balance) {
  bytes memory data = hex'000000000000000000000000278261c4545d65a81ec449945e83a236666b64f5';
  (balance) = abi.decode(data, (uint256));
}
