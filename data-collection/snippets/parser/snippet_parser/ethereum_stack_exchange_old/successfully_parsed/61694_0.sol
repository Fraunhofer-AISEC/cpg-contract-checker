pragma solidity ^0.4.24;

contract RPS {

    uint256 previousMove;
    uint256 previousStake;
    address previousPlayer;

    function play(uint256 move) payable {

        

        if (previousMove == 0) {
            
            previousMove = move;
            previousStake = msg.value;
            previousPlayer = msg.sender;
            return;
        }

        if (previousMove == 1) {
            if (move == 2) {
                

                
                msg.sender.transfer(address(this).balance);

                
                previousPlayer.transfer(address(this).balance);
            }
        }
        

    }
}
