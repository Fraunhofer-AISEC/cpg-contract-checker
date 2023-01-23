pragma solidity ^0.5.0;

contract lottery {

    address public manager;
    address[] public players;

    constructor() public{
        manager = msg.sender;
    }

    modifier restricted(){
        require(msg.sender == manager);
        _;
    }

    function enterLottery() public payable {
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }

    function random() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty,now,players)));
    }

    function pickWinner() public restricted{

        uint index = random() % players.length;
        address winner = players[index];
        players = new address[](0);

        winner.transfer(address(this).balance);
    }

    function getPlayers() public view returns(address[] memory){
        return players;
    }  
} 
