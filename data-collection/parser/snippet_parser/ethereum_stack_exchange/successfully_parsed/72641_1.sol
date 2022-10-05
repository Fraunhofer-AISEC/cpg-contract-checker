pragma solidity ^0.5.0;

contract Test {

    function comparePoints (uint player1Points, uint player2Points) public pure returns (uint) {
        uint result;

        if(player1Points > player2Points || player1Points >= 50){
            result = 1;
        }
        return result;
    }
}
