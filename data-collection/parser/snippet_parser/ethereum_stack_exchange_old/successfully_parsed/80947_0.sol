pragma solidity ^0.5.16;

contract ApprovalContract {

  address public sender;
  address payable public receiver;
  address constant public approver = 0xd268143B6FBD9BC6533F778052710C962eaAa68C;

  function ApprovalContracts() public {
    
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
    receiver.transfer(address(this).balance);
  }

}
