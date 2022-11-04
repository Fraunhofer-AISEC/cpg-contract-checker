pragma solidity 0.4.19;

contract Test {

    mapping (uint => uint) public grid;

    function check(uint x, uint y, uint size) public {

        for(uint i = 0; i < size; i++) {
            uint row = grid[x + i];
            for(uint j = 0; j < size; j++) {
                
                if((row >> (y + j)) & uint(1) == uint(1)) {
                    
                    revert();
                }

                
                row = row | (uint(1) << (y + j)); 
            }
            grid[x + i] = row;
        }
    }
}
