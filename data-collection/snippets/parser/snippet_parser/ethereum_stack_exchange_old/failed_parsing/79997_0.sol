contract Escrow {
    
    uint256 public anteAmount;
    
    address connect4;
    
    address player1;
    
    address player2;
    
    mapping(address => bool) anted;
    
    address payable winner;

    constructor(address player1, address player2, address connect4, uint256 anteAmount) public {
        player1 = player1;
        player2 = player2;
        connect4 = connect4;
        anteAmount = anteAmount;
    }

    modifier onlyConnect4() {
      require(address(msg.sender) == connect4, "Forbidden Access.");
      _;
    }

    function () external payable onlyConnect4 {
    }

    function placeAnte(address player) payable public returns (bool) {
        require(anted[player] == false, "player has already placed ante.");
        require(player == player1 || player == player2, "invalid player address.");
        require(msg.value == anteAmount, "ante unequal to required ante amount.");
        address(this).transfer(msg.value);
        anted[player] = true;
        return true;
    }
...
}

contract Connect4 {
event LogConstructorInitiated(string nextStep);
event announceWinner(string winStatement);

uint[] rows;
uint[] columns; 
uint[][][] slopes4;
uint[][][] slopes5;
uint[][][] slopes6;

constructor() public {
    emit LogConstructorInitiated("Constructor was initiated");
    rows = [1,2,3,4,5,6,7];
    columns = [1,2,3,4,5,6];
    slopes4 = [[[1,3],[2,4],[3,5],[4,6]], [[1,4],[2,3],[3,2],[4,1]], [[4,6],[5,5],[6,4],[7,3]]];
    slopes5 = [[[1,2],[2,3],[3,4],[4,5],[5,6]],[[3,1],[4,2],[5,3],[6,4],[7,5]],[[1,5],[2,4],[3,3],[4,2],[5,1]],[[3,6],[4,5],[5,4],[6,3],[7,2]]];
    slopes6 = [[[1,1],[2,2],[3,3],[4,4],[5,5],[6,6]],[[2,1],[3,2],[4,3],[5,4],[6,5],[7,6]],[[1,6],[2,5],[3,4],[4,3],[5,2],[6,1]],[[2,6],[3,5],[4,4],[5,3],[6,2],[7,1]]];
    numGames = 0;
}

uint256 numGames;
Game[] games;

struct Board {
    mapping(string => uint) state;
    uint[] rows;
    uint[] columns;
    uint[][][] slopes4;
    uint[][][] slopes5;
    uint[][][] slopes6;
}


struct Game {
    Escrow escrow;
    address winner;
    uint playersTurn;
    address[2] players;
    uint256 challengeDate;
    uint256 acceptChallengeMaxTime;
    bool challengeAccepted;
    uint256 maxStallTime;
    uint256 lastMoveTime;
    uint256 anteAmount;
    Board board;
    bool isValid;
    mapping(uint => bool) tieGameApproval;
}

  function challengeOpponent(address opponent, uint playersTurn, uint256 anteAmount, uint256 acceptChallengeMaxTime, uint256 maxStallTime) public payable returns (bool){
        require(msg.value == anteAmount*10**18, "value must be equal to specified ante amount.");
        Escrow escrow = new Escrow(msg.sender, opponent, address(this), anteAmount);
        escrow.placeAnte(msg.sender);
        address[2] memory players = [msg.sender, opponent];
        address winner;
        Board memory board = Board({rows: rows, columns: columns, slopes4: slopes4, slopes5: slopes5, slopes6: slopes6});
        Game memory game = Game({escrow: escrow, winner: winner, playersTurn: playersTurn, players: players, 
                            acceptChallengeMaxTime: acceptChallengeMaxTime, challengeDate: now, lastMoveTime: now,
                            challengeAccepted: false, maxStallTime: maxStallTime, anteAmount: anteAmount, board: board, isValid: true});
        games.push(game);
        numGames++;
        return true;
}...
