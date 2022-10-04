pragma solidity ^0.5.0;

contract Lottery {
    address public manager;
    address[] public players;

    constructor() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }

    function random() private view returns(uint) {
        return uint(keccak256(block.difficulty, now, players));
    }

    function winner() public restricted {
        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }

    function allplayers() public {
        return players;
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
}
