
pragma solidity >=0.7.4;
contract FirstContract {
  int count = 0;
  function incr() public{
    count = 15;
  }
  function decr() public{
    count = 10;
  }
  function display() public view returns (int){
    return count;
  }
}
