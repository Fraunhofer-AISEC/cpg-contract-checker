pragma solidity >=0.4.22 <0.6.0;


contract Lottery {

    address public manager;
    address payable [] public players;

    constructor() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }

    function pickWinner() public payable restricted {
        uint index = random() % players.length;
        address payable winner = players[index];
        winner.transfer(address(this).balance);
        players = new address payable [](0);
    }

    function random() private view returns (uint) {
        return uint( keccak256(abi.encode(block.difficulty, now, players)));
    }

    modifier restricted() {
        require(msg.sender == manager, 'Your are not the manager!');
        _;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}
