contract ERC223Receiver
{
    function tokenFallback(address _from, uint _value, bytes _data);
}

contract YourContract is ERC223Receiver
{
    function tokenFallback(address _from, uint _value, bytes _data)
    {
        
    }
}
