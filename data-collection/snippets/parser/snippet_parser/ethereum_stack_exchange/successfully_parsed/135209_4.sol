contract Test {

    
    uint public constant width = 2;
    uint public constant height = 3;
    uint public constant MAX_ELEMENTS = width * height;
    uint public currentIndex;

    Grid[MAX_ELEMENTS] public grids;

    struct Grid {
        uint256 index;
    }

    function addElement(uint element) public {
        
        grids[currentIndex] = Grid(element);
        ++currentIndex;
    }

    function getGrid() public view returns(Grid[MAX_ELEMENTS] memory) {
        return grids;
    }

}
