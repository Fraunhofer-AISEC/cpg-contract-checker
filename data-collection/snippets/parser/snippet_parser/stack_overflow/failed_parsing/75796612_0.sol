modifier onlyWhiteListed {
      address parentAddress = *someFunction*(msg.sender)
      require(whitelist[parentAddress]);
      _;
}
