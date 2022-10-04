
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
    address public receiver;

    struct task {
        string iName;
        uint16 taskId;
        address smartContract;
        bool iValue;
    }

    uint taskCount;
    mapping(address => task) taskList;
    task[] taskArray;

    function addTask(string name, uint16 id, address code) external onlyOwner{
        receiver = msg.sender;
        task memory tasknew = task(name, id ,code, false);
        taskList[receiver] = tasknew;
        taskArray.push(tasknew);
        taskCount++;
    }


    function updateUserTask(bool _value) public{
        task storage individualUser =taskList[receiver];
        individualUser.iValue = _value;
    }



    function countItemList() public constant returns (uint count)  {     
        return taskCount;
    }

    function removeTask() external onlyOwner {
        delete taskList[msg.sender];
        taskCount--;
    }

    function getTask() public constant returns (string iName, bool iValue, uint count)  {   
        return (taskList[msg.sender].iName, taskList[msg.sender].iValue, taskCount);
    }
}
