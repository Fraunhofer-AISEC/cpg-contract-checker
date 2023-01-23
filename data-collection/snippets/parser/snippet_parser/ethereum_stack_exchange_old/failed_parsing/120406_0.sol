contract A {
  function getNum() external view returns (uint){
    return 1;
  }
}

contract B {
  A newContract = new A();
  newContract.getNum(); 
}

