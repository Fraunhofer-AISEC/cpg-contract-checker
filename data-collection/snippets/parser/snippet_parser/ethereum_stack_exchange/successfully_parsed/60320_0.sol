
pragma solidity ^0.4.25;

contract Owned {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
}

contract taskListContract is Owned {
    struct task {
        bytes iname;
        uint16 taskid;
        bytes icode;
        
        uint ivalue;
    }

    uint taskCount;
    mapping(bytes => task) taskList;
    task[] taskArray;

    
    
    

    function addTask(bytes name, uint16 iid, bytes code, uint val) external onlyOwner{        
        task memory tasknew = task(name, iid ,code, val);
        
        taskList[code] = tasknew;
        taskArray.push(tasknew);
        taskCount++;
    }

    function countItemList() public constant returns (uint count)  {     
        return taskCount;
    }

    function removeTask(bytes code) external onlyOwner {
        delete taskList[code];
        taskCount--;
    }

    function getTask(bytes code) public constant returns (bytes iname, uint val)  {   
        return (taskList[code].iname, taskList[code].ivalue);
    }
}
