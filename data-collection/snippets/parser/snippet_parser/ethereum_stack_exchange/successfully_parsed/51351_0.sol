contract GuessNumber {

  uint public range;
  uint public totalNoOfGuesses;

  
  struct Guess {
    uint lastGuess;
    uint lastCorrectGuess;
    uint correctGuessCount;
    uint wrongGuessCount;
    uint lastGuessAt;
  }

  mapping(address => Guess) public guesses;

  event Guessed (
    address indexed _from,
    uint _randomNumber,
    uint _guess
  );

  
  function GuessNumber(uint _range) public {
    range = _range;
  }

  
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

  function generateRandomNumber(uint _range) public returns (uint) {
    return uint(sha3(block.timestamp)) % _range;
  }

}
