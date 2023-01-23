
  function register(
    string memory name,
    bytes calldata encryptedEmail,
    address upkeepContract,
    uint32 gasLimit,
    address adminAddress,
    bytes calldata checkData,
    uint96 amount,
    uint8 source
  ) external onlyLINK {
    require(adminAddress != address(0), "invalid admin address");
    bytes32 hash = keccak256(abi.encode(upkeepContract, gasLimit, adminAddress, checkData));

    emit RegistrationRequested(
      hash,
      name,
      encryptedEmail,
      upkeepContract,
      gasLimit,
      adminAddress,
      checkData,
      amount,
      source
    );

    AutoApprovedConfig memory config = s_config;
    if (config.enabled && _underApprovalLimit(config)) {
      _incrementApprovedCount(config);

      _approve(name, upkeepContract, gasLimit, adminAddress, checkData, amount, hash);
    } else {
      uint96 newBalance = s_pendingRequests[hash].balance.add(amount);
      s_pendingRequests[hash] = PendingRequest({admin: adminAddress, balance: newBalance});
    }
  }
