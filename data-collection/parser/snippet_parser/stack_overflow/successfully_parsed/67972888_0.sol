pragma solidity ^0.6.12;

contract EventTest {
    address public router;
    event RouterUpdated(address indexed newAddress);
    
    function setRouter(address newAddress) public {
        router = newAddress;
        emit RouterUpdated(newAddress);
    }
}
