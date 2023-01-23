pragma solidity 0.4.19;


contract Test {

    mapping (uint => bool[40]) public grid;

    function check(uint x, uint y, uint size) public {

        for(uint i = 0; i < size; i++) {
            for(uint j = 0; j < size; j++) {

                if(grid[x + i][y + j]) {
                    
                    revert();
                }

                grid[x + i][y + j] = true;

            }
        }
    }

}
