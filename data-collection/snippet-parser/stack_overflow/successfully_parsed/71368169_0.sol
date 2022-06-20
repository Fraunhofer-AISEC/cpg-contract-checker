
pragma solidity 0.8.12;

contract Lottery {
    address payable public manager;
    address payable[] public players;

    constructor() {
        manager = payable(msg.sender);
    }

    function enterLottery() public payable {
        require(msg.value >= .01 ether);
        players.push(payable(msg.sender));
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    function random() public view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(block.difficulty, block.timestamp, players)
                )
            );
    }

    function pickWinner() public { 
        uint256 index = random() % players.length;
        players[index].transfer(address(this).balance);
    }
}

