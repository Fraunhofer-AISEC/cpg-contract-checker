
address owner;


mapping(address=>bool) approvedUsers;



constructor(){
  owner = msg.sender
}



modifier isOwner(){
  require(msg.sender == owner, "Access denied");
  _;
}


function _addApprover(address _approver) public isOwner{
  approvedUsers[_approver]  = true;
function _removeApprovedUser(address _disapprover) public isOwner{
  approvedUsers[_disapprover]  = false;


function pricing(uint _rate) public{
  require(approvedUsers[msg.sender],"User not in the approvers list");
  
  
  rate = _rate * (10 ** uint256(decimals()));
}
