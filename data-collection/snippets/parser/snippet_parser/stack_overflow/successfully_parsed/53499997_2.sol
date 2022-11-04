
pragma solidity ^0.8.9;

contract Lottery {
    address public manager;
    address payable[] public players;
    
    constructor() { }

    function lottery() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(payable(msg.sender));
    }

    function random() public view returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players)))%251);
    }

    function pickWinner() public {
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
    }
}
