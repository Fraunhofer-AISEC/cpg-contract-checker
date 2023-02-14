pragma solidity v0.5.0;


contract ApprovalContracts { 

  address public sender;   
  address public receiver; 
  address public approver = 0xc7780C9521C2C2abED69f0D65BEbF9794C55ae94;  

  function deposit(address _receiver) external payable {  

    require(msg.value >0); 
    sender = msg.sender; 
    receiver = _receiver;
  }

  function viewApprover() external pure returns(address) { 
    return(approver);
  }

  function approve() external { 
    require(msg.sender == approver); 
    receiver.payable(address(this).balance);
  }

}
