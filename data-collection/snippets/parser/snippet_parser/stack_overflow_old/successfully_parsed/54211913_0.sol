pragma solidity  ^0.5.2;

contract Lottery {
    address public manager;
    address payable[] public players;

    constructor () public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }

    
    
    

    function random() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, now, players)));
    }

    function pickWinner() public {
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address[](0); 
    }
}
