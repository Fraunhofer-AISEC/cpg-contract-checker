
pragma solidity ^0.8.16;

contract Test {

    uint[] public grid;
    uint constant width = 2;
    uint constant height = 3;
    uint constant MAX_ELEMENTS = width * height;
    uint currentIndex;

    constructor() { 
        grid = new uint[](MAX_ELEMENTS);
    }

    function addElement(uint element) public {
        
        grid[currentIndex] = element;
        ++currentIndex;
    }

    function getGrid() public view returns(uint[] memory) {
        return grid;
    }

}
