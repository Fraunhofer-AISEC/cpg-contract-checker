
pragma solidity ^0.8.0;

contract Lottery{

    address[] public s_players; 

    function enterLottery(uint _tickets) public payable returns (address[] memory) {
        uint lotteryCost = _tickets*250000000000000000;
        address sender = msg.sender;
        require(msg.value >= lotteryCost, 'Ticket cant be purchased');
        address[] memory _players = new address[](1000);
        _players = s_players;
        uint index = _players.length;
        for (uint x = 0; x < _tickets; x++){
            _players[index] = payable(sender); 
            index += 1;
        }
        s_players = _players;
        
        return s_players;
    }
}
