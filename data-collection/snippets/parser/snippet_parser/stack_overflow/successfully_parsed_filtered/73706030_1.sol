  function deposit(uint256 amount) public payable override whenNotPaused withinTransactionLimit(amount) nonReentrant {
    require(amount >= 110, "Must deposit 110 or more");
    uint256 depositShares = getNumShares(amount);
    uint256 potentialNewTotalShares = totalShares().add(depositShares);
    require(poolWithinLimit(potentialNewTotalShares), "Deposit would put the Pool over the total limit.");
    emit DepositMade(msg.sender, amount, depositShares);
    bool success = doUSDCTransfer(msg.sender, address(this), amount);
    require(success, "Failed to transfer for deposit");

    config.getJuniorToken().juniorPoolMintTo(msg.sender, depositShares);
  }


  function juniorPoolMintTo(address to, uint256 amount) public onlyJuniorLendingPool {
    require(canMintForJuniorPool(amount), "Cannot mint: it would create an asset/liability mismatch");
    super._mint(to, amount);
  }

  function doUSDCTransfer(
    address from,
    address to,
    uint256 amount
  ) internal returns (bool) {
    require(to != address(0), "Can't send to zero address");
    IERC20withDec usdc = config.getUSDC();
    return usdc.transferFrom(from, to, amount);
  }
