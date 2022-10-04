    pragma solidity ^0.8.13;

contract Lottery {
    address public manager;
    address payable[] public players;

    function myLottery() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .001 ether);
        players.push(payable(msg.sender));
    }

    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    function pickWinner() public restricted{
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);  
        players = new address payable[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}
