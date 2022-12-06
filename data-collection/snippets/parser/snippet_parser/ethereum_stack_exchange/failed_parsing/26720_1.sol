Contract Ext{
 Struct user{
    uint dailybalance;
 }
 mapping ( address => user[] ) userDailyBalances;

function getDailyBalance(user) constant returns(unit) {
        return userDailyBalances( user )[0].dailybalance;
    }

}
