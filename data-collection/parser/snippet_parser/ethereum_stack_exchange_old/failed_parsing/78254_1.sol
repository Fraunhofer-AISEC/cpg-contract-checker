function sending() public payable
{
contract.call.value(1 ether)();
balance[someone] = 0;
}
