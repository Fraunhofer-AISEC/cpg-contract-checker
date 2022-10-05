pragma solidity ^0.4.11;
import "./TrustEntity.sol";

contract User {
    
    TrustEntity trustEntity;
    address owner = msg.sender;
    bool verified = false;
    uint creationTime = now;
    uint level = 0;
    address[] public pendingRequests;

    
    function User(address _trustEntity) {
        trustEntity = TrustEntity(_trustEntity);
    }

    function requestValidation() {
        trustEntity.pushPending(owner);
    }
}
