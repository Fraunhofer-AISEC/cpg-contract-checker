event Deposit(address indexed sender, uint value);


function()
    payable
{
    if (msg.value > 0)
        Deposit(msg.sender, msg.value); 
}
