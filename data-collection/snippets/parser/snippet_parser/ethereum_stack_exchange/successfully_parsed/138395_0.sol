
pragma solidity >=0.8.0 <0.9.0;

contract Indexes {

uint[10] public across = [1, 8, 5, 7, 2, 6, 9, 0, 4, 3];
uint[10] public down = [8, 1, 4, 2, 7, 3, 0, 9, 5, 6]; 
mapping(uint256 => uint) public acrossIndexes;
mapping(uint256 => uint) public downIndexes;
uint[4] homeScores = [0,3,10,17];
uint[4] awayScores = [0,10,20,26];
uint[] public results;
Cell[] public cells;

struct Cell {
    uint row;
    uint cell;
}

function getIndexes() public {
    for(uint256 i = 0; i < 10; i++) {
    acrossIndexes[across[i]] = i;
    downIndexes[down[i]] = i;
    }
}

function gameScoreLoop() public {
    for (uint i = 0; i < 4; i++) {
        uint lastHDigit = homeScores[i] % 10;
        uint lastADigit = awayScores[i] % 10;
        uint fRow = downIndexes[lastADigit];
        uint fCell = acrossIndexes[lastHDigit];
        uint bRow = downIndexes[lastHDigit];
        uint bCell = acrossIndexes[lastADigit];
        Cell memory fC;
        Cell memory bC;
        fC.row = fRow;
        fC.cell = fCell;
        cells.push(fC);
        bC.row = bRow;
        bC.cell = bCell;
        cells.push(bC);

        }
    }

}
