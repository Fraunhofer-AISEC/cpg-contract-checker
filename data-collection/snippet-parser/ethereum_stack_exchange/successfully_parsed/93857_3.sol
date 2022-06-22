pragma solidity ^0.5.0;

contract workReg {
  uint public workCount = 0;

  struct Work {
    uint id;
    string authorName;
    string workType; 
    string description;
    uint amount;
  }

  mapping(uint => Work) public works;

  constructor() public {
    createWork("Heba","Book", "IP blockchain book", 100);
  }

  function createWork(string memory _authorName, string memory _workType, string memory _description, uint  _amount ) public {
    workCount ++;
    works[workCount] = Work(workCount, _authorName,_workType, _description, _amount);
  }

 function getID() view public returns(uint){
    
    return  works[workCount].id;
}


 function getworkType() view public returns(string memory){
    
    return  works[workCount].workType;
} 


 function getdescription() view public returns(string memory){
    
    return  works[workCount].description;
} 

function getAmount() view public returns(uint){
    
    return  works[workCount].amount;
}

}
