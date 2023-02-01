 pragma solidity ^0.4.16;

contract d7 {
    function getBalance(address addr) pure public returns (uint) {
        d8 bg = d8(addr);
    return bg.myBalance();
    }
}

contract d8 {
    function myBalance() pure  returns (uint);

}
