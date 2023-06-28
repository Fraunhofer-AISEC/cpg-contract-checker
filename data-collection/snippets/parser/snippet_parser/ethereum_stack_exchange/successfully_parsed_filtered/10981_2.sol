pragma solidity ^0.4.2;

contract SubjectContract {
    function increaseCount() returns (uint newCount);
}

contract Master {
    bool public isActive=false;
    uint public num=0;

    function changeState() returns (bool newState) {
        isActive = !isActive;
        newState = isActive;
    }

    function increaseSubjectCount(address subjectAddr) returns (uint newCount) {
        SubjectContract subjectContract = SubjectContract(subjectAddr);
        newCount = subjectContract.increaseCount();
    }
}
