pragma solidity ^0.4.18;

contract d8 {
    function myBalance() public  returns (uint myNumber);

}

contract d15 is d8  {
    function getBalance(address addr)  public returns (uint myNumber) {
    return d8(addr).myBalance();
    }
}
