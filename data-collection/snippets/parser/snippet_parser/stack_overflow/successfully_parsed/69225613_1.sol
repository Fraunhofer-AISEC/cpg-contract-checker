pragma solidity ^0.8;

contract MyContract {
    address[] winnerAddresses; 

    function setStore(address[] memory _winnerAddresses) public {
        winnerAddresses = _winnerAddresses;
    }
}
