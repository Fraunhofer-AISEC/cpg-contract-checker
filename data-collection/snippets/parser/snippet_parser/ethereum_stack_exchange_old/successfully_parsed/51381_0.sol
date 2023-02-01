
function guessIt(uint _guess) public returns (bool) {
  
  require(_guess <= range);
  uint random = generateRandomNumber(range);
  
  if (random == _guess) {
    Guess storage correctGuess = guesses[msg.sender];

    correctGuess.lastGuess = _guess;
    correctGuess.lastCorrectGuess = _guess;
    correctGuess.correctGuessCount = correctGuess.correctGuessCount + 1;
    correctGuess.lastGuessAt = now;
    totalNoOfGuesses = totalNoOfGuesses + 1;

    Guessed(msg.sender,random, _guess);

    return true;

   } else {
     Guess storage wrongGuess = guesses[msg.sender];

     wrongGuess.lastGuess = _guess;
     wrongGuess.wrongGuessCount = wrongGuess.wrongGuessCount + 1;
     wrongGuess.lastGuessAt = now;
     totalNoOfGuesses = totalNoOfGuesses + 1;

     Guessed(msg.sender,random, _guess);
   }
   return false;
}
