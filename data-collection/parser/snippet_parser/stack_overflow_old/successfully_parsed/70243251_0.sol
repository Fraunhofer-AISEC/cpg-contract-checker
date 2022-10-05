pragma solidity ^0.8;

contract MyContract {
    enum Status {
        Vacant,
        Occupied
    }

    Status currentStatus;

    
    function setCurrentStatus(Status _currentStatus) external {
        currentStatus = _currentStatus;
    }

    function getCurrentStatusVerbose() external view returns (string memory) {
        if (currentStatus == Status.Vacant) {
            return "The current status is Vacant";
        } else if (currentStatus == Status.Occupied) {
            return "The current status is Occupied";
        }
    }
}
