struct Game {
    uint betId;  
    State state;
    
    }
uint256 public gameId = 0;
mapping(uint => Game) public gameInfo;
enum State {Not_Created, Created, Joined, Finished}

function newGame(uint256 numGame) external  onlyAgent {
        
        for (uint256 n = 0; n < numGame; n++){
        gameInfo[gameId] = Game(gameId, State.Created);
        gameId++;
     }
    }
