string[] public listOfTasks; 

function addTasks(string memory task) public {
        listOfTasks.push(task);
    }

function showTasks() public view returns(string[] memory){
        return listOfTasks;
    }
