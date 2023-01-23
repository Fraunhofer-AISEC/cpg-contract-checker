function askForHelp(bytes data) public pure returns(string, uint256, bytes32) {
   string memory id = extractId(data);
   uint256 times = extractTimes(data);
   bytes32 signature = extractSig(data);

   return (id, times, signature);
}
