pragma solidity ^0.8;

contract MyContract {
    
    
    mapping(address => bool) winnerAddresses;

    function setStore(address[] memory _winnerAddresses) public {
        for (uint i = 0; i < _winnerAddresses.length; i++) {
            winnerAddresses[_winnerAddresses[i]] = true;
        }
    }
}
