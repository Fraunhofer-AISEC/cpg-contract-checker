pragma solidity ^0.4.8;

contract Escrow {
    ....
    modifier onlyafter(uint _time) {
      require(now >= _time);
      _;
}
