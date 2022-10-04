pragma solidity ^0.4.0;
import "./DataStore.sol";

contract Organisation {

    function borrowBook(address bookStore, uint id) payable {
        DataStore(bookStore).borrowEvent(id, msg.sender);
    }
}
