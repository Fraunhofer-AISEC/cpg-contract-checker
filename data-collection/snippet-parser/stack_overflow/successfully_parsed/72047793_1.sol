function processDeposit(address referer, uint units) private returns (uint value) {
    uint userid = userids[msg.sender];
    User storage user = users[userid];
    if (userid == 0) {
        totalUsers += 1;
        userid = totalUsers;
        userids[msg.sender] = userid;
        user.checkpoint = block.timestamp;
        emit UserMsg(userid, "Joined", 0);
    }
    if (user.account == address(0)) {
        user.account = msg.sender;
    }
    require(user.disableDeposit != true, "Pending Withdraws");
    user.disableDeposit = true;
    if (user.referer == address(0)) {
        if (users[userids[referer]].deposits.length > 0 && referer != msg.sender) {
            user.referer = referer;
            processLevelUpdate(referer, msg.sender);
        }
    }
    require(units > 0);
    require(units <= maxUnits, "Over than Max Units");
    value = units * price;
    token.safeTransferFrom(msg.sender, address(this), value);
    totalDeposit += value;

    Deposit memory deposit;
    deposit.amount = value;
    deposit.account = msg.sender;
    deposit.checkpoint = block.timestamp;

    emit UserMsg(userids[msg.sender], "Deposit", value);
    user.deposits.push(deposits.length);
    deposits.push(deposit);
    user.totalDeposit += value;
    available += value;

    uint companyOut = value * companyFee / 1000;
    token.safeTransfer(companyWallet, companyOut);
    uint treasuryOut = value * treasuryRate / 1000;
    token.safeTransfer(treasuryWallet, treasuryOut);
    uint poolOut = value * poolRate / 1000;
    token.safeTransfer(poolWallet, poolOut);
    uint techOut = value * techFee / 1000;
    token.safeTransfer(techWallet, techOut);
    uint commi = companyOut + treasuryOut + poolOut + techOut;
    emit Commission(commi);
    available -= commi;
    return commi;
}
