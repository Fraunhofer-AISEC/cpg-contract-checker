int public score = 0;
int constant endAt = 1 ether;
bool public gameOver = false;
**event ScoreChanged (int amount, bool direction);
event GameEnded(bool gameOver);**

function up() external payable {
    require(msg.value > 0);
    require(!gameOver);

    int value = int(msg.value);
    score += value;
    **emit ScoreChanged(value, true);**

    

    checkIfGameOver();
}

function down() external payable {
    require(msg.value > 0);
    require(!gameOver);

    int value = int(msg.value);
    score -= value;
    **emit ScoreChanged(value, false);**

    

    checkIfGameOver();
}

function checkIfGameOver() internal {
    if(score >= endAt || score <= endAt * -1) {
        gameOver = true;
      
       **emit GameEnded(gameOver);**
        
    }
}
