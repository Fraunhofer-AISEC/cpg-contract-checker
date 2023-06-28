pragma solidity 0.5.1;

contract Lottery {

    address payable[] public players;

    

    function getPlayerAtIndex(uint index) public view returns(address player) {
        return players[index];
    }

    function getPlayerCount() public view returns(uint count) {
        return players.length;
    }
}
