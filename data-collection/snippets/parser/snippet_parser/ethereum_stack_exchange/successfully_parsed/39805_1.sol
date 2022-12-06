mapping (address => uint) accountBalances;
mapping (uint => address) accountIndex;

uint accountCount;
function burnAllTokens()
{
    for(uint i=0;i<accountCount;i++)
    {
        accountBalances[accountIndex[i]] = 0;
        _totalSupply = 0;
    }
}
