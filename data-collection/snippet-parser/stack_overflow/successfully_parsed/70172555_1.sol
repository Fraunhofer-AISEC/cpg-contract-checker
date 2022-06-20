

pragma solidity >=0.7.0;

contract Lottery {
    address payable public manager;
    address payable[] public players;
    
    constructor() {
        manager = payable(msg.sender);
    }
    
    function enter() public payable {
        players.push(manager);
    } 
}
