pragma solidity ^0.4.16;

contract TestContract {

    function add(uint256 amount) returns (uint256) {
       require(amount > 0);

       return 100 + amount;
    }
}
