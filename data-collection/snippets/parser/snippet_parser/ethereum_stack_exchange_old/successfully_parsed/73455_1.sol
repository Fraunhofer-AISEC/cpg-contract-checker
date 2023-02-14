pragma solidity ^0.5.0;

contract D {

    function delegatecallSetN(address _e, uint _n) public returns (uint, bytes32, uint, string memory) {
        bytes memory data = abi.encodeWithSelector(bytes4(keccak256("setN(uint256)")), _n);
        (bool success, bytes memory returnedData) = _e.delegatecall(data);
        require(success);
        return abi.decode(returnedData, (uint, bytes32, uint, string));
    }
}

contract E {

    uint public n;
    struct User {
        uint id;
        string name;
    }

    mapping (address => User) users;

    function setN(uint _n) public returns (uint, bytes32, uint, string memory) {
        bytes32 dataBytes = 0x111122223333444455556666777788889999AAAABBBBCCCCDDDDEEEEFFFFCCCC;
        n = _n;
        users[msg.sender] = User(123, "mystring");
        return (n, dataBytes, users[msg.sender].id, users[msg.sender].name);
    }
}
