function sellName() constant returns (bool ok)
{
    address a = 0x4c3032756d5884D4cAeb2F1eba52cDb79235C2CA;
    Selling memory myStruct = Selling(a,"hey",12);
    
    selling[a] = myStruct;
}
