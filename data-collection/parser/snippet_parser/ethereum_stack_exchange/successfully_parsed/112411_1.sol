function donate() hasEther public payable
{
   owner.transfer(msg.value);
}
