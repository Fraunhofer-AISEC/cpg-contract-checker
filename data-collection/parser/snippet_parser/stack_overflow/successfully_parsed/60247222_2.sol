interface IMySecondContract {
  function functionB() external returns(bool);
}

contract MyFirstContract {
  function functionA() public returns(bool) {
      bool result = IMySecondContract(MySecondContract-address-here).functionB();
      return result;
  }
}
