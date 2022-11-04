contract StateTest
{
    uint public u;
    bool public  b;
    int  public  i;
    string public  s;
    byte   public  by;
    bytes  public  bs;
    address public  a;

    function StateTest()
    {
        u=1;
        b=true;
        i=-1;
        s="abc";
        by = 0x13;

        bs=new bytes(2);
        bs[0]=0x11;
        bs[1]=0xff;

        a = msg.sender;
    }
}
