
pragma solidity >=0.5.0 <0.7.0;

contract ApprovalContract{
    address public sender;
    address payable public receiver;
    address public constant approver = 0x9BE32C0CB7910d71CA2c2a7D6B46ebd273dA01eC;
    function deposit(address payable _receiver) external payable{
        require(msg.value>0,"message smaller than 0");
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns(address){
        return(approver);
    }

    function approve() external{
        require(msg.sender == approver,"message is approved");
        receiver.transfer(address(this).balance);
    }
}
