
pragma solidity >=0.7.0;

contract Lottery {
    address public manager;
    address payable[] public players;

    constructor() {
        manager = msg.sender;
    }

    function enter() public payable {
        players.push(msg.sender);            
    }
}
