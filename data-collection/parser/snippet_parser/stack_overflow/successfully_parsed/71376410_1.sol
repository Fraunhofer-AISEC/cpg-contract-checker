pragma solidity ^0.8.6;

contract RecordData {
    
    struct Task {
        uint id;
        uint256 stackAddress;
        uint256 nftId;
    }
    
    Task[] tasks;
    uint nextId; 
    
    function createTask(uint256 _stackAddress, uint256  _nftId) public {
        tasks.push(Task(nextId, _stackAddress, _nftId));
        nextId++;
    }

    
    function findIndex(uint _id) internal view returns (uint) {
        for (uint i = 0; i < tasks.length; i++) {
            if (tasks[i].id == _id) {                
                return i;
            }
        }
        revert("Task not found");
    }
    
    function updateTask(uint _id, uint256 _stackAddress, uint256 _nftId) public {
        uint index =  findIndex(_id);
        tasks[index].stackAddress = _stackAddress;
        tasks[index].nftId = _nftId;
    }
    
    function readTask(uint _id) public view returns (uint, uint256, uint256) {
        uint index = findIndex(_id);
        return (tasks[index].id, tasks[index].stackAddress, tasks[index].nftId);
    }
    
    function deleteTask(uint _id) public {
        uint index = findIndex(_id);
        delete tasks[index];
    }
    
}
