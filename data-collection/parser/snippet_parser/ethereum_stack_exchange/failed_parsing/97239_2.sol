    function invest(address referrer, uint8 plan) public payable {
    require(msg.value >= INVEST_MIN_AMOUNT);
    require(plan < 6, "Invalid plan");

    uint256 fee = msg.value.mul(PROJECT_FEE).div(PERCENTS_DIVIDER);
    commissionWallet.transfer(fee);
    emit FeePayed(msg.sender, fee);

    User storage user = users[msg.sender];

    if (user.referrer == address(0)) {
        if (users[referrer].deposits.length > 0 && referrer != msg.sender) {
            user.referrer = referrer;
        }
