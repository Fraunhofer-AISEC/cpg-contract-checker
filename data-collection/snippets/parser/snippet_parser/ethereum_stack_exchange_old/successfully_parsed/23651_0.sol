mapping (address => uint) accountBalances;
mapping (uint => address) accountIndex;
uint accountCount;
function iterateAccountsBalances()
{
    for(uint i=0;i<accountCount;i++)
    {
        doSomeStuff(accountBalances[accountIndex[i]]);
    }
}
