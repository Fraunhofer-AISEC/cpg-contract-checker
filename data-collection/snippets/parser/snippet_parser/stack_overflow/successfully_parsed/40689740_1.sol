function init(address[] provAddrs, uint provCount,address mainAcc)
{
    clientAddr = mainAcc;
    for(uint i = 0;i<provCount;i++)
    {
        providers[i].profit = 0;
        providers[i].addr = provAddrs[0];
        provCount++;
    }
}
