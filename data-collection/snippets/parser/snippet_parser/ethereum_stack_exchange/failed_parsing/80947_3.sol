 pragma solidity ^0.8.9;

 contract ApprovalContract {

 address public sender;
 address payable public receiver;
 address constant public approver = ; 

 constructor() {
 
 }

 function deposit(address _receiver) external payable {
 require(msg.value > 0);
 sender = msg.sender;
 receiver = _receiver;
 }

 function viewApprover() external pure returns(address) {
 return(approver);
 }

 function approve() external {
 require(msg.sender == approver);
 payable(receiver).transfer(address(this).balance);
 }
}
