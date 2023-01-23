
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/VRFV2WrapperConsumerBase.sol";

contract RandomWinnerGame is Ownable {

    
    
    uint256 public fee;

    
    address[] public players;
    
    uint8 maxPlayers;
    
    bool public gameStarted;
    
    uint256 entryFee;
    
    uint256 public gameId;

    
    
    
    
    
    uint32 callbackGasLimit = 400000;

    
    uint16 requestConfirmations = 3;

    
    
    uint32 numWords = 1;

    
    event GameStarted(uint256 gameId, uint8 maxPlayers, uint256 entryFee);
    
    event PlayerJoined(uint256 gameId, address player);
    
    event GameEnded(uint256 gameId, address winner, uint256 requestId);

   
    constructor(address wrapperAddress, address linkToken, uint256 vrfFee)
    VRFV2WrapperConsumerBase(linkToken, wrapperAddress) {
        fee = vrfFee;
        gameStarted = false;
    }

    
    function startGame(uint8 _maxPlayers, uint256 _entryFee) public onlyOwner {
        
        require(!gameStarted, "Game is currently running");
        
        delete players;
        
        maxPlayers = _maxPlayers;
        
        gameStarted = true;
        
        entryFee = _entryFee;
        gameId += 1;
        emit GameStarted(gameId, maxPlayers, entryFee);
    }

    
    function joinGame() public payable {
        
        require(gameStarted, "Game has not been started yet");
        
        require(msg.value == entryFee, "Value sent is not equal to entryFee");
        
        require(players.length < maxPlayers, "Game is full");
        
        players.push(msg.sender);
        emit PlayerJoined(gameId, msg.sender);
        
        if(players.length == maxPlayers) {
            getRandomWinner();
        }
    }

    
    function fulfillRandomness(uint256 requestId, uint256[] memory randomness) internal virtual override  {
        
        
        uint256 winnerIndex = randomness[0] % players.length;
        
        address winner = players[winnerIndex];
        
        (bool sent,) = winner.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
        
        emit GameEnded(gameId, winner, requestId);
        
        gameStarted = false;
    }

    
    function getRandomWinner() private returns (uint256 requestId) {
        
        
        
        return requestRandomness(
            callbackGasLimit,
            requestConfirmations,
            numWords
        );
    }

     
    receive() external payable {}

    
    fallback() external payable {}
}
