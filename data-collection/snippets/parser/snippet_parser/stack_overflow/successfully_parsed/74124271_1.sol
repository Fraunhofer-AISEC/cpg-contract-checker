import "./Game.sol";

contract Bet {
    Game public game;
    constructor(address _gameAddress) {
        game = Game(_gameAddress);
    }

    
    function calculatePayout(uint amount, int scoreDifference) private pure returns(uint) {
        uint abs = uint(scoreDifference > 0 ? scoreDifference : scoreDifference * -1);  
        uint odds = 2 ** abs;
        if(scoreDifference < 0) {
            return amount + amount / odds;
        }
        return amount + amount * odds;
    }

    function getScoreDifference(Game.Teams x) public view returns (int256) {
        if (x == Game.Teams.Team1) {
            return game.team1Score() - game.team2Score();
        } else if (x == Game.Teams.Team2) {
            return game.team2Score() - game.team1Score();
        } return game.team1Score();
    }

    function placeBet(Game.Teams x) external payable returns (uint256) {

    }
}
