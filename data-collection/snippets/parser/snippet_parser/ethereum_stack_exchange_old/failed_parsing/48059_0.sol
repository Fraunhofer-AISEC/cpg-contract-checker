uint256 usersLength = users.length;
for (var i = 0; i < usersLength; i++ ) {
    address user = users[i];
    uint256 refundAmount = pooledMoney[user];
    user.transfer(refundAmount);
)
selfdestruct(owner);
