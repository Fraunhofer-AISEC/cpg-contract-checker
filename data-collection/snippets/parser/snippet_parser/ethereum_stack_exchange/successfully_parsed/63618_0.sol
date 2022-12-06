pragma solidity ^0.4.23;

contract ApprovalContract {
address public sender;
address public receiver;

address public constant approver = 0x5AEDA56215b167893e80B4fE645BA6d5Bab767DE;

constructor() public {

}
function deposit(address _receiver) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;
}

function viewApprover() external pure returns(address){
    return(approver);
}

function viewRe() external pure returns(address){
    return(receiver);
}


function approve() external payable{
    require(msg.sender == approver);

    receiver.transfer(address(this).balance); 

}
}
