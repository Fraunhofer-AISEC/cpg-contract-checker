pragma solidity >=0.7.0 <0.9.0;

contract SomeContract {

    uint256 public id;
    address public creator;

    enum Status {ACTIVE, INACTIVE}

    Status contractStatus;

    modifier checkStatus {

        require(contractStatus == Status.ACTIVE);

        _;

    }

    modifier onlyCreator {
    
        require(msg.sender == creator);

        _;

    }

    constructor() {

        contractStatus = Status.ACTIVE;
        creator = msg.sender;

    }

    function doSomething() external checkStatus {

        

    }

    function changeStatus(bool _isActive) external onlyCreator {

        if (_isActive) {
            contractStatus = Status.ACTIVE;
        } else {
            contractStatus = Status.INACTIVE;
        }
        
    }}

}
