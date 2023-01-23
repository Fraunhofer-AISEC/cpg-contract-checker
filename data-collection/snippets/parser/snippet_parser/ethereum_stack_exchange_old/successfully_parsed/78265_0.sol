contract thiscontract
{

uint256 balancer = 3000;

function something() public payable
{
if(balancer > 0)
{
balancer -= 1000;
msg.sender.transfer(1000);

}

}
}
