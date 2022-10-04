struct User {
        uint totalDeposit;
        uint totalWithdrawn;
        Deposit [] deposits;
        Withdraw [] withdrawals;
        uint available;
    }
totalWithdrawn = totalWithdrawn.add(amount);
        user.totalWithdrawn = user.totalWithdrawn.add(amount);
        **user.withdrawals.push(Withdraw(amount, block.timestamp));**
        user.available = user.available.sub(amount);
