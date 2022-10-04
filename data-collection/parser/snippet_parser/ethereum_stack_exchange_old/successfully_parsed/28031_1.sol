contract TestContract {
  uint256 var1 = 0;

  function test()
  {
     if (var1 == 0)
     {
        var1 = 1;
     }
     else
     {
        throw;
     }
  }
}
