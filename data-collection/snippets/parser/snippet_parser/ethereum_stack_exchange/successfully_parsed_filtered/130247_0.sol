struct task {
        string description;
        status taskStatus;
        address assignedTo;
        uint deadline;
        mapping (address => bool) allocation;
    }
  

function setTask (string memory _desc , address[] calldata _copartner , uint _deadline) external  {
      
       
        TaskList.push(task({description : _desc , taskStatus : status.Set , assignedTo : msg.sender , deadline : block.timestamp + _deadline }));
 }
