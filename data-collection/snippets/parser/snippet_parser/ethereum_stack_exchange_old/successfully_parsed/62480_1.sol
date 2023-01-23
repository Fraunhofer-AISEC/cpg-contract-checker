function foo(uint a, uint b) 
    public 
    onlyPayloadSize(2*32)
{
    bar(a, b, msg.sender);
}

function bar(uint a, uint b, address c)
    public
    onlyPayloadSize(3*32)
{
    
    
}
