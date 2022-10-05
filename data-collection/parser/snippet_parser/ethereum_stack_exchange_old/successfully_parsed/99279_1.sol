constructor () payable
{
    contract_owner = payable (msg.sender);
    wei_received = 1;
    wei_received = msg.value;
}
