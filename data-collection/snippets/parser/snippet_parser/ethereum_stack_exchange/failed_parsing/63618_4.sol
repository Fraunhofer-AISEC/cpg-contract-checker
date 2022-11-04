pragma solidity ^0.5.16;

contract ApprovalContract {

    address public sender;
    address payable public receiver;
    address public constant approver = (your own test address);

    function deposit(address payable _receiver) external payable{
        require(msg.value > 0);
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns(address) {
        return(approver);
    }

    function approve() external {
        require(msg.sender == approver);
        address(uint160(receiver)).transfer(address(this).balance);
    }
}
