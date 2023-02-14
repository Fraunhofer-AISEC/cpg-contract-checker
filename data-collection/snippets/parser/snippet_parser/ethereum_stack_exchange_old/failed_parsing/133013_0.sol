contract Member {
  using ECDSAUpgradeable for bytes32;

...

  function join(
    bytes memory signature,
  ) public returns (uint256) {
    bytes32 _hash = _getHash(msg.sender);
    address inviter = ECDSAUpgradeable.recover(_hash, signature);
    require(msg.sender != inviter, "Cannot invite yourself");

  function _getHash(address invited) private view returns (bytes32) {
    uint256 _timeStamp = _getTimeStamp();
    return toEthSignedMessageHash(
      abi.encodePacked(
        StringsUpgradeable.toString(_timeStamp),
        ",",
        StringsUpgradeable.toHexString(uint160(invited), 20)
      )
    );
  }
...
