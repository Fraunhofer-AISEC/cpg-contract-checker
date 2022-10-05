pragma solidity ^0.4.11;
import "./User.sol";

contract TrustEntity {
    address owner;
    address registry;
    address[] pendingRequests;

    function pushPending(address requester) {
        pendingRequests.push(requester);
    }
}
