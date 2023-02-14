pragma solidity ^0.5.1;

contract MyContract {
    struct dog {
        string name;
        string ownername;
        int8 age;
    }

    dog[3] dogarray;

    function setIndex(
        uint256 index,
        string memory name,
        string memory ownername,
        int8 age
    ) public {
        dogarray[index].name = name;
        dogarray[index].ownername = ownername;
        dogarray[index].age = age;
    }
}
