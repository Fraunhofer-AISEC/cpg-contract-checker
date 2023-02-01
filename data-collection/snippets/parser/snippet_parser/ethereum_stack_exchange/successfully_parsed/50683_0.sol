for(uint i = 1; i <= newestId; i++)
{
    uint unitsAmount = user.units[i];
    if(unitsAmount == 0)
    {
        continue;
    }
    RevenueData storage r = RevenueData[i];
    revenue = revenue.add(r.revenueForUnit.mul(unitsAmount));
    uint j = i + 1;
    user.units[j] = user.units[j].add(unitsAmount);
    user.units[i] = 0;
}
