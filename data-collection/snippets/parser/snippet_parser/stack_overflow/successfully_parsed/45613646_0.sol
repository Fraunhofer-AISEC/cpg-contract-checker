contract C{
address A;
address B;
address C;


mapping (address=>bool) permission;
function send_permission(address _to, uint value)
{
if(permission[A]&&permission[A]&&permission[A])
_to.transfer(value);
}


function set_permission(bool state)
{
    permission[msg.sender]=state;
}
}
