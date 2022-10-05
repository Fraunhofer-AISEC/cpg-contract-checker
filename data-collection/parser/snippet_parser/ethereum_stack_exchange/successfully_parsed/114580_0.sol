contract SampleContract {      
struct GameData {
            uint256 game_id;
            address player1_wallet_address;
            address player2_wallet_address;
            string player1_call; 
            string player2_call; 
            uint256 player1_wage;
            uint256 player2_wage;
            GameStatus game_status;
            WonStatus won_status;
        }
    mapping(uint256 => GameData) public all_games;
   mapping(address => GameData[]) public player_game_mapping;





}
