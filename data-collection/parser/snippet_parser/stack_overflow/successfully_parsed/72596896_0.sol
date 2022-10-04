contract SetValue {

  function set(address contractAddress, string memory val) public payable {
    (bool success, ) = address(contractAddress).call(abi.encodeWithSignature('setSentence(string)', val));
    require(success, "Failed");
  }
}
