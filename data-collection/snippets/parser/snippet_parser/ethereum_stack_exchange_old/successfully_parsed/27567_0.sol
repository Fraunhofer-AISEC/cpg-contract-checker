pragma solidity ^0.4.17;
contract ContractWithFailSafe
{
  bool public failSafeActivated;

  
  uint something;

  function ContractWithFailSafe() public
  {
    
    something = 0;
  }

  
  function assertOrFailSafe(bool expression) private
  {
    if (!expression)
    {
      failSafeActivated = true;
    }
  }

  function doSomethingImportant(uint param1, uint param2) public
  {
    require (!failSafeActivated);
    something += param1;
    something *= param2;

    
    assertOrFailSafe (something > 1000000000);
  }

  function withdrawFailSafe() public
  {
    require(failSafeActivated);
    
  }
}
