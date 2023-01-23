pragma solidity ^0.4.21;

contract FirstContract {

  bool public isTrue = true;

  function sayHello() public pure returns(bool) {
      return true;
  }

}

contract ServiceContract {

  FirstContract firstContract;

  function ServiceContract (address _firstContract) public {
    firstContract = FirstContract(_firstContract);
  }

  function confirmFirstContract() public view returns(bool) {
      bool x = firstContract.isTrue();
      return x;
  }

  function sayHi() public view returns(bool) {
      bool y = firstContract.sayHello();
      return y;
  }

}
