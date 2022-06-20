pragma solidity ^0.4.2;

contract SubjectContract {
    uint public count = 0;

    function increaseCount() returns (uint newCount) {
        count ++;
        newCount = count;
    }
}
