 contract Project {
 address public fundingHub; 
 address public projectCreator; 
 string public title; 
 string public description;
 uint256 public amountToBeRaised; 
 uint256 public deadline;
 uint256 public amountRaised; 

function Project(address _creator, uint256 _amountToBeRaised, uint256 _deadline, string _title, string _description) {
    if (_amountToBeRaised <= 0) { throw; }
    if (_deadline <= block.timestamp) { throw; }
    fundingHub = msg.sender;  
    projectCreator = _creator;
    title = _title; 
    description = _description; 
    amountToBeRaised = _amountToBeRaised;
    amountRaised = 0; 
    deadline = _deadline; 
}
}
