pragma solidity >=0.4.22 <0.9.0;

contract myTodoList {

    
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    
    mapping(uint => Task) public Tasks;
    
    
    uint public TasksCount = 0;

    function addTask (string memory _content) public {
        TasksCount ++;
        Tasks[TasksCount] = Task(TasksCount, _content, false);
    }
    
    Task TaskTemp;
    
    function deductTask (string memory _contentClicked) public {
        string memory comparedContent;
        uint i ;
        for(i = 1; i <= TasksCount; i++) {
             TaskTemp = Tasks[i];
             comparedContent = TaskTemp.content;

             comparedContent = keccak256(abi.encodePacked(comparedContent));
             
             _contentClicked = keccak256(abi.encodePacked(_contentClicked));
             

             if(_contentClicked == comparedContent ){
                 delete Tasks[i];
              }
        }
        TasksCount --;   
    }

    
    constructor () public {
        addTask("my first task");
        addTask("my second task");
    }

}
