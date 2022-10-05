
pragma solidity ^0.8.0;

contract Lottery {

    address payable[] public s_players; 

    function enterLottery(uint _tickets) public payable returns (address payable[] memory) {
        uint lotteryCost = _tickets*500000000 gwei;
        require(msg.value >= lotteryCost, 'Ticket cant be purchased');
        address payable[] memory _players = s_players;
        uint length = _players.length;
        for (uint x = 0; x < _tickets; x = unsafe_inc(x)){
            _players[length] = payable(msg.sender); 
            length += 1;
        }
        s_players = _players;
        
        return s_players;
    }
}
