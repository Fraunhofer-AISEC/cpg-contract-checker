function doSomething() 
  payable
  returns(uint)
{
  require(msg.value == 1 ether);
  return 1;
}
