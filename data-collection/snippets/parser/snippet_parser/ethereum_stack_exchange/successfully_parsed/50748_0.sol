function getCredentials(uint id) public constant returns(string,string,uint) 
{
    address ad=acadr[id];
    uemail=email[ad];
    ulocation=location[ad];
    ugid=gid[ad];
    return (uemail,ulocation,ugid);
}
