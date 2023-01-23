pragma solidity ^0.8.0;

contract MyContract {

    event Score(
        uint date,
        string player,
        string team
    );

    function goalScored(string memory _player, string memory _team) external {
        emit Score(block.timestamp, _player, _team);
    }
}
