pragma solidity ^0.4.22;

contract MachineMapping {

    mapping(bytes32 => uint256) public machineAllocs;


    function setMachineUserId(bytes32 _machineId, uint256 _userId) {
        emit MachineUserIdSet(_machineId, machineAllocs[_machineId], _userId);
        machineAllocs[_machineId] = _userId;
    }

    event MachineUserIdSet(bytes32 indexed machineId, uint256 oldUserId, uint256 newUserId);
}
