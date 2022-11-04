pragma solidity ^0.4.18;

contract A {
    string public name;

    function A(string _name) public {
        name = _name;
    }

    function getName() public view returns (string) {
        return name;
    }
}

contract handleArray {
    uint public arrIndex;

    mapping(uint => address) testArray;

    function handleArray() public {
        arrIndex = 0;
    }

    function newEntry(address _newA) public {
        testArray[arrIndex] = A(_newA);
        arrIndex++;
    }

    function returnEntry(uint _index) public returns (string) {
        return A(testArray[_index]).getName();
    }
}
