

pragma solidity >=0.7.0 <0.8.0;

contract Lottery {
    address public manager;
    address[] public players;

    constructor() {
        
        manager = msg.sender;
    }

    modifier restrictedToManager() {
        require(
            msg.sender == manager,
            "This function is restricted to the manager"
        );
        _;
    }

    function enter() public payable {
        
        require(
            msg.value >= 0.01 ether,
            "Players must stake at least 0.01 ether to be entered into the lottery"
        );

        players.push(msg.sender);
    }

    function random() private view returns (uint256) {
        
        return
            uint256(
                keccak256(
                    abi.encodePacked(block.difficulty, block.timestamp, players)
                )
            );
    }

    function pickWinner() public payable restrictedToManager {
        
        uint256 index = random() % players.length;

        
        payable(players[index]).transfer(address(this).balance);

        
        players = new address[](0);
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}
