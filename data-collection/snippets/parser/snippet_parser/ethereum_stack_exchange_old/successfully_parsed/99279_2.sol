constructor () payable
{
    contract_owner = payable (msg.sender);
    wei_received = msg.value;
}
