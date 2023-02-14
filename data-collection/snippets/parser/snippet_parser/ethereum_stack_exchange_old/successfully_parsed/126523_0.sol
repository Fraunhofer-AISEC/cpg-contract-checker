function invest(address referer, uint units) external {
         require(enabled, "Pool Not Enabled");
         require(units >= minUnits, "Less than Min Units");
         require(units <= maxUnits, "Over than Max Units");

        uint userid = userids[msg.sender];
        if (userid == 0) {
            totalUsers += 1;
            userid = totalUsers;
            userids[msg.sender] = userid;
            emit UserMsg(userid, "Joined", 0);
        }

        User storage user = users[userid];
        if (user.account == address(0)) {
            user.account = msg.sender;
            user.checkpoint = block.timestamp;
        }

        if (user.referer == address(0) && referer != address(0)) {
            if (users[userids[referer]].totalDeposit > 0 && referer != msg.sender && user.totalDeposit == 0) {
                user.referer = referer;
                users[userids[referer]].partners.push(userid);
                processLevelUpdate(referer, msg.sender);

                address parent = referer;
                for (uint i = 0; i < 5; i++) {
                    if (parent == address(0)) break;
                    levels[userids[parent]].team += 1;
                    parent = users[userids[parent]].referer;
                }
            }
        }

        payForCommission(referer, value); 
        processDeposit(units);
        payReferral(referer, units);
    }
