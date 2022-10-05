struct game = {
   address [] teamAVotes;
   address [] teamBVotes;
   address [] teamCVotes;
}
mapping(uint256 => game) games;
mapping(uint256 => mapping(address => uint256)) betForGame;
mapping(uint256 => uint256) betPoolForGame;
mapping(uint256 => bool) betPoolOpen;

function voteNow(uint256 gameId, uint256 vote) public payable {
    require(vote==1 || vote==2 || vote==3);
    require(betPoolOpen[gameId]);
    betForGame[gameId][msg.sender] = msg.value;
    vote==1 ? 
        gameId[gameId].teamAVotes = msg.sender
        : vote==2 ? 
        gameId[gameId].teamBVotes = msg.sender
        :
        gameId[gameId].teamCVotes = msg.sender;
    betPoolForGame[gameId] += msg.value;
}

function payOut(uint256 gameId, uint256 vote) public {
    require(vote==1 || vote==2 || vote==3);
    require(!betPoolOpen[gameId]);
    address [] memory winners = vote==1 ? 
        gameId[gameId].teamAVotes
        : vote==2 ? 
        gameId[gameId].teamBVotes
        :
        gameId[gameId].teamCVotes;
    
}
