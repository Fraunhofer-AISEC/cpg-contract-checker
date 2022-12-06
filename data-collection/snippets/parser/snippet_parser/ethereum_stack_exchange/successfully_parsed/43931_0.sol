pragma solidity 0.4.17;
contract TugOfWar {

    int public score = 0;
    int constant endAt = 1 ether;
    bool public gameOver = false;
    bool public _direction;
    
    event ScoreChanged(int _amount, bool _direction);
    event GameEnded(bool _gameOver);

    function up() external payable {
        require(msg.value > 0);
        require(!gameOver);

        int value = int(msg.value);
        score += value;

         ScoreChanged(value,true);

        checkIfGameOver();
    }

    function down() external payable {
        require(msg.value > 0);
        require(!gameOver);

        int value = int(msg.value);
        score -= value;

         ScoreChanged(value,false);

        checkIfGameOver();
    }

    function checkIfGameOver() internal {
        if(score >= endAt || score <= endAt * -1) {
            gameOver = true;
             GameEnded(gameOver);
        }
    }
}
