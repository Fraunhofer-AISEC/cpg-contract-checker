function sending() public payable
{
contract.transfer(1 ether);
balance[someone] = 0;
}
