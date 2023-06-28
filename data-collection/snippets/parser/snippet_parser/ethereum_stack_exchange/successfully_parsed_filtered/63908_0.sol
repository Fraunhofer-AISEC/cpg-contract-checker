interface AddressChecksum {
  function getChecksum(address account) external pure returns (string accountChecksum);
  function getChecksumCapitalizedDigits(address account) external pure returns (bool[40] digitCapitalized);
  function isChecksumValid(string accountChecksum) external pure returns (bool ok);
}
