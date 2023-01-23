contract Fruit{
  function isFruit() returns(uint256){
     return 20;
  }
}
contract Apple is Fruit{
  function fruitNumber() returns(uint256){
    return isFruit() + 1;
  }
}
