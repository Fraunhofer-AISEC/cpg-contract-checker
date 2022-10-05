pragma solidity ^0.5.0;

contract ApprovalContract {
    address payable public sender;
    address payable public receiver;
    address public constant approver = 0x3999BA5D247c800E5Ef3d4de66618741E3675379 ;

function deposit(address _receiver) external payable {

    require (msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;   
    }

function viewApprover () external pure returns(address) {
    return(approver);
    }

function approve() external {
        require(msg.sender == approver);
        receiver.transfer(address(this).balance);
        
    }
}
