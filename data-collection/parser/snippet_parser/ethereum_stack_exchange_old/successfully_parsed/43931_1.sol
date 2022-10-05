pragma solidity ^0.4.17;

contract TugOfWar {

    int public score = 0;
    int constant endAt = 1 ether;
    bool public gameOver = false;
    event GameEnded(bool gameOver);
    event ScoreChanged(int amount,bool direction);

    function up() external payable {
        require(msg.value > 0);
        require(!gameOver);

        int value = int(msg.value);
        int amount= value;
        bool direction=true;
        score += value;

        
        emit ScoreChanged(amount,direction);

        checkIfGameOver();
    }

    function down() external payable {
        require(msg.value > 0);
        require(!gameOver);

        int value = int(msg.value);
        int amount=value;
        bool direction=false;
        score -= value;

        
        emit ScoreChanged(amount,direction);

        checkIfGameOver();
    }

    function checkIfGameOver() internal {
        if(score >= endAt || score <= endAt * -1) {
            gameOver = true;

            
            emit GameEnded(gameOver);
        }
    }
}
