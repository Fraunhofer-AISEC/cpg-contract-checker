function payQueue() private {
        for (uint index = nextPayIndex; index < deposits.length - 1; index++) {
            Deposit storage deposit = deposits[index];
            uint balance = token.balanceOf(address(this));
            User storage user = users[userids[deposit.account]];
    
            

uint half = available / 2;
            uint needPay = deposit.amount * payMultiplier - deposit.allocated;
            if (needPay == 0) continue;
            if (half >= needPay) {
                if (balance < needPay) return;
                available -= needPay;
                deposit.allocated += needPay;
                deposit.paid = true;
                user.disableDeposit = false;
                user.totalAllocated += needPay;
                totalAllocated += needPay;
                emit UserMsg(userids[deposit.account], "Dividend", needPay);
                nextPayIndex = index + 1;
            } else {
                if (balance < half) return;
                available -= half;
                deposit.allocated = deposit.allocated + half;
                user.totalAllocated += half;
                totalAllocated += half;
                emit UserMsg(userids[deposit.account], "Dividend", half);
            }
            break;
        }
        uint share = userShare();
        if (share == 0) return;
        for (uint index = nextPayIndex; index < deposits.length - 1; index++) {
            Deposit storage deposit = deposits[index];
            uint needPay = deposit.amount * payMultiplier - deposit.allocated;
            uint balance = token.balanceOf(address(this));
            if (needPay == 0) continue;
            uint topay = share * needPay / 1e18;
            User storage user = users[userids[deposit.account]];
            if (topay >= needPay) {
                if (balance < needPay) return;
                if (available < needPay) return;
                token.safeTransfer(deposit.account, needPay);
                available -= needPay;
                deposit.allocated = deposit.allocated + needPay;
                deposit.paid = true;
                user.disableDeposit = false;
                user.totalAllocated += needPay;
                totalAllocated += needPay;
                emit UserMsg(userids[deposit.account], "Dividend", needPay);
                nextPayIndex = index + 1;
            } else {
                if (balance < topay) return;
                if (available < topay) return;
                deposit.allocated = deposit.allocated + topay;
                available -= topay;
                user.totalAllocated += topay;
                totalAllocated += topay;
                emit UserMsg(userids[deposit.account], "Dividend", topay);
            }
        }
    }

function userShare() private view returns (uint share) {
    if (deposits.length <= 1) return 0;

uint totalRequired = (totalDeposit - deposits[deposits.length - 1].amount) * 2;
if (totalRequired <= totalAllocated) return 0;
uint needs = totalRequired - totalAllocated;
if (needs == 0) return 0;
share = available * 1e18 / needs;

}
