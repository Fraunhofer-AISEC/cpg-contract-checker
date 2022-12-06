contract Example {
  uint256 intOne;
  uint256 intTwo;

  function test1()
    public
    payable
  {
    intOne = 300;
  }

  function test2()
    public
    payable
  {
    intOne = 0;
    intTwo = 300;
  }
}
