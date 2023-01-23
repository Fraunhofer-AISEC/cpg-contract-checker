function Buy() 
    public 
    payable 
{
    require (msg.sender != seller);
    require (msg.value >= price);
    orderNum++;
    safePay +=msg.value;
}
