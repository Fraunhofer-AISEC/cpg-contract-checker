pragma solidity ^0.4.11;
import "browser/TrustEntity.sol";

contract User {
    
    
    TrustEntity trustEntity;
    address owner = msg.sender;
    bool verified = false;
    uint creationTime = now;
    uint level = 0;

    
    function User(address _trustEntity) {
        trustEntity = TrustEntity(_trustEntity);
    }

    function requestValidation() {
        trustEntity.pendingRequests.push(owner);
    }
}
